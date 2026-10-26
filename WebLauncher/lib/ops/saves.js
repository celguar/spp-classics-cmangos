'use strict';
// Saves menu: 9 manual slots, the "old" (SPP v1) and "transfer" (previous expansion)
// import slots, and timestamped autosaves. Same folder layout as Launcher.bat.
const path = require('path');
const fs = require('fs');
const { exists, mkdirp, rmrf, copyFile, readFirstLine, writeText, stamp, fileInfo, httpError, safeName } = require('../util');

const SLOTS = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'old', 'transfer'];
const VERSION_KEYS = ['chars', 'realm', 'logs', 'bots', 'website'];
// Autosave limits (also enforced when read from config.json)
const MIN_INTERVAL = 10;
const MAX_INTERVAL = 24 * 60;
const MAX_KEEP = 1000;
// An autosave is skipped below this much free disk space, so it cannot fill the disk
const MIN_FREE_BYTES = 1024 ** 3;

const intervalMin = L => Math.min(MAX_INTERVAL, Math.max(MIN_INTERVAL, Math.round(+L.cfg.autosaveIntervalMin) || 15));
const keepCount = L => Math.min(MAX_KEEP, Math.max(1, Math.round(+L.cfg.maxAutosaves) || 1));

function freeBytes(dir) {
  try { const s = fs.statfsSync(dir); return s.bavail * s.bsize; } catch { return null; } // statfs: Node 18.15+
}

function versionKeys(L, exp) {
  return VERSION_KEYS.filter(k => k !== 'logs' || L.exp(exp).versions.logs !== 0);
}

function slotDir(L, exp, slot) {
  if (!SLOTS.includes(slot)) throw httpError(400, 'Invalid save slot');
  return path.join(L.P.saves(exp), slot);
}

function listSaves(L, exp) {
  const E = L.exp(exp);
  const base = L.P.saves(exp);
  const slots = SLOTS.filter(s => s !== 'transfer' || E.transfer).map((id) => {
    const dir = path.join(base, id);
    const filled = exists(path.join(dir, 'characters.sql'));
    const info = filled ? fileInfo(path.join(dir, 'characters.sql')) : null;
    return {
      id,
      label: id === 'old' ? 'Old Save (SPP v1)' : id === 'transfer' ? `${E.transferFrom} Save` : `Save ${id}`,
      name: readFirstLine(path.join(dir, 'name.txt'), '') || null,
      filled,
      importOnly: id === 'old' || id === 'transfer',
      mtime: info ? info.mtime : null,
    };
  }).filter(s => !s.importOnly || s.name);
  return {
    folder: base,
    slots,
    autosaves: listAutosaves(L, exp),
    autosave: L.flags.isOn('autosave'),
    autosaveRunning: L.flags.isOn('autosave_running'),
    intervalMin: intervalMin(L),
    keep: keepCount(L),
    limits: { minInterval: MIN_INTERVAL, maxInterval: MAX_INTERVAL, maxKeep: MAX_KEEP },
    freeBytes: freeBytes(exists(base) ? base : L.P.root),
    minFreeBytes: MIN_FREE_BYTES,
  };
}

function listAutosaves(L, exp) {
  const dir = path.join(L.P.saves(exp), 'autosaves');
  let names = [];
  try { names = fs.readdirSync(dir).filter(n => /^autosave_.*\.7z$/i.test(n)); } catch { /* none yet */ }
  return names.map(n => fileInfo(path.join(dir, n))).filter(Boolean).sort((a, b) => b.mtime - a.mtime);
}

async function dumpInto(L, exp, dir, name) {
  const E = L.exp(exp);
  mkdirp(dir);
  writeText(path.join(dir, 'name.txt'), `${name}\r\n`);
  await L.tools.dump(E.db.login, path.join(dir, 'realmd.sql'));
  await L.tools.dump(E.db.characters, path.join(dir, 'characters.sql'));
  for (const k of versionKeys(L, exp)) copyFile(L.flags.file(L.flags.versionFile(exp, k)), dir);
}

// Used on server start/stop and by the "every N minutes" timer
async function makeAutosave(L, ctx, exp) {
  const base = path.join(L.P.saves(exp), 'autosaves');
  mkdirp(base);
  const free = freeBytes(base);
  if (free !== null && free < MIN_FREE_BYTES) {
    ctx.log(`Autosave skipped: only ${Math.round(free / 1048576)} MB free disk space left (needs ${MIN_FREE_BYTES >= 1024 ** 3 ? `${MIN_FREE_BYTES / 1024 ** 3} GB` : `${MIN_FREE_BYTES / 1048576} MB`}). Delete old autosaves or lower "Keep" on the Saves page.`, 'warn');
    return;
  }
  const name = `autosave_${stamp()}`;
  const archive = path.join(base, `${name}.7z`);
  if (exists(archive)) { ctx.log('Autosave from this time already exists!'); return; }
  const dir = path.join(base, name);
  ctx.log('Saving databases...');
  try {
    await dumpInto(L, exp, dir, name);
    ctx.log('Archiving save...');
    await L.tools.compress(archive, name, base);
  } finally {
    await rmrf(dir);
  }
  pruneAutosaves(L, exp, ctx);
  ctx.log(`Saved ${name}`, 'ok');
}

