'use strict';
// Port of Launcher.bat's start_database loop: install/update world, characters,
// accounts, logs, bots, website db, maps and core until everything matches the
// versions in Launcher.bat.
const path = require('path');
const fs = require('fs');
const { spawnSync } = require('child_process');
const { IS_WIN, exists, isDir, mkdirp, rmrf, rmFile, copyFile } = require('../util');

const RELEASES = 'https://github.com/celguar/spp-classics-cmangos/releases/download/v2.0';
const LOCALE_KEYS = ['fr', 'de', 'ko', 'ch', 'mx', 'ru', 'tw', 'es'];
const MODULE_SIZES = { vanilla: '~750 MB', tbc: '~1000 MB', wotlk: '~1500 MB' };

function helpers(L, exp) {
  const E = L.exp(exp);
  const sql = L.P.sql(exp);
  const f = name => path.join(sql, name);
  const apply = (ctx, file, db) => L.tools.sqlFile(ctx, f(file), db);
  // updates/<folder>/<n>/*.sql for n = from+1 .. to
  const updates = async (ctx, folder, from, to, db) => {
    for (let n = from + 1; n <= to; n++) await L.tools.sqlDir(ctx, path.join(sql, 'updates', folder, String(n)), db);
  };
  return { E, D: E.db, T: E.versions, sql, f, apply, updates };
}

async function extractWorld(L, ctx, exp) {
  const { sql, f } = helpers(L, exp);
  if (!exists(f('world.sql'))) {
    ctx.log('Extracting world db...');
    await L.tools.extract(ctx, f('world.7z'), sql, 'world db');
  }
}

async function botsCaches(L, ctx, exp) {
  const { D, sql, apply } = helpers(L, exp);
  ctx.log('Updating bots equip cache...');
  const pb = path.join(sql, 'playerbot');
  await L.tools.extract(ctx, path.join(pb, 'characters_ai_playerbot_equip_cache.7z'), pb, 'equip cache');
  await apply(ctx, 'playerbot/characters_ai_playerbot_equip_cache.sql', D.characters);
  await apply(ctx, 'playerbot/characters_ai_playerbot_rnditem_cache.sql', D.characters);
  await apply(ctx, 'playerbot/characters_ai_playerbot_rarity_cache.sql', D.characters);
}

function clearLocaleFlags(L, exp) {
  for (const k of LOCALE_KEYS) { L.flags.del(`${exp}_${k}.spp`); L.flags.del(`${exp}_${k}_re.spp`); }
}

// :update_install - fresh install of every database
async function installFresh(L, ctx, exp) {
  const { E, D, T, sql, apply, updates } = helpers(L, exp);
  if (!L.flags.has(L.flags.versionFile(exp, 'maps'))) await checkModules(L, ctx, exp);
  await extractWorld(L, ctx, exp);
  ctx.log('Installing world db (this takes a while)...');
  await apply(ctx, 'drop_world.sql');
  await apply(ctx, 'world.sql', D.world);
  ctx.log('Installing characters db...');
  await apply(ctx, 'drop_characters.sql');
  await apply(ctx, 'characters.sql', D.characters);
  ctx.log('Installing logs db...');
  await apply(ctx, 'drop_logs.sql');
  await apply(ctx, 'logs.sql', D.logs);
  ctx.log('Installing accounts db...');
  await apply(ctx, 'drop_realmd.sql');
  await apply(ctx, 'realmd.sql', D.login);
  await apply(ctx, 'realmlist.sql', D.login);
  ctx.log('Applying world db mods...');
  await L.tools.sqlDir(ctx, path.join(sql, 'world'), D.world);
  ctx.log('Applying characters db updates...');
  await updates(ctx, 'characters', 0, T.chars, D.characters);
  ctx.log('Applying characters db mods...');
  await L.tools.sqlDir(ctx, path.join(sql, 'characters'), D.characters);
  ctx.log('Applying accounts db updates...');
  await updates(ctx, 'realmd', 0, T.realm, D.login);
  ctx.log('Applying accounts db mods...');
  await L.tools.sqlDir(ctx, path.join(sql, 'realmd'), D.login);
  ctx.log('Updating bots travel paths...');
  await apply(ctx, 'world/ai_playerbot_travel_nodes.sql', D.world);
  ctx.log('Updating bots texts...');
  await apply(ctx, 'world/ai_playerbot_texts.sql', D.world);
  await botsCaches(L, ctx, exp);
  rmFile(path.join(sql, 'world.sql'));
  L.flags.write(`${E.sppUpdate}.spp`, `${E.sppUpdate} `);
  L.flags.setVersion(exp, 'world', T.world);
  L.flags.setVersion(exp, 'chars', T.chars);
  L.flags.setVersion(exp, 'realm', T.realm);
  if (T.logs !== 0) L.flags.setVersion(exp, 'logs', T.logs);
  L.flags.setVersion(exp, 'bots', T.bots);
}

