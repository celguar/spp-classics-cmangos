'use strict';
// HermesProxy (github.com/WowLegacyCore/HermesProxy) lets modern Classic clients
// (1.14.x / 2.5.x) play on the legacy 1.12.1 / 2.4.3 servers. The launcher starts it
// together with the realm and keeps HermesProxy.config in line with the expansion.
const fs = require('fs');
const path = require('path');
const { IS_WIN, exists, isDir, readText, httpError } = require('./util');
const { ManagedProcess, portOpen } = require('./procs');

// Legacy server build HermesProxy must talk to, per expansion (VersionChecker.IsSupportedLegacyVersion)
const SERVER_BUILDS = {
  vanilla: { build: 5875, version: '1.12.1', clientMajor: 1 },
  tbc: { build: 8606, version: '2.4.3', clientMajor: 2 },
};

// Used when the HermesProxy source is not available to read the list from.
const FALLBACK_BUILDS = {
  '1.14.0': [39802, 39958, 40140, 40179, 40237, 40347, 40441, 40618],
  '1.14.1': [40487, 40594, 40666, 40688, 40800, 40818, 40926, 40962, 41009, 41030, 41077, 41137, 41243, 41511, 41794, 42032],
  '1.14.2': [41858, 41959, 42065, 42082, 42214, 42597],
  '2.5.2': [39570, 39618, 39926, 40011, 40045, 40203, 40260, 40422, 40488, 40617, 40892, 41446, 41510],
  '2.5.3': [41402, 41531, 41750, 41812, 42083, 42328, 42598],
};

class Hermes {
  constructor(L) {
    this.L = L;
    this.dir = path.resolve(L.P.root, (L.cfg.hermes && L.cfg.hermes.dir) || 'Server/Tools/HermesProxy');
    this.proc = new ManagedProcess('hermes', 1500);
    this.lastExe = null;
    this.buildCache = null;
  }

  supported(exp) { return !!SERVER_BUILDS[exp]; }
  serverBuild(exp) { return SERVER_BUILDS[exp] || null; }

  // ---- executables -----------------------------------------------------------------------
  executables() {
    const out = [];
    const walk = (dir, depth) => {
      let entries;
      try { entries = fs.readdirSync(dir, { withFileTypes: true }); } catch { return; }
      for (const e of entries) {
        const p = path.join(dir, e.name);
        if (e.isDirectory()) {
          if (depth < 3 && !['.git', 'Framework', 'obj', 'CSV', 'AccountData', 'PacketsLog', 'scripts', '.github'].includes(e.name)) walk(p, depth + 1);
          continue;
        }
        if (!/^HermesProxy/i.test(e.name)) continue;
        const ext = path.extname(e.name).toLowerCase();
        const st = fs.statSync(p);
        if (IS_WIN ? ext !== '.exe' : (ext !== '' || st.size < 1e6)) continue;
        out.push({ path: path.relative(this.dir, p).replace(/\\/g, '/'), name: e.name, mtime: st.mtimeMs, hasConfig: exists(path.join(dir, 'HermesProxy.config')) });
      }
    };
    if (isDir(this.dir)) walk(this.dir, 0);
    return out.sort((a, b) => b.mtime - a.mtime);
  }

  exePath(rel) {
    const list = this.executables();
    const pick = list.find(e => e.path === rel) || list[0];
    return pick ? path.join(this.dir, pick.path) : null;
  }

  // ---- supported client builds ----------------------------------------------------------------
  // Read from the HermesProxy source (VersionChecker.IsSupportedModernVersion) so new
  // builds show up after updating HermesProxy; fall back to the list above.
  clientBuilds() {
    if (this.buildCache) return this.buildCache;
    const checker = readText(path.join(this.dir, 'HermesProxy', 'VersionChecker.cs'), '');
    const enumSrc = readText(path.join(this.dir, 'Framework', 'Constants', 'ClientVersionBuild.cs'), '');
    const notes = {};
    for (const m of enumSrc.matchAll(/V(\d+)_(\d+)_(\d+)\w*_(\d+)\s*=\s*\d+,\s*(?:\/\/\s*(.*))?/g)) notes[m[4]] = (m[5] || '').trim();
    let builds = [];
    const start = checker.indexOf('IsSupportedModernVersion');
    if (start >= 0) {
      const body = checker.slice(start, checker.indexOf('GetBestLegacyVersion', start));
      for (const m of body.matchAll(/ClientVersionBuild\.V(\d+)_(\d+)_(\d+)\w*?_(\d+)/g)) {
        builds.push({ build: +m[4], version: `${m[1]}.${m[2]}.${m[3]}`, major: +m[1], note: notes[m[4]] || '' });
      }
    }
    if (!builds.length) {
      for (const [version, list] of Object.entries(FALLBACK_BUILDS)) {
        for (const build of list) builds.push({ build, version, major: +version[0], note: '' });
      }
    }
    builds.sort((a, b) => (a.version === b.version ? b.build - a.build : b.version.localeCompare(a.version, 'en', { numeric: true })));
    this.buildCache = builds;
    return builds;
  }

  buildsFor(exp) {
    const sb = this.serverBuild(exp);
    return sb ? this.clientBuilds().filter(b => b.major === sb.clientMajor) : [];
  }

  defaultBuild(exp) {
    const list = this.buildsFor(exp);
    return (list.find(b => /live/.test(b.note)) || list[0] || {}).build || null;
  }

  // ---- config file ------------------------------------------------------------------------------
  configPath(exe) { return exe ? path.join(path.dirname(exe), 'HermesProxy.config') : null; }