// Deletes the oldest autosaves beyond the "keep" count; returns how many were removed.
function pruneAutosaves(L, exp, ctx) {
  const base = path.join(L.P.saves(exp), 'autosaves');
  const old = listAutosaves(L, exp).slice(keepCount(L));
  for (const f of old) {
    if (ctx) ctx.log(`Removing old autosave ${f.name}`);
    fs.rmSync(path.join(base, f.name), { force: true });
  }
  return old.length;
}

// Interval and keep count from the Saves page (stored in config.json, used by every expansion).
function saveAutosaveSettings(L, { intervalMin: iv, keep }) {
  const changes = {};
  if (iv !== undefined) {
    const n = Math.round(+iv);
    if (!(n >= MIN_INTERVAL && n <= MAX_INTERVAL)) throw httpError(400, `Autosave interval must be ${MIN_INTERVAL} to ${MAX_INTERVAL} minutes`);
    changes.autosaveIntervalMin = n;
  }
  if (keep !== undefined) {
    const n = Math.round(+keep);
    if (!(n >= 1 && n <= MAX_KEEP)) throw httpError(400, `Number of autosaves to keep must be 1 to ${MAX_KEEP}`);
    changes.maxAutosaves = n;
  }
  Object.assign(L.cfg, changes);
  require('../config').saveUserConfig(changes);
  let removed = 0;
  if (changes.maxAutosaves) for (const exp of Object.keys(L.cfg.expansions)) removed += pruneAutosaves(L, exp);
  return { removed };
}

async function saveSlot(L, ctx, exp, slot, name) {
  if (slot === 'old' || slot === 'transfer') throw httpError(400, 'This slot is for import only');
  const dir = slotDir(L, exp, slot);
  const clean = String(name || '').replace(/[\r\n]/g, ' ').trim().slice(0, 64) || `Save ${slot}`;
  await L.startDatabase(ctx);
  ctx.log(`Creating save #${slot} "${clean}"...`);
  await rmrf(dir);
  ctx.log('Exporting accounts and characters...');
  await dumpInto(L, exp, dir, clean);
  ctx.log(`Save #${slot} "${clean}" created.`, 'ok');
}

async function deleteSlot(L, exp, slot) {
  const dir = slotDir(L, exp, slot);
  await rmrf(dir);
  mkdirp(dir);
}

async function requireStopped(L, exp) {
  if (await L.serverRunning(exp)) throw httpError(409, 'Please stop the server before loading a save.');
}

// :import_char_1 .. :import_continue
async function importFolder(L, ctx, exp, dir, slot) {
  const E = L.exp(exp);
  const sqlDir = L.P.sql(exp);
  const apply = (file, db) => L.tools.sqlFile(ctx, path.join(sqlDir, file), db);
  if (!exists(path.join(dir, 'characters.sql'))) throw httpError(400, 'Loading save failed, no files to load!');
  const name = readFirstLine(path.join(dir, 'name.txt'), slot);
  await L.startDatabase(ctx);
  ctx.log(`Loading save "${name}"...`, 'head');
  ctx.log('Importing accounts...');
  await L.tools.sqlFile(ctx, path.join(dir, 'realmd.sql'), E.db.login);
  ctx.log('Importing characters...');
  await L.tools.sqlFile(ctx, path.join(dir, 'characters.sql'), E.db.characters);
  if (slot === 'old') {
    ctx.log('Converting accounts and characters from SPP v1...');
    await apply('convert_realmd.sql', E.db.login);
    await apply('convert_characters.sql', E.db.characters);
  } else if (slot === 'transfer') {
    ctx.log(`Upgrading ${E.transferFrom} accounts and characters...`);
    await apply('transfer_realmd.sql', E.db.login);
    await apply('transfer_characters.sql', E.db.characters);
  }
  if (slot === 'old' || slot === 'transfer') {
    ctx.log('Updating realmlist and website tables...');
    await apply('realmlist.sql', E.db.login);
    await apply('website.sql', E.db.login);
  }
  ctx.log('Loading version info...');
  for (const k of versionKeys(L, exp)) L.flags.delVersion(exp, k);
  if (slot !== 'old' && slot !== 'transfer') {
    for (const k of versionKeys(L, exp)) copyFile(path.join(dir, L.flags.versionFile(exp, k)), L.P.versions);
  }
  // bring the loaded data up to the current db version
  L.prepared.delete(exp);
  await require('./install').prepareExpansion(L, ctx, exp);
  ctx.log(`Save "${name}" loaded.`, 'ok');
}

async function loadSlot(L, ctx, exp, slot) {
  await requireStopped(L, exp);
  await importFolder(L, ctx, exp, slotDir(L, exp, slot), slot);
}

async function loadAutosave(L, ctx, exp, file) {
  await requireStopped(L, exp);
  safeName(file, ['.7z']);
  const base = path.join(L.P.saves(exp), 'autosaves');
  const archive = path.join(base, file);
  if (!exists(archive)) throw httpError(404, 'Autosave not found');
  const dir = path.join(base, path.basename(file, '.7z'));
  ctx.log(`Extracting ${file}...`);
  try {
    await L.tools.extract(ctx, archive, base, 'autosave');
    await importFolder(L, ctx, exp, dir, 'autosave');
  } finally {
    await rmrf(dir);
  }
}

function deleteAutosave(L, exp, file) {
  safeName(file, ['.7z']);
  fs.rmSync(path.join(L.P.saves(exp), 'autosaves', file), { force: true });
}

module.exports = { listSaves, saveSlot, deleteSlot, loadSlot, loadAutosave, deleteAutosave, makeAutosave, saveAutosaveSettings, intervalMin };
