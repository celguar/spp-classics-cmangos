'use strict';
const fs = require('fs');
const fsp = fs.promises;
const path = require('path');

const IS_WIN = process.platform === 'win32';
const ROOT = path.resolve(__dirname, '..', '..');
const EXE = IS_WIN ? '.exe' : '';

// Resolve a path below ROOT. Each segment is matched case-insensitively when the exact
// name does not exist, because Launcher.bat mixes "Server\sql" and "Server\Sql" which
// only works on Windows' case-insensitive filesystem.
function rootPath(...parts) {
  let cur = ROOT;
  for (const seg of parts.join('/').split(/[\\/]+/).filter(Boolean)) {
    const direct = path.join(cur, seg);
    if (IS_WIN || fs.existsSync(direct)) { cur = direct; continue; }
    let match = null;
    try { match = fs.readdirSync(cur).find(n => n.toLowerCase() === seg.toLowerCase()); } catch { /* dir missing */ }
    cur = path.join(cur, match || seg);
  }
  return cur;
}

function exists(p) {
  try { fs.accessSync(p); return true; } catch { return false; }
}

function isDir(p) {
  try { return fs.statSync(p).isDirectory(); } catch { return false; }
}

function readText(p, fallback = null) {
  try { return fs.readFileSync(p, 'utf8'); } catch { return fallback; }
}

function readFirstLine(p, fallback = null) {
  const t = readText(p, null);
  if (t === null) return fallback;
  return t.split(/\r?\n/)[0].trim();
}

function writeText(p, text) {
  fs.mkdirSync(path.dirname(p), { recursive: true });
  fs.writeFileSync(p, text);
}

function mkdirp(p) { fs.mkdirSync(p, { recursive: true }); }

async function rmrf(p) { await fsp.rm(p, { recursive: true, force: true }); }

function rmFile(p) { try { fs.unlinkSync(p); } catch { /* already gone */ } }

function copyFile(src, destDir) {
  if (!exists(src)) return false;
  mkdirp(destDir);
  fs.copyFileSync(src, path.join(destDir, path.basename(src)));
  return true;
}

// Files in a directory with one of the given extensions, sorted by name (the order
// cmd's `for %%i in (*.sql)` produces on NTFS).
function listFiles(dir, exts = null) {
  let names;
  try { names = fs.readdirSync(dir, { withFileTypes: true }); } catch { return []; }
  return names
    .filter(d => d.isFile())
    .map(d => d.name)
    .filter(n => !exts || exts.includes(path.extname(n).toLowerCase()))
    .sort((a, b) => a.localeCompare(b, 'en', { sensitivity: 'base' }))
    .map(n => path.join(dir, n));
}

function fileInfo(p) {
  try {
    const st = fs.statSync(p);
    return { name: path.basename(p), size: st.size, mtime: st.mtimeMs };
  } catch { return null; }
}

const sleep = ms => new Promise(r => setTimeout(r, ms));

// YYYYMMDD_HHMM in local time, same shape as the batch autosave names.
function stamp(d = new Date()) {
  const z = n => String(n).padStart(2, '0');
  return `${d.getFullYear()}${z(d.getMonth() + 1)}${z(d.getDate())}_${z(d.getHours())}${z(d.getMinutes())}`;
}

// A file name supplied by the browser must be a plain name inside the target folder.
function safeName(name, exts) {
  if (typeof name !== 'string' || !name || name !== path.basename(name) || name.startsWith('.')) {
    throw httpError(400, 'Invalid file name');
  }
  if (exts && !exts.includes(path.extname(name).toLowerCase())) throw httpError(400, 'File type not allowed');
  return name;
}

function httpError(status, message) {
  const e = new Error(message);
  e.status = status;
  return e;
}

function sqlString(s) {
  return "'" + String(s).replace(/\\/g, '\\\\').replace(/'/g, "''") + "'";
}

// Find an executable on PATH (Linux tools such as 7z, mysql).
function which(names) {
  const dirs = (process.env.PATH || '').split(path.delimiter).filter(Boolean);
  for (const n of [].concat(names)) {
    for (const d of dirs) {
      const p = path.join(d, n + (IS_WIN && !n.endsWith('.exe') ? '.exe' : ''));
      if (exists(p)) return p;
    }
  }
  return null;
}

module.exports = {
  IS_WIN, ROOT, EXE, rootPath, exists, isDir, readText, readFirstLine, writeText, mkdirp, rmrf, rmFile,
  copyFile, listFiles, fileInfo, sleep, stamp, safeName, httpError, sqlString, which,
};
