'use strict';
const path = require('path');
const fs = require('fs');
const { spawn, spawnSync } = require('child_process');
const { IS_WIN, exists, isDir, mkdirp, rmrf, rmFile, copyFile, writeText, readText, listFiles, fileInfo, safeName, httpError, sqlString } = require('../util');
const install = require('./install');

// Destructive db operations need the world server down (Launcher.bat taskkills it).
async function ensureStopped(L, ctx, exp) {
  if (await L.serverRunning(exp)) {
    ctx.log('Stopping the server first...');
    await L.stopServer(ctx, { autosave: false });
  }
  await L.startDatabase(ctx);
}

// ---- Random bots ---------------------------------------------------------------------
const BOT_ACTIONS = {
  reset: { title: 'Reset random bots settings', files: ['reset_randombots.sql'] },
  delete: { title: 'Delete random bots', files: ['reset_randombots.sql', 'delete_randombots.sql'] },
  deleteAll: { title: 'Delete ALL random bots', files: ['reset_randombots.sql', 'delete_all_randombots.sql'] },
};

async function bots(L, ctx, exp, action) {
  const a = BOT_ACTIONS[action];
  if (!a) throw httpError(400, 'Unknown bots action');
  await ensureStopped(L, ctx, exp);
  ctx.log(`${a.title}...`);
  for (const f of a.files) await L.tools.sqlFile(ctx, path.join(L.P.sql(exp), f), L.exp(exp).db.characters);
  if (action !== 'reset') ctx.log('On next start the old bots are removed and new bots are created.', 'ok');
}

// ---- Wipe database ---------------------------------------------------------------------
async function wipeWorld(L, ctx, exp) {
  await ensureStopped(L, ctx, exp);
  L.flags.delVersion(exp, 'world');
  L.flags.delVersion(exp, 'logs');
  await install.updateWorld(L, ctx, exp);
  L.prepared.delete(exp);
  await install.prepareExpansion(L, ctx, exp);
}

// :clear_characters and :clear_characcs
async function wipeCharacters(L, ctx, exp, withAccounts) {
  const { D, T, sql, apply, updates } = install.helpers(L, exp);
  await ensureStopped(L, ctx, exp);
  ctx.log(withAccounts ? 'Wiping characters, bots and accounts...' : 'Wiping characters and bots...');
  await apply(ctx, 'drop_characters.sql');
  if (withAccounts) await apply(ctx, 'drop_realmd.sql');
  ctx.log('Reinstalling characters db...');
  await apply(ctx, 'characters.sql', D.characters);
  if (withAccounts) {
    ctx.log('Reinstalling accounts db...');
    await apply(ctx, 'realmd.sql', D.login);
    await apply(ctx, 'realmlist.sql', D.login);
  }
  ctx.log('Reinstalling logs db...');
  await apply(ctx, 'drop_logs.sql');
  await apply(ctx, 'logs.sql', D.logs);
  ctx.log('Applying characters db updates...');
  await updates(ctx, 'characters', 0, T.chars, D.characters);
  ctx.log('Applying characters db mods...');
  await L.tools.sqlDir(ctx, path.join(sql, 'characters'), D.characters);
  if (withAccounts) {
    ctx.log('Applying accounts db updates...');
    await updates(ctx, 'realmd', 0, T.realm, D.login);
    ctx.log('Applying accounts db mods...');
    await L.tools.sqlDir(ctx, path.join(sql, 'realmd'), D.login);
  }
  ctx.log('Updating bots travel paths and texts...');
  await apply(ctx, 'world/ai_playerbot_travel_nodes.sql', D.world);
  await apply(ctx, 'world/ai_playerbot_texts.sql', D.world);
  await install.botsCaches(L, ctx, exp);
  if (withAccounts) {
    ctx.log('Installing website tables...');
    await apply(ctx, 'website.sql', D.login);
  }
  if (T.logs !== 0) L.flags.setVersion(exp, 'logs', T.logs);
}