// :check_modules - maps/vmaps/mmaps/dbc, downloaded on first use
async function checkModules(L, ctx, exp) {
  const { E, T } = helpers(L, exp);
  const dir = path.join(L.P.modules, exp);
  if (isDir(path.join(dir, 'maps'))) {
    ctx.log(`Existing ${E.short} maps found.`);
  } else {
    const archive = path.join(L.P.modules, `${exp}.7z`);
    if (!exists(archive)) {
      ctx.log(`Downloading ${E.short} module (${MODULE_SIZES[exp]})...`);
      await L.tools.download(ctx, `${RELEASES}/${exp}.7z`, archive, `${E.short} module`);
    }
    ctx.log(`Extracting ${E.short} module...`);
    await L.tools.extract(ctx, archive, dir, `${E.short} module`);
    rmFile(archive);
  }
  L.flags.setVersion(exp, 'maps', T.maps);
}

// :update_maps / :move_maps
async function updateMaps(L, ctx, exp) {
  const { E, T } = helpers(L, exp);
  const dir = path.join(L.P.modules, exp);
  if (isDir(path.join(L.P.legacyModules, exp, 'dbc'))) {
    ctx.log('Modules are now kept in the Server folder, moving them...');
    mkdirp(L.P.modules);
    fs.cpSync(L.P.legacyModules, L.P.modules, { recursive: true, force: true });
    if (!isDir(path.join(dir, 'dbc'))) throw new Error('Failed to move Modules folder!');
    await rmrf(L.P.legacyModules);
  } else {
    ctx.log(`Maps update required: ${L.flags.current(exp, 'maps')} -> ${T.maps}`);
    const archive = path.join(L.P.modules, `${exp}.7z`);
    await L.tools.download(ctx, `${RELEASES}/${exp}.7z`, archive, `${E.short} module`);
    await rmrf(dir);
    ctx.log(`Extracting ${E.short} module...`);
    await L.tools.extract(ctx, archive, dir, `${E.short} module`);
    rmFile(archive);
  }
  L.flags.setVersion(exp, 'maps', T.maps);
}

// :missing_core / :update_core - binaries ship in Bin64/Bin64.7z (Windows) and
// Linux64/Linux64.7z (Linux, built by .github/workflows/linux-binaries.yml)
function canExtractCore(L, exp) {
  return !L.P.customBin(exp) && exists(L.P.binArchive(exp));
}

async function extractCore(L, ctx, exp) {
  const bin = path.dirname(L.P.binArchive(exp));
  ctx.log(`Extracting ${L.exp(exp).short} binaries...`);
  await L.tools.extract(ctx, L.P.binArchive(exp), bin, 'binaries');
  if (!IS_WIN) {
    for (const f of ['mangosd', 'realmd']) { try { fs.chmodSync(path.join(bin, f), 0o755); } catch { /* not in archive */ } }
    return;
  }
  ctx.log('Copying debug info...');
  copyFile(path.join(bin, 'mangosd.pdb'), L.P.settings(exp));
  const peupdate = path.join(L.P.tools, 'peupdate.exe');
  if (exists(peupdate)) spawnSync(peupdate, ['-k', path.join(bin, 'mangosd.exe')], { windowsHide: true });
  rmFile(path.join(bin, 'mangosd.pdb'));
}

