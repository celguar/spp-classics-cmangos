'use strict';
const path = require('path');
const { exists, readFirstLine, writeText, rmFile, mkdirp } = require('./util');

// The batch launcher keeps its state as marker files in Server/Versions
// (music.on, vanilla_world_version.spp, ...). Using the same files keeps the web
// launcher and Launcher.bat interchangeable on the same install.
class Flags {
  constructor(dir) {
    this.dir = dir;
    mkdirp(dir);
  }

  file(name) { return path.join(this.dir, name); }
  has(name) { return exists(this.file(name)); }
  del(name) { rmFile(this.file(name)); }
  write(name, value) { writeText(this.file(name), `${value}\r\n`); }
  read(name) { return readFirstLine(this.file(name), null); }

  readInt(name) {
    const v = parseInt(this.read(name), 10);
    return Number.isFinite(v) ? v : null;
  }

  // name.on / name.off toggles
  isOn(name) { return this.has(`${name}.on`); }

  setToggle(name, on) {
    this.del(`${name}.${on ? 'off' : 'on'}`);
    this.write(`${name}.${on ? 'on' : 'off'}`, name);
  }

  ensureToggle(name, defaultOn) {
    if (!this.has(`${name}.on`) && !this.has(`${name}.off`)) this.setToggle(name, defaultOn);
  }

  // <exp>_<key>_version.spp, read the way Launcher.bat does: missing => 0, otherwise at least 1.
  versionFile(exp, key) { return `${exp}_${key}_version.spp`; }

  current(exp, key) {
    if (!this.has(this.versionFile(exp, key))) return 0;
    return Math.max(1, this.readInt(this.versionFile(exp, key)) || 0);
  }

  setVersion(exp, key, value) { this.write(this.versionFile(exp, key), value); }
  delVersion(exp, key) { this.del(this.versionFile(exp, key)); }
}

module.exports = { Flags };