// ---- Translations -------------------------------------------------------------------------
const LOCALES = [
  { key: 'fr', label: 'French', folder: 'French' },
  { key: 'de', label: 'German', folder: 'German' },
  { key: 'ru', label: 'Russian', folder: 'Russian' },
  { key: 'ch', label: 'Chinese', folder: 'Chinese' },
  { key: 'tw', label: 'Taiwanese', folder: 'Taiwanese' },
  { key: 'es', label: 'Spanish', folder: 'Spanish' },
  { key: 'mx', label: 'Spanish (South America)', folder: 'Spanish_South_American' },
  { key: 'ko', label: 'Korean', folder: 'Korean' },
];

function listLocales(L, exp) {
  return LOCALES.map(l => ({
    key: l.key,
    label: l.label,
    status: L.flags.has(`${exp}_${l.key}_re.spp`) ? 'English replaced' : L.flags.has(`${exp}_${l.key}.spp`) ? 'Installed' : 'Not installed',
  }));
}

async function installLocales(L, ctx, exp, keys) {
  const chosen = LOCALES.filter(l => keys.includes(l.key));
  if (!chosen.length) throw httpError(400, 'Choose at least one language');
  const { D, sql, apply } = install.helpers(L, exp);
  await L.startDatabase(ctx);
  ctx.log('Extracting locales...');
  await L.tools.extract(ctx, path.join(sql, 'locales.7z'), sql, 'locales');
  try {
    ctx.log(`Preparing ${exp} db...`);
    await apply(ctx, 'locales/prepare.sql', D.world);
    ctx.log('Installing text locales...');
    await apply(ctx, 'locales/broadcast_text_locale.sql', D.world);
    for (const l of chosen) {
      ctx.log(`Installing ${l.label} locale...`);
      await L.tools.sqlDir(ctx, path.join(sql, 'locales', l.folder), D.world);
      L.flags.write(`${exp}_${l.key}.spp`, `${exp} `);
    }
    ctx.log('Updating quest locales...');
    await apply(ctx, 'locales/quest_locale_all.sql', D.world);
  } finally {
    ctx.log('Removing temporary files...');
    await rmrf(path.join(sql, 'locales'));
  }
}

// ---- Beta build (Windows only) ------------------------------------------------------------
function betaInfo(L, exp) {
  const exe = fileInfo(L.P.mangosd(exp));
  return {
    supported: IS_WIN,
    enabled: L.flags.has(`${exp}_beta.on`),
    since: L.flags.read(`${exp}_beta.on`),
    binaryDate: exe ? exe.mtime : null,
  };
}

async function betaInstall(L, ctx, exp, forceDownload) {
  if (!IS_WIN) throw httpError(400, 'Beta builds are Windows binaries');
  await ensureStopped(L, ctx, exp);
  const E = L.exp(exp);
  const bin = L.P.bin(exp);
  const zip = path.join(bin, E.betaZip);
  if (forceDownload || !exists(zip)) {
    rmFile(zip);
    ctx.log('Downloading Beta Build...');
    await L.tools.download(ctx, `https://github.com/celguar/mangosbot-bots/releases/latest/download/${E.betaZip}`, zip, 'beta build');
  } else {
    ctx.log(`Beta Build archive found (${new Date(fileInfo(zip).mtime).toLocaleDateString()})`);
  }
  ctx.log('Extracting Beta Build...');
  await L.tools.extract(ctx, zip, bin, 'beta build');
  const built = path.join(bin, 'x64_RelWithDebInfo');
  if (!copyFile(path.join(built, 'mangosd.exe'), bin)) throw new Error('mangosd.exe missing from the beta archive');
  ctx.log('Copying debug info...');
  copyFile(path.join(built, 'mangosd.pdb'), L.P.settings(exp));
  const peupdate = path.join(L.P.tools, 'peupdate.exe');
  if (exists(peupdate)) spawnSync(peupdate, ['-k', path.join(bin, 'mangosd.exe')], { windowsHide: true });
  await rmrf(built);
  L.flags.write(`${exp}_beta.on`, new Date().toLocaleDateString());
}