  readConfig(file) {
    const out = {};
    for (const m of readText(file, '').matchAll(/<add\s+key="([^"]+)"\s+value="([^"]*)"\s*\/>/g)) out[m[1]] = m[2];
    return out;
  }

  // Change only the given keys, keeping comments and everything else as it is.
  writeConfig(file, values) {
    if (!exists(file)) {
      const template = path.join(this.dir, 'HermesProxy', 'HermesProxy.config');
      if (!exists(template)) throw new Error(`HermesProxy.config not found next to the executable (${path.dirname(file)})`);
      fs.copyFileSync(template, file);
    }
    let text = fs.readFileSync(file, 'utf8');
    for (const [key, value] of Object.entries(values)) {
      const re = new RegExp(`(<add\\s+key="${key}"\\s+value=")[^"]*("\\s*/>)`);
      const v = String(value).replace(/[<>"&]/g, '');
      text = re.test(text) ? text.replace(re, `$1${v}$2`) : text.replace('</appSettings>', `  <add key="${key}" value="${v}" />\n  </appSettings>`);
    }
    fs.writeFileSync(file, text);
  }

  // ---- settings (per expansion, kept in runtime/state.json) ----------------------------------------
  settings(exp) {
    const all = this.L.state.hermes || {};
    const s = all[exp] || {};
    const exe = this.exePath(all.exe);
    const cfg = exe ? this.readConfig(this.configPath(exe)) : {};
    const builds = this.buildsFor(exp);
    const fromFile = builds.some(b => String(b.build) === cfg.ClientBuild) ? +cfg.ClientBuild : null;
    return {
      enabled: !!s.enabled,
      exe: exe ? path.relative(this.dir, exe).replace(/\\/g, '/') : null,
      clientBuild: s.clientBuild || fromFile || this.defaultBuild(exp),
      externalAddress: s.externalAddress || cfg.ExternalAddress || this.L.realmAddress(exp),
      bnetPort: +(cfg.BNetPort || 1119),
    };
  }

  saveSettings(exp, input) {
    if (!this.supported(exp)) throw httpError(400, 'HermesProxy only supports the Vanilla and TBC servers');
    const builds = this.buildsFor(exp);
    const clientBuild = +input.clientBuild;
    if (!builds.some(b => b.build === clientBuild)) throw httpError(400, 'Choose a client version for this expansion');
    const addr = String(input.externalAddress || '').trim();
    if (!addr || /\s/.test(addr) || addr.length > 64) throw httpError(400, 'Enter a valid external address');
    const list = this.executables();
    if (!list.length) throw httpError(400, `No HermesProxy executable found in ${this.dir}`);
    const exe = list.some(e => e.path === input.exe) ? input.exe : list[0].path;
    const all = this.L.state.hermes || {};
    all.exe = exe;
    all[exp] = { enabled: !!input.enabled, clientBuild, externalAddress: addr };
    this.L.state.hermes = all;
    this.L.saveState();
    this.applyConfig(exp);
  }

  // Make HermesProxy.config match the expansion and the chosen client.
  applyConfig(exp) {
    const s = this.settings(exp);
    const exe = this.exePath(s.exe);
    if (!exe) throw new Error(`No HermesProxy executable found in ${this.dir}`);
    this.writeConfig(this.configPath(exe), {
      ClientBuild: s.clientBuild,
      ServerBuild: this.serverBuild(exp).build,
      ServerAddress: '127.0.0.1',
      ServerPort: this.realmPort(exp),
      ExternalAddress: s.externalAddress,
    });
    return exe;
  }

  realmPort(exp) {
    const conf = readText(path.join(this.L.P.settings(exp), 'realmd.conf'), '');
    const m = conf.match(/^\s*RealmServerPort\s*=\s*(\d+)/m);
    return m ? +m[1] : 3724;
  }

  // ---- process ------------------------------------------------------------------------------------
  enabled(exp) { return this.supported(exp) && this.settings(exp).enabled; }

  async start(exp, ctx) {
    if (this.proc.running) return;
    if (!this.supported(exp)) throw new Error('HermesProxy only supports the Vanilla and TBC servers');
    const exe = this.applyConfig(exp);
    const s = this.settings(exp);
    if (await portOpen('127.0.0.1', s.bnetPort)) {
      throw new Error(`Port ${s.bnetPort} is already in use. Is another HermesProxy running?`);
    }
    if (!IS_WIN) { try { fs.chmodSync(exe, 0o755); } catch { /* read-only fs */ } }
    const build = this.buildsFor(exp).find(b => b.build === s.clientBuild);
    ctx.log(`Starting HermesProxy for ${build ? build.version : ''} (${s.clientBuild}) clients -> server ${this.serverBuild(exp).version} (${this.serverBuild(exp).build})...`);
    this.lastExe = exe;
    this.proc.start(exe, ['--no-version-check'], path.dirname(exe));
  }

  async stop() {
    if (!this.proc.running) return;
    this.proc.kill();
    await this.proc.waitExit(5000);
  }

  status(exp) {
    return {
      supported: this.supported(exp),
      enabled: this.enabled(exp),
      running: this.proc.running,
      pid: this.proc.pid,
      clientBuild: this.supported(exp) ? this.settings(exp).clientBuild : null,
    };
  }

  info(exp) {
    const sb = this.serverBuild(exp);
    const exe = sb ? this.exePath((this.L.state.hermes || {}).exe) : null;
    return {
      dir: this.dir,
      supported: !!sb,
      serverBuild: sb,
      executables: this.executables(),
      builds: this.buildsFor(exp),
      settings: sb ? this.settings(exp) : null,
      configFile: exe ? this.configPath(exe) : null,
      running: this.proc.running,
    };
  }
}

module.exports = { Hermes, SERVER_BUILDS };
