'use strict';
// Safety check: never start a server binary that is older than the databases.
// Launcher.bat's core_version is bumped together with the world/characters db
// versions; a mangosd built for an older core_version may not match the db.
const fs = require('fs');
const path = require('path');
const { IS_WIN, readText, writeText, httpError } = require('./util');

class BinaryCheck {
  constructor(L) {
    this.L = L;
    this.file = path.join(L.P.runtime, 'binaries.json');
    try { this.data = JSON.parse(fs.readFileSync(this.file, 'utf8')); } catch { this.data = {}; }
  }

  save() { writeText(this.file, JSON.stringify(this.data, null, 2)); }

  // size + modification time identifies "this exact mangosd"
  fingerprint(exp) {
    try {
      const st = fs.statSync(this.L.P.mangosd(exp));
      return `${st.size}:${Math.round(st.mtimeMs)}`;
    } catch { return null; }
  }

  // build_info.txt is written by the Linux Binaries workflow next to mangosd
  buildInfo(exp) {
    const text = readText(path.join(this.L.P.bin(exp), 'build_info.txt'), '');
    const out = {};
    for (const line of text.split(/\r?\n/)) {
      const m = line.match(/^\s*([\w.]+)\s*=\s*(.*?)\s*$/);
      if (m) out[m[1]] = m[2];
    }
    return out.core_version ? out : null;
  }

  info(exp) {
    const E = this.L.exp(exp);
    const required = E.versions.core;
    const fp = this.fingerprint(exp);
    const result = (coreVersion, source, extra = {}) => ({ found: true, coreVersion, required, source, ok: coreVersion >= required, ...extra });
    if (!fp) return { found: false, ok: false, required, source: null };
    if (IS_WIN && this.L.flags.has(`${exp}_beta.on`)) return { found: true, ok: true, required, source: 'beta' };

    const rec = this.data[exp];
    if (rec && rec.fingerprint === fp && rec.manual) return result(rec.coreVersion, 'manual');
    const bi = this.buildInfo(exp);
    if (bi) return result(+bi.core_version, 'build_info', { commit: bi.commit || null, built: bi.date || null });
    if (IS_WIN && !this.L.P.customBin(exp)) return result(this.L.flags.current(exp, 'core'), 'launcher');

    // Self-built binary: remember the core version it was first seen with. A rebuild
    // changes the fingerprint and counts as current again.
    if (!rec || rec.fingerprint !== fp) {
      this.data[exp] = { fingerprint: fp, coreVersion: required, firstSeen: Date.now() };
      this.save();
    }
    return result(this.data[exp].coreVersion, 'recorded');
  }

  message(exp, info) {
    const E = this.L.exp(exp);
    const how = this.L.P.customBin(exp)
      ? `Rebuild CMaNGOS (${E.short}) and replace mangosd and realmd in ${this.L.P.bin(exp)}`
      : IS_WIN ? `Choose the expansion again so the launcher extracts the new binaries`
        : `Update the repack to get new Linux binaries (Maintenance > Update & restart with git pull), or build CMaNGOS yourself`;
    return `The ${E.short} server binary is for core version ${info.coreVersion}, but the repack and its databases are at version ${info.required}. `
      + `Starting it could damage the databases. ${how}. If you know this binary is up to date, use "Start anyway" on the Overview page.`;
  }

  assert(exp) {
    const info = this.info(exp);
    if (!info.found) throw httpError(409, `mangosd was not found in ${this.L.P.bin(exp)}`);
    if (!info.ok) throw httpError(409, this.message(exp, info));
    return info;
  }

  // "Start anyway": trust this exact binary for the current core version.
  accept(exp) {
    const fp = this.fingerprint(exp);
    if (!fp) throw httpError(404, `mangosd was not found in ${this.L.P.bin(exp)}`);
    this.data[exp] = { fingerprint: fp, coreVersion: this.L.exp(exp).versions.core, manual: true, acceptedAt: Date.now() };
    this.save();
  }
}

module.exports = { BinaryCheck };