async function betaDisable(L, ctx, exp) {
  if (!IS_WIN) throw httpError(400, 'Beta builds are Windows binaries');
  await ensureStopped(L, ctx, exp);
  ctx.log('Restoring original binaries...');
  await install.extractCore(L, ctx, exp);
  L.flags.del(`${exp}_beta.on`);
}

// ---- Modify DB (custom SQL) ------------------------------------------------------------------
const MANUAL = 'manual_sql_file.sql';
const MANUAL_TEMPLATE = [
  '-- ============================================',
  '-- If ANY command fails, ALL changes are rolled back!',
  '-- ============================================',
  '',
  'START TRANSACTION;',
  '',
  '-- ▼▼▼ PUT YOUR SQL CODE BELOW ▼▼▼',
  '',
  '',
  '',
  '-- ▲▲▲ PUT YOUR SQL CODE ABOVE ▲▲▲',
  '',
  'COMMIT;',
  '',
].join('\r\n');

function customDb(L, exp, which) {
  const D = L.exp(exp).db;
  const map = { world: D.world, characters: D.characters, accounts: D.login };
  if (!map[which]) throw httpError(400, 'Choose World, Characters or Accounts');
  return map[which];
}

function customDir(L, exp, which) {
  const dir = path.join(L.P.sql(exp), 'custom', customDb(L, exp, which));
  mkdirp(dir);
  if (!exists(path.join(dir, MANUAL))) writeText(path.join(dir, MANUAL), MANUAL_TEMPLATE);
  return dir;
}

function listCustom(L, exp, which) {
  const dir = customDir(L, exp, which);
  return { folder: dir, database: customDb(L, exp, which), files: listFiles(dir, ['.sql']).map(f => fileInfo(f)) };
}

async function applyCustom(L, ctx, exp, which, file) {
  const dir = customDir(L, exp, which);
  const db = customDb(L, exp, which);
  await L.startDatabase(ctx);
  if (file) {
    safeName(file, ['.sql']);
    ctx.log(`Applying ${file} to ${db}...`);
    const ok = await L.tools.sqlFile(ctx, path.join(dir, file), db);
    if (!ok) throw new Error(`${file} failed, see the log above`);
  } else {
    ctx.log(`Applying all SQL files to ${db} (except ${MANUAL})...`);
    await L.tools.sqlDir(ctx, dir, db, { exclude: [MANUAL] });
  }
}

// ---- Realm address / name ------------------------------------------------------------------
async function setRealm(L, ctx, exp, { address, name }) {
  const E = L.exp(exp);
  const addr = (address ?? L.realmAddress(exp)).trim();
  const realmName = (name ?? L.realmName(exp)).trim();
  if (!addr || /\s/.test(addr) || addr.length > 32) throw httpError(400, 'Enter a valid address (IP or host name)');
  if (!realmName || realmName.length > 32) throw httpError(400, 'Realm name must be 1-32 characters');
  writeText(path.join(L.P.settings(exp), 'address.txt'), `${addr} \r\n`);
  writeText(path.join(L.P.settings(exp), 'name.txt'), `${realmName} \r\n`);
  const sql = `UPDATE \`realmlist\` SET \`address\`=${sqlString(addr)} WHERE  \`id\`=1;UPDATE \`realmlist\` SET \`name\`=${sqlString(realmName)} WHERE  \`id\`=1;`;
  // realmlist.sql is re-applied when accounts are reinstalled, so the change sticks
  writeText(path.join(L.P.sql(exp), 'realmlist.sql'), sql + '\r\n');
  await L.startDatabase(ctx);
  ctx.log('Applying new realm settings...');
  await L.tools.sqlFile(ctx, path.join(L.P.sql(exp), 'realmlist.sql'), E.db.login);
  ctx.log(`Realm "${realmName}" at ${addr}`, 'ok');
}