function linuxBuildHint(L, exp) {
  return L.P.customBin(exp)
    ? `Using your own build from ${L.P.bin(exp)} (binaries.${exp} in WebLauncher/config.json).`
    : `No Linux binaries in ${L.P.binArchive(exp)}. Run the "Linux Binaries" GitHub workflow, or build CMaNGOS yourself and set binaries.${exp} in WebLauncher/config.json.`;
}

async function ensureCore(L, ctx, exp) {
  if (exists(L.P.mangosd(exp))) return;
  if (canExtractCore(L, exp)) {
    ctx.log(`Missing ${L.exp(exp).short} binaries!`, 'warn');
    await extractCore(L, ctx, exp);
    L.flags.setVersion(exp, 'core', L.exp(exp).versions.core);
    return;
  }
  if (IS_WIN) throw new Error(`mangosd.exe and Bin64.7z are missing from ${L.P.bin(exp)}`);
  // Databases can still be installed; starting the server checks again.
  ctx.log(`mangosd was not found in ${L.P.bin(exp)}. ${linuxBuildHint(L, exp)}`, 'warn');
}

async function updateCore(L, ctx, exp) {
  const { T } = helpers(L, exp);
  ctx.log(`Core update required: ${L.flags.current(exp, 'core')} -> ${T.core}`);
  if (canExtractCore(L, exp)) {
    await extractCore(L, ctx, exp);
  } else if (!IS_WIN) {
    // the safety check refuses to start an outdated binary
    ctx.log(`Cannot update the server binary automatically. ${linuxBuildHint(L, exp)}`, 'warn');
  } else {
    throw new Error(`Bin64.7z is missing from ${L.P.bin(exp)}`);
  }
  L.flags.setVersion(exp, 'core', T.core);
  L.flags.del(`${exp}_beta.on`);
}

// :update_world (also used by Wipe World DB)
async function updateWorld(L, ctx, exp) {
  const { D, T, sql, apply } = helpers(L, exp);
  clearLocaleFlags(L, exp);
  ctx.log(`World db update: ${L.flags.current(exp, 'world')} -> ${T.world}`);
  await extractWorld(L, ctx, exp);
  ctx.log('Wiping old world db...');
  await apply(ctx, 'drop_world.sql');
  ctx.log('Installing new world db (this takes a while)...');
  await apply(ctx, 'world.sql', D.world);
  ctx.log('Applying world db mods...');
  await L.tools.sqlDir(ctx, path.join(sql, 'world'), D.world);
  rmFile(path.join(sql, 'world.sql'));
  L.flags.setVersion(exp, 'world', T.world);
}

async function updateChars(L, ctx, exp) {
  const { D, T, updates } = helpers(L, exp);
  const cur = L.flags.current(exp, 'chars');
  ctx.log(`Character db update: ${cur} -> ${T.chars}`);
  await updates(ctx, 'characters', cur, T.chars, D.characters);
  L.flags.setVersion(exp, 'chars', T.chars);
}

async function updateRealm(L, ctx, exp) {
  const { D, T, updates } = helpers(L, exp);
  const cur = L.flags.current(exp, 'realm');
  ctx.log(`Accounts db update: ${cur} -> ${T.realm}`);
  await updates(ctx, 'realmd', cur, T.realm, D.login);
  L.flags.setVersion(exp, 'realm', T.realm);
}

async function updateLogs(L, ctx, exp) {
  const { D, T, apply } = helpers(L, exp);
  ctx.log(`Logs db update: ${L.flags.current(exp, 'logs')} -> ${T.logs}`);
  await apply(ctx, 'drop_logs.sql');
  await apply(ctx, 'logs.sql', D.logs);
  if (T.logs !== 0) L.flags.setVersion(exp, 'logs', T.logs);
}

async function updateBots(L, ctx, exp) {
  const { D, T, sql, apply, updates } = helpers(L, exp);
  const cur = L.flags.current(exp, 'bots');
  ctx.log(`Playerbot db update: ${cur} -> ${T.bots}`);
  await updates(ctx, 'playerbot', cur, T.bots, D.playerbot);
  ctx.log('Updating bots travel paths...');
  await apply(ctx, 'world/ai_playerbot_travel_nodes.sql', D.world);
  ctx.log('Clearing teleport cache...');
  await apply(ctx, 'playerbot/characters_ai_playerbot_tele_cache.sql', D.characters);
  await botsCaches(L, ctx, exp);
  ctx.log('Updating bots texts, stat weights, enchants and names...');
  await apply(ctx, 'world/ai_playerbot_texts.sql', D.world);
  await apply(ctx, 'world/ai_playerbot_weightscales.sql', D.world);
  await apply(ctx, 'world/ai_playerbot_enchants.sql', D.world);
  await apply(ctx, 'characters/ai_playerbot_names.sql', D.characters);
  rmFile(path.join(sql, 'playerbot', `nodes_${exp}.sql`));
  L.flags.setVersion(exp, 'bots', T.bots);
}

async function installArmory(L, ctx, exp) {
  const { sql } = helpers(L, exp);
  ctx.log('Extracting Armory db...');
  await L.tools.extract(ctx, path.join(sql, 'armory.7z'), sql, 'armory');
  ctx.log('Installing Armory db...');
  await L.tools.sqlFile(ctx, path.join(sql, 'armory.sql'));
}

async function installWebsiteDb(L, ctx, exp) {
  const { D, T, sql, apply } = helpers(L, exp);
  ctx.log('Installing website db...');
  await installArmory(L, ctx, exp);
  ctx.log('Installing website tables...');
  await apply(ctx, 'website.sql', D.login);
  rmFile(path.join(sql, 'armory.sql'));
  L.flags.setVersion(exp, 'website', T.website);
}

async function updateWebsiteDb(L, ctx, exp) {
  const { D, T, sql, updates } = helpers(L, exp);
  const cur = L.flags.current(exp, 'website');
  ctx.log(`Website db update: ${cur} -> ${T.website}`);
  await installArmory(L, ctx, exp);
  ctx.log('Installing website updates...');
  await updates(ctx, 'website', cur, T.website, D.login);
  rmFile(path.join(sql, 'armory.sql'));
  L.flags.setVersion(exp, 'website', T.website);
}

const STEPS = {
  install: { title: 'Installing database', run: installFresh },
  maps: { title: 'Updating maps', run: updateMaps },
  world: { title: 'Updating world db', run: updateWorld },
  chars: { title: 'Updating characters db', run: updateChars },
  realm: { title: 'Updating accounts db', run: updateRealm },
  logs: { title: 'Updating logs db', run: updateLogs },
  bots: { title: 'Updating playerbot db', run: updateBots },
  websiteInstall: { title: 'Installing website db', run: installWebsiteDb },
  website: { title: 'Updating website db', run: updateWebsiteDb },
  core: { title: 'Updating core', run: updateCore },
};