// ---- Service menu ------------------------------------------------------------------------------
async function fixDatabase(L, ctx) {
  const wasUp = await L.dbUp();
  await L.startDatabase(ctx);
  ctx.log('Checking database errors (this can take a few minutes)...');
  await L.tools.check(ctx);
  ctx.log('Check complete!', 'ok');
  if (!wasUp && !L.state.selected) await L.stopDatabase(ctx);
}

function runVcredist(L) {
  if (!IS_WIN) throw httpError(400, 'Visual C++ runtimes are only needed on Windows');
  const dir = path.join(L.P.addons, 'vcredist');
  spawn('cmd.exe', ['/c', 'start', '', 'install_all.bat'], { cwd: dir, detached: true, stdio: 'ignore' }).unref();
}

async function openExtras(L, ctx) {
  if (!IS_WIN) throw httpError(400, 'SPP Extras is a Windows program');
  const exe = path.join(L.P.tools, 'SPPE.exe');
  if (!exists(exe)) await L.tools.extract(ctx, path.join(L.P.tools, 'SPPE.7z'), L.P.tools, 'SPP Extras');
  spawn(exe, [], { cwd: L.P.tools, detached: true, stdio: 'ignore' }).unref();
}

// ---- Accounts --------------------------------------------------------------------------------
async function listAccounts(L, exp) {
  const E = L.exp(exp);
  const hidden = new Set(['s', 'v', 'sessionkey', 'token', 'sha_pass_hash', 'salt', 'verifier', 'session_key']);
  const r = await L.tools.query("SELECT * FROM account WHERE username NOT LIKE 'RNDBOT%' ORDER BY id LIMIT 500", E.db.login);
  const keep = r.columns.map((c, i) => [c, i]).filter(([c]) => !hidden.has(c.toLowerCase()));
  const pick = ['id', 'username', 'gmlevel', 'email', 'joindate', 'last_login', 'last_ip', 'locked', 'expansion'];
  const cols = keep.filter(([c]) => pick.includes(c.toLowerCase()));
  return { columns: cols.map(([c]) => c), rows: r.rows.map(row => cols.map(([, i]) => row[i])) };
}

async function onlinePlayers(L, exp) {
  const D = L.exp(exp).db;
  const r = await L.tools.query(
    `SELECT c.name, c.level, c.race, c.class, IF(a.username LIKE 'RNDBOT%', 1, 0) AS bot FROM ${D.characters}.characters c ` +
    `JOIN ${D.login}.account a ON a.id = c.account WHERE c.online = 1 ORDER BY bot, c.name LIMIT 2000`);
  const rows = r.rows.map(([name, level, race, cls, bot]) => ({ name, level: +level, race: +race, cls: +cls, bot: bot === '1' }));
  return { players: rows.filter(p => !p.bot), bots: rows.filter(p => p.bot).length };
}

function validAccountName(s) {
  if (typeof s !== 'string' || !/^[A-Za-z0-9]{3,16}$/.test(s)) throw httpError(400, 'Account name: 3-16 letters or digits');
  return s;
}

function consoleCommand(L, cmd) {
  if (!L.mangosd.running) throw httpError(409, 'Start the server (and wait for it to load) first');
  L.mangosd.write(cmd);
}

function createAccount(L, { username, password, gmlevel }) {
  validAccountName(username);
  if (typeof password !== 'string' || !/^\S{1,16}$/.test(password)) throw httpError(400, 'Password: 1-16 characters, no spaces');
  consoleCommand(L, `account create ${username} ${password}`);
  if (+gmlevel > 0) setTimeout(() => { try { L.mangosd.write(`account set gmlevel ${username} ${+gmlevel}`); } catch { /* stopped */ } }, 1500);
}

function setGmLevel(L, { username, gmlevel }) {
  validAccountName(username);
  const lvl = +gmlevel;
  if (!(lvl >= 0 && lvl <= 3)) throw httpError(400, 'GM level 0-3');
  consoleCommand(L, `account set gmlevel ${username} ${lvl}`);
}