// Same order of checks as Launcher.bat's :start_database
function nextStep(L, exp) {
  const E = L.exp(exp);
  const T = E.versions;
  const F = L.flags;
  const has = k => F.has(F.versionFile(exp, k));
  const cur = k => F.current(exp, k);
  if (!F.has(`${E.sppUpdate}.spp`)) return 'install';
  if (!has('maps')) return 'maps';
  if (!has('world')) return 'world';
  if (!has('chars')) return 'chars';
  if (!has('realm')) return 'realm';
  if (!has('logs') && T.logs !== 0) return 'logs';
  if (!has('bots')) return 'bots';
  if (!has('website')) return 'websiteInstall';
  if (!has('core') && T.core !== 1) return 'core';
  if (cur('maps') < T.maps) return 'maps';
  if (cur('world') < T.world) return 'world';
  if (cur('chars') < T.chars) return 'chars';
  if (cur('realm') < T.realm) return 'realm';
  if (T.logs !== 0 && cur('logs') < T.logs) return 'logs';
  if (cur('bots') < T.bots) return 'bots';
  if (F.isOn('website') && cur('website') < T.website) return 'website';
  if (cur('core') < T.core) return 'core';
  return null;
}

function ensureSaveDirs(L, exp) {
  const base = L.P.saves(exp);
  for (const d of ['autosaves', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'old']) mkdirp(path.join(base, d));
  if (L.exp(exp).transfer) mkdirp(path.join(base, 'transfer'));
}

// Selecting an expansion: start the database and bring everything up to date.
async function prepareExpansion(L, ctx, exp) {
  const E = L.exp(exp);
  const other = await L.runningExpansion();
  if (other && other !== exp) throw new Error(`${L.exp(other).label} server is running. Stop it before switching expansion.`);
  ctx.log(`Preparing ${E.label}...`, 'head');
  ensureSaveDirs(L, exp);
  L.flags.ensureToggle('autosave', true);
  L.flags.ensureToggle('autosave_running', false);
  L.flags.ensureToggle('website', true);

  if (await L.serverRunning(exp)) {
    ctx.log('Server is already running, skipping update checks.');
  } else {
    await L.startDatabase(ctx);
    if (!isDir(path.join(L.P.modules, exp, 'dbc'))) L.flags.delVersion(exp, 'maps');
    await ensureCore(L, ctx, exp);
    if (IS_WIN && !exists(path.join(L.P.bin(exp), 'zlib.dll'))) copyFile(path.join(L.P.tools, 'zlib.dll'), L.P.bin(exp));
    const done = new Set();
    for (let key = nextStep(L, exp); key; key = nextStep(L, exp)) {
      if (done.has(key)) throw new Error(`${STEPS[key].title} did not complete, see the log above.`);
      done.add(key);
      ctx.log(STEPS[key].title, 'head');
      await STEPS[key].run(L, ctx, exp);
    }
    ctx.log('Databases are up to date.', 'ok');
  }

  if (L.flags.isOn('website')) {
    try { await L.startWebsite(ctx, exp); }
    catch (e) { ctx.log(`Website: ${e.message}`, 'warn'); }
  }
  L.prepared.add(exp);
  L.select(exp);
}

// :update_website - download the website files (~170 MB)
async function updateWebsiteFiles(L, ctx) {
  const archive = path.join(L.P.root, 'Server', 'website.7z');
  await L.stopWebsite();
  rmFile(archive);
  rmFile(archive + '.part');
  ctx.log('Downloading latest website (~170 MB)...');
  await L.tools.download(ctx, `${RELEASES}/website.7z`, archive, 'website');
  ctx.log('Extracting website...');
  await rmrf(L.P.website);
  mkdirp(L.P.website);
  await L.tools.extract(ctx, archive, L.P.website, 'website');
  rmFile(archive);
  if (IS_WIN && exists(path.join(L.P.tools, 'Apache.7z'))) {
    ctx.log('Updating web server...');
    await L.tools.extract(ctx, path.join(L.P.tools, 'Apache.7z'), L.P.tools, 'Apache');
  }
  L.flags.write('website_version.spp', L.cfg.websiteVersion);
  if (L.state.selected && L.flags.isOn('website')) await L.startWebsite(ctx, L.state.selected);
}

module.exports = {
  prepareExpansion, updateWebsiteFiles, updateWorld, installFresh, botsCaches, ensureSaveDirs, extractCore, helpers, clearLocaleFlags, RELEASES,
};