// ---- Files (configs, logs, crash dumps, custom sql, changelog) ---------------------------------
const TEXT_EXT = ['.conf', '.config', '.txt', '.log', '.sql', '.dist', '.ini', ''];

function fileArea(L, kind, exp, sub) {
  switch (kind) {
    case 'config': return { dir: L.P.settings(exp), exts: ['.conf'], write: true };
    case 'log': return { dir: path.join(L.P.settings(exp), 'logs'), exts: null, write: false };
    case 'crash': return { dir: path.join(L.P.bin(exp), 'Crashes'), exts: null, write: false };
    case 'custom': return { dir: customDir(L, exp, sub), exts: ['.sql'], write: true };
    case 'changelog': return { dir: L.P.changelog, exts: ['.txt'], write: false };
    case 'hermes': {
      const exe = L.hermes.exePath((L.state.hermes || {}).exe);
      if (!exe) throw httpError(404, 'HermesProxy not found');
      return { dir: path.dirname(exe), exts: ['.config'], write: true };
    }
    default: throw httpError(400, 'Unknown file area');
  }
}

function listArea(L, kind, exp, sub) {
  const a = fileArea(L, kind, exp, sub);
  if (!isDir(a.dir)) return { folder: a.dir, files: [] };
  const files = listFiles(a.dir, a.exts).map(fileInfo).filter(Boolean);
  files.sort((x, y) => (kind === 'changelog' ? y.name.localeCompare(x.name, 'en', { numeric: true }) : kind === 'config' ? x.name.localeCompare(y.name) : y.mtime - x.mtime));
  return { folder: a.dir, files };
}

function readArea(L, kind, exp, sub, name, maxBytes = 2 * 1024 * 1024) {
  const a = fileArea(L, kind, exp, sub);
  const file = path.join(a.dir, safeName(name, a.exts));
  if (!exists(file)) throw httpError(404, 'File not found');
  const ext = path.extname(name).toLowerCase();
  if (!TEXT_EXT.includes(ext)) return { name, binary: true, size: fs.statSync(file).size };
  const size = fs.statSync(file).size;
  let text;
  if (size > maxBytes) {
    const fd = fs.openSync(file, 'r');
    const buf = Buffer.alloc(maxBytes);
    fs.readSync(fd, buf, 0, maxBytes, size - maxBytes);
    fs.closeSync(fd);
    text = buf.toString('utf8');
  } else {
    text = readText(file, '');
  }
  return { name, text, size, truncated: size > maxBytes, writable: a.write };
}

function writeArea(L, kind, exp, sub, name, text) {
  const a = fileArea(L, kind, exp, sub);
  if (!a.write) throw httpError(403, 'This file is read only');
  if (typeof text !== 'string') throw httpError(400, 'Missing content');
  const file = path.join(a.dir, safeName(name, a.exts));
  if (kind === 'config' && !exists(file)) throw httpError(404, 'File not found');
  if (kind === 'config') fs.copyFileSync(file, file + '.bak');
  fs.writeFileSync(file, text);
}

function deleteArea(L, kind, exp, sub, name) {
  const a = fileArea(L, kind, exp, sub);
  if (kind !== 'custom' || name === MANUAL) throw httpError(403, 'This file cannot be deleted');
  rmFile(path.join(a.dir, safeName(name, a.exts)));
}

function areaFilePath(L, kind, exp, sub, name) {
  const a = fileArea(L, kind, exp, sub);
  return path.join(a.dir, safeName(name, a.exts));
}

module.exports = {
  bots, wipeWorld, wipeCharacters, listLocales, installLocales, betaInfo, betaInstall, betaDisable,
  listCustom, applyCustom, setRealm, fixDatabase, runVcredist, openExtras, listAccounts, onlinePlayers,
  createAccount, setGmLevel, listArea, readArea, writeArea, deleteArea, areaFilePath, LOCALES,
};
