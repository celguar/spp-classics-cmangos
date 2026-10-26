'use strict';
const path = require('path');
const fs = require('fs');
const EventEmitter = require('events');
const { spawn } = require('child_process');
const { loadConfig, makePaths } = require('./config');
const { Flags } = require('./flags');
const { Tools } = require('./tools');
const { Jobs } = require('./jobs');
const { ManagedProcess, findSystemProcesses, killPid, portOpen } = require('./procs');
const { Hermes } = require('./hermes');
const { BinaryCheck } = require('./binaries');
const { IS_WIN, exists, isDir, readFirstLine, writeText, rmFile, sleep, httpError } = require('./util');

const SYS_NAMES = IS_WIN ? ['mangosd.exe', 'realmd.exe', 'spp-httpd.exe'] : ['mangosd', 'realmd'];

const fmtWait = sec => (sec < 60 ? `${sec}s` : `${Math.floor(sec / 60)}m ${String(sec % 60).padStart(2, '0')}s`);

class Launcher extends EventEmitter {
  constructor() {
    super();
    this.cfg = loadConfig();
    this.P = makePaths(this.cfg);
    this.flags = new Flags(this.P.versions);
    this.tools = new Tools(this.cfg, this.P);
    this.jobs = new Jobs();
    this.stateFile = path.join(this.P.runtime, 'state.json');
    this.state = { selected: null, autoRestart: false, ...this.readState() };

    this.mangosd = new ManagedProcess('mangosd');
    this.realmd = new ManagedProcess('realmd', 1000);
    this.mysqld = new ManagedProcess('mysqld', 500);
    this.httpd = new ManagedProcess('httpd', 300);
    this.hermes = new Hermes(this);
    this.binaries = new BinaryCheck(this);
    this.serverExp = null; // expansion whose mangosd we started
    this.online = false; // mangosd finished loading
    this.prepared = new Set(); // expansions checked/updated this session
    this.ranThisSession = new Set(); // autosave on shutdown only if the server ran
    this.sys = { list: [], at: 0, pending: null };
    this.autosaveTimer = null;
    this.restartTimer = null;
    this.ownPids = new Set(); // every pid we started, so stale process lists never look external

    for (const p of [this.mangosd, this.realmd, this.mysqld, this.httpd, this.hermes.proc]) {
      p.on('line', line => this.emit('console', p.name, line));
      p.on('started', pid => this.ownPids.add(pid));
    }
    this.mangosd.on('line', (line) => {
      if (!this.online && /World initialized|SERVER STARTUP TIME/i.test(line)) {
        this.online = true;
        this.emit('changed');
      }
    });
    this.mangosd.on('exit', ({ expected }) => {
      this.online = false;
      this.emit('changed');
      if (!expected) this.onUnexpectedExit();
    });
    this.hermes.proc.on('exit', ({ expected }) => {
      this.emit('changed');
      if (!expected) this.onHermesExit();
    });
  }

  readState() {
    try { return JSON.parse(fs.readFileSync(this.stateFile, 'utf8')); } catch { return {}; }
  }

  saveState() { writeText(this.stateFile, JSON.stringify(this.state, null, 2)); }

  exp(id) {
    const e = this.cfg.expansions[id];
    if (!e) throw httpError(400, `Unknown expansion "${id}"`);
    return e;
  }

  requireSelected() {
    if (!this.state.selected) throw httpError(400, 'Choose an expansion first');
    return this.exp(this.state.selected);
  }

  select(exp) {
    this.state.selected = exp;
    this.saveState();
    this.emit('changed');
  }

  // ---- process discovery -----------------------------------------------------------
  async systemProcesses(maxAgeMs = 4000) {
    if (Date.now() - this.sys.at < maxAgeMs) return this.sys.list;
    if (!this.sys.pending) {
      this.sys.pending = findSystemProcesses(SYS_NAMES)
        .then((list) => { this.sys = { list, at: Date.now(), pending: null }; return list; })
        .catch(() => { this.sys.pending = null; return this.sys.list; });
    }
    return this.sys.pending;
  }

  // Processes of this expansion that the launcher did not start itself.
  async externalProcs(exp, which) {
    const list = await this.systemProcesses();
    const own = this.ownPids;
    const target = path.normalize(which === 'mangosd' ? this.P.mangosd(exp) : this.P.realmd(exp)).toLowerCase();
    return list.filter(p => !own.has(p.pid) && p.name.toLowerCase().startsWith(which)
      && (!p.path || path.normalize(p.path).toLowerCase() === target || which === 'realmd'));
  }

  async serverRunning(exp) {
    if (this.mangosd.running && this.serverExp === exp) return true;
    return (await this.externalProcs(exp, 'mangosd')).length > 0;
  }

  async runningExpansion() {
    if (this.mangosd.running) return this.serverExp;
    for (const id of Object.keys(this.cfg.expansions)) {
      if ((await this.externalProcs(id, 'mangosd')).some(p => p.path)) return id;
    }
    return null;
  }

  // ---- database ----------------------------------------------------------------------
  dbUp() { return portOpen(this.cfg.database.host, this.cfg.database.port); }

  async startDatabase(ctx) {
    if (await this.dbUp()) return;
    const d = this.cfg.database;
    if (!d.managed) {
      throw new Error(`MySQL is not reachable at ${d.host}:${d.port}. Start your MySQL/MariaDB server or set database.startCommand in WebLauncher/config.json.`);
    }
    if (d.startCommand) {
      ctx.log(`Starting database: ${d.startCommand}`);
      spawn(d.startCommand, { shell: true, detached: true, stdio: 'ignore', cwd: this.P.root }).unref();
    } else {
      if (!isDir(this.P.database)) {
        ctx.log('Extracting MySQL database (first launch)...');
        await this.tools.extract(ctx, path.join(this.P.root, 'Server', 'Database.7z'), path.join(this.P.root, 'Server'), 'MySQL');
      }
      ctx.log('Starting MySQL database...');
      this.mysqld.start(path.join(this.P.database, 'bin', 'mysqld.exe'), [
        `--defaults-file=${path.join(this.P.database, 'SPP-Database.ini')}`,
        '--console', '--standalone', '--explicit_defaults_for_timestamp', '--log_syslog=0', '--sql-mode=',
      ], this.P.root);
    }
    for (let i = 0; i < 120; i++) {
      await sleep(500);
      if (await this.dbUp()) { await sleep(500); this.emit('changed'); return; }
      if (!d.startCommand && !this.mysqld.running) break;
    }
    throw new Error('MySQL did not start. Check the database console for errors.');
  }

  async stopDatabase(ctx) {
    const d = this.cfg.database;
    if (!d.managed || !(await this.dbUp())) return;
    if (ctx) ctx.log('Shutting down MySQL database...');
    if (d.stopCommand) {
      spawn(d.stopCommand, { shell: true, detached: true, stdio: 'ignore', cwd: this.P.root }).unref();
    } else {
      await this.tools.adminShutdown().catch(() => {});
    }
    for (let i = 0; i < 60; i++) {
      if (!(await this.dbUp())) break;
      await sleep(500);
    }
    if (this.mysqld.running && !(await this.mysqld.waitExit(5000))) this.mysqld.kill();
    this.emit('changed');
  }

  // ---- website (bundled Apache on Windows) --------------------------------------------
  websiteInstalled() { return isDir(this.P.website) && exists(path.join(this.P.website, 'index.php')); }

  websiteFilesVersion() { return this.flags.has('website_version.spp') ? Math.max(1, this.flags.readInt('website_version.spp') || 0) : 0; }

  async httpdRunning() {
    if (this.httpd.running) return true;
    if (!IS_WIN) return false;
    return (await this.systemProcesses()).some(p => p.name.toLowerCase() === 'spp-httpd.exe');
  }

  async startWebsite(ctx, exp) {
    const E = this.exp(exp);
    if (isDir(this.P.website)) {
      for (const id of Object.keys(this.cfg.expansions)) rmFile(path.join(this.P.website, `${id}.spp`));
      writeText(path.join(this.P.website, `${exp}.spp`), `${exp} \r\n`);
    }
    if (this.cfg.website.managed && this.websiteInstalled() && !(await this.httpdRunning())) {
      if (!isDir(this.P.apache)) {
        ctx.log('Extracting web server (Apache + PHP)...');
        await this.tools.extract(ctx, path.join(this.P.tools, 'Apache.7z'), this.P.tools, 'Apache');
      }
      ctx.log('Starting website...');
      this.httpd.start(path.join(this.P.apache, 'bin', 'spp-httpd.exe'), [], this.P.apache);
      this.sys.at = 0;
    }
    await this.tools.sqlFile(null, path.join(this.P.sql(exp), 'website_news.sql'), E.db.login);
    this.emit('changed');
  }

  async stopWebsite() {
    this.httpd.kill();
    if (IS_WIN) {
      for (const p of await this.systemProcesses(0)) if (p.name.toLowerCase() === 'spp-httpd.exe') killPid(p.pid);
    }
    this.sys.at = 0;
    this.emit('changed');
  }

  // ---- realm server --------------------------------------------------------------------
  async startServer(ctx) {
    const E = this.requireSelected();
    const exp = E.id;
    const other = await this.runningExpansion();
    if (other && other !== exp) throw httpError(409, `${this.exp(other).label} server is running. Stop it first.`);
    if (await this.serverRunning(exp)) throw httpError(409, 'Server is already running!');
    if (!this.prepared.has(exp)) await require('./ops/install').prepareExpansion(this, ctx, exp);
    await this.startDatabase(ctx);
    if (!exists(this.P.mangosd(exp))) throw new Error(`mangosd not found in ${this.P.bin(exp)}`);
    this.binaries.assert(exp);
    if (this.flags.isOn('autosave')) {
      ctx.log('Autosave is enabled, saving characters...');
      await require('./ops/saves').makeAutosave(this, ctx, exp);
    }
    ctx.log(`Starting ${E.label} realm "${this.realmName(exp)}"...`);
    this.startWorld(exp);
    await this.startRealmd(exp);
    await this.startHermes(exp, ctx);
    this.ranThisSession.add(exp);
    this.startAutosaveTimer();
    this.emit('changed');
  }

  // HermesProxy problems never stop the realm from starting.
  async startHermes(exp, ctx) {
    if (!this.hermes.enabled(exp) || this.hermes.proc.running) return;
    try { await this.hermes.start(exp, ctx); }
    catch (e) { ctx.log(`HermesProxy: ${e.message}`, 'warn'); }
  }

  // Linux CMaNGOS builds open every .conf (mangosd, realmd, aiplayerbot, ahbot,
  // modules) from SYSCONFDIR "../etc/". The servers run in Settings/<exp>, so point
  // Settings/etc at the running expansion's folder; Windows builds use the cwd.
  linkConfigDir(exp) {
    if (IS_WIN) return;
    const link = path.join(path.dirname(this.P.settings(exp)), 'etc');
    let st = null;
    try { st = fs.lstatSync(link); } catch { /* not there yet */ }
    if (st && !st.isSymbolicLink()) throw new Error(`${link} exists and is not a link; the Linux server would read its configs from there. Move it away.`);
    if (st && fs.readlinkSync(link) === exp) return;
    if (st) fs.unlinkSync(link);
    fs.symlinkSync(exp, link);
  }

  startWorld(exp) {
    this.serverExp = exp;
    this.online = false;
    this.linkConfigDir(exp);
    this.mangosd.start(this.P.mangosd(exp), ['-c', path.join(this.P.settings(exp), 'mangosd.conf')], this.P.settings(exp));
  }

  async startRealmd(exp) {
    if (this.realmd.running || (await this.externalProcs(exp, 'realmd')).length) return;
    if (!exists(this.P.realmd(exp))) throw new Error(`realmd not found in ${this.P.bin(exp)}`);
    this.linkConfigDir(exp);
    this.realmd.start(this.P.realmd(exp), ['-c', path.join(this.P.settings(exp), 'realmd.conf')], this.P.settings(exp));
  }

  async stopServer(ctx, { autosave = true } = {}) {
    const exp = this.serverExp || this.state.selected;
    this.stopAutosaveTimer();
    clearTimeout(this.restartTimer);
    ctx = ctx || { log: m => this.mangosd.push(`[launcher] ${m}`), progress: () => {} };
    const log = (m, l) => ctx.log(m, l);

    if (this.mangosd.running) {
      log('Saving and shutting down the world server...');
      await this.stopWorld(ctx, 'server shutdown 0');
    }
    if (exp) {
      const ext = await this.externalProcs(exp, 'mangosd');
      if (ext.length) {
        log('Stopping a server that was started outside the web launcher...');
        if (IS_WIN && exists(path.join(this.P.tools, 'shutdown.vbs'))) {
          spawn('wscript', [path.join(this.P.tools, 'shutdown.vbs')], { windowsHide: true, detached: true, stdio: 'ignore' }).unref();
          this.shuttingDown = true;
          this.forceStop = false;
          this.emit('changed');
          const start = Date.now();
          try {
            for (let i = 1; !this.forceStop; i++) {
              this.sys.at = 0;
              if (!(await this.externalProcs(exp, 'mangosd')).length) break;
              if (i % 15 === 0) log(`Still waiting for the world server to finish shutting down (${fmtWait(Math.round((Date.now() - start) / 1000))})...`);
              await sleep(2000);
            }
          } finally { this.shuttingDown = false; }
          if (this.forceStop) log('World server was force closed.', 'warn');
          this.forceStop = false;
        }
        this.sys.at = 0;
        for (const p of await this.externalProcs(exp, 'mangosd')) killPid(p.pid);
      }
    }
    this.realmd.kill();
    await this.hermes.stop();
    for (const p of (await this.systemProcesses(0)).filter(x => x.name.toLowerCase().startsWith('realmd'))) killPid(p.pid);
    this.sys.at = 0;
    this.online = false;
    this.emit('changed');

    if (autosave && exp && this.flags.isOn('autosave')) {
      if (this.ranThisSession.has(exp)) {
        log('Autosave is enabled, saving characters...');
        await require('./ops/saves').makeAutosave(this, ctx, exp);
      } else {
        log('Autosave skipped, server did not run.');
      }
    }
  }

  // Graceful stop of our own mangosd with a console command ("server shutdown N" or
  // "server restart N"). Waits until the process has exited: saving a long-running
  // world can take many minutes. Only forceStopWorld() (Force close button) or a
  // positive shutdownTimeoutSec ends the wait early by killing it.
  async stopWorld(ctx, command, delaySec = 0) {
    if (!this.mangosd.running) return;
    this.stopAutosaveTimer();
    clearTimeout(this.restartTimer);
    this.mangosd.stopping = true;
    this.shuttingDown = true;
    this.forceStop = false;
    this.emit('changed');
    // After saving, mangosd prints "Halting process..." and waits for its console thread,
    // which sits in fgets() on stdin. On Windows it unblocks that with a fake Enter key
    // (WriteConsoleInput), which only works on a real console, not on our pipe: send the
    // Enter ourselves, or mangosd never exits.
    const onLine = (l) => { if (/Halting process/i.test(l)) this.mangosd.nudge(); };
    this.mangosd.on('line', onLine);
    try { this.mangosd.write(command); } catch { /* exited meanwhile */ }
    const limit = this.cfg.shutdownTimeoutSec > 0 ? (delaySec + this.cfg.shutdownTimeoutSec) * 1000 : Infinity;
    const start = Date.now();
    try {
      while (!(await this.mangosd.waitExit(Math.min(30000, limit - (Date.now() - start))))) {
        const waited = Math.round((Date.now() - start) / 1000);
        if (Date.now() - start >= limit) {
          ctx.log(`Server did not stop within ${waited} seconds (shutdownTimeoutSec), forcing it to close.`, 'warn');
          this.mangosd.kill();
          await this.mangosd.waitExit(10000);
          break;
        }
        this.mangosd.nudge(); // in case the "Halting process" line was missed
        if (waited > delaySec) ctx.log(`Still waiting for the world server to finish shutting down (${fmtWait(waited - delaySec)})...`);
      }
      if (this.forceStop) ctx.log('World server was force closed.', 'warn');
    } finally {
      this.mangosd.off('line', onLine);
      this.shuttingDown = false;
      this.forceStop = false;
    }
    this.online = false;
    this.sys.at = 0; // the cached process list still shows the old mangosd
    this.emit('changed');
  }

  // Ends a stopWorld() wait right away (the server hangs instead of saving).
  forceStopWorld() {
    if (!this.shuttingDown) throw httpError(409, 'The world server is not shutting down');
    this.forceStop = true;
    this.mangosd.kill(); // an external mangosd is killed by stopServer once the wait ends
  }

  // Start world (and realm) server again after a maintenance stop.
  async resumeServer(exp, ctx) {
    this.binaries.assert(exp); // an update may have left the binary behind the databases
    this.startWorld(exp);
    await this.startRealmd(exp);
    await this.startHermes(exp, ctx || { log: m => this.mangosd.push(`[launcher] ${m}`) });
    this.ranThisSession.add(exp);
    this.startAutosaveTimer();
    this.emit('changed');
  }

  // Launcher.bat may change after a repack update (git pull): re-read target versions.
  reloadVersions() {
    const fresh = loadConfig();
    this.cfg.repackVersion = fresh.repackVersion;
    this.cfg.websiteVersion = fresh.websiteVersion;
    for (const [id, e] of Object.entries(fresh.expansions)) Object.assign(this.cfg.expansions[id], e);
  }

  // Restarter mode also brings HermesProxy back when it crashes. Gives up after
  // 5 crashes in 10 minutes so a broken setup does not loop forever.
  onHermesExit() {
    const exp = this.serverExp;
    const log = m => this.hermes.proc.push(`[launcher] ${m}`);
    if (!this.state.autoRestart || !exp || !this.mangosd.running || !this.hermes.enabled(exp)) return;
    const now = Date.now();
    this.hermesCrashes = (this.hermesCrashes || []).filter(t => now - t < 10 * 60000);
    this.hermesCrashes.push(now);
    if (this.hermesCrashes.length > 5) {
      log('HermesProxy crashed 5 times in 10 minutes, the Restarter gives up. Check the output above, then start it again from Server Settings.');
      return;
    }
    const delay = this.cfg.restartDelaySec;
    log(`HermesProxy closed unexpectedly. Restarter: starting it again in ${delay} seconds...`);
    clearTimeout(this.hermesTimer);
    this.hermesTimer = setTimeout(async () => {
      if (this.hermes.proc.running || !this.mangosd.running || this.serverExp !== exp || !this.state.autoRestart) return;
      await this.startHermes(exp, { log: (m, l) => log(l === 'warn' ? `Restart failed: ${m}` : m) });
      this.emit('changed');
    }, delay * 1000);
  }

  onUnexpectedExit() {
    const exp = this.serverExp;
    this.stopAutosaveTimer();
    if (!this.state.autoRestart || !exp) return;
    const delay = this.cfg.restartDelaySec;
    this.mangosd.push(`[launcher] Server closed unexpectedly. Restarter: starting again in ${delay} seconds...`);
    clearTimeout(this.restartTimer);
    this.restartTimer = setTimeout(async () => {
      if (this.mangosd.running || this.state.selected !== exp || !this.state.autoRestart) return;
      try {
        this.binaries.assert(exp);
        this.startWorld(exp);
        await this.startRealmd(exp);
        await this.startHermes(exp, { log: m => this.mangosd.push(`[launcher] ${m}`) });
        this.startAutosaveTimer();
      } catch (e) { this.mangosd.push(`[launcher] Restart failed: ${e.message}`); }
      this.emit('changed');
    }, delay * 1000);
  }

  startAutosaveTimer() {
    this.stopAutosaveTimer();
    if (!this.flags.isOn('autosave_running')) return;
    const minutes = require('./ops/saves').intervalMin(this);
    this.mangosd.push(`[autosave] Saving every ${minutes} minutes while the server is running.`);
    this.autosaveTimer = setInterval(async () => {
      const exp = this.serverExp;
      if (!this.mangosd.running || !exp || this.jobs.busy) return;
      const ctx = { log: m => this.mangosd.push(`[autosave] ${m}`), progress: () => {} };
      try { await require('./ops/saves').makeAutosave(this, ctx, exp); }
      catch (e) { ctx.log(`failed: ${e.message}`); }
    }, minutes * 60000);
  }

  stopAutosaveTimer() {
    if (this.autosaveTimer) clearInterval(this.autosaveTimer);
    this.autosaveTimer = null;
  }

  // Back to expansion selection: stop the realm, website and database.
  async leaveExpansion(ctx) {
    await this.stopServer(ctx, { autosave: true });
    await this.stopWebsite();
    await this.stopDatabase(ctx);
    this.state.selected = null;
    this.saveState();
    this.emit('changed');
  }

  // ---- realm info ------------------------------------------------------------------------
  realmName(exp) { return readFirstLine(path.join(this.P.settings(exp), 'name.txt'), '') || this.exp(exp).label; }
  realmAddress(exp) { return readFirstLine(path.join(this.P.settings(exp), 'address.txt'), '') || '127.0.0.1'; }

  // ---- status snapshot for the UI ----------------------------------------------------------
  async status() {
    const [dbUp, sysList] = await Promise.all([this.dbUp(), this.systemProcesses()]);
    const sel = this.state.selected;
    const runningExp = await this.runningExpansion();
    const expansions = await Promise.all(Object.values(this.cfg.expansions).map(async e => ({
      id: e.id, label: e.label, short: e.short, patch: e.patch,
      installed: isDir(path.join(this.P.modules, e.id, 'dbc')),
      running: runningExp === e.id,
      beta: this.flags.has(`${e.id}_beta.on`),
      realmName: this.realmName(e.id),
    })));
    const out = {
      repackVersion: this.cfg.repackVersion,
      platform: process.platform,
      isWindows: IS_WIN,
      selected: sel,
      expansions,
      flags: {
        music: this.flags.isOn('music'),
        website: this.flags.isOn('website'),
        autosave: this.flags.isOn('autosave'),
        autosaveRunning: this.flags.isOn('autosave_running'),
        autoRestart: !!this.state.autoRestart,
      },
      database: { up: dbUp, managed: this.cfg.database.managed, host: this.cfg.database.host, port: this.cfg.database.port, user: this.cfg.database.user, password: this.cfg.database.password },
      website: {
        managed: this.cfg.website.managed,
        installed: this.websiteInstalled(),
        running: this.httpd.running || (IS_WIN && sysList.some(p => p.name.toLowerCase() === 'spp-httpd.exe')),
        url: this.cfg.website.url,
        version: this.websiteFilesVersion(),
        target: this.cfg.websiteVersion,
      },
      job: this.jobs.summary(),
      maintenance: this.scheduler ? this.scheduler.summary() : null,
      server: null,
    };
    if (sel) {
      const E = this.exp(sel);
      const extWorld = await this.externalProcs(sel, 'mangosd');
      const extRealm = await this.externalProcs(sel, 'realmd');
      const v = k => this.flags.current(sel, k);
      out.server = {
        exp: sel,
        prepared: this.prepared.has(sel),
        realmName: this.realmName(sel),
        address: this.realmAddress(sel),
        binariesFound: exists(this.P.mangosd(sel)),
        binDir: this.P.bin(sel),
        world: { running: (this.mangosd.running && this.serverExp === sel) || extWorld.length > 0, external: !this.mangosd.running && extWorld.length > 0, pid: this.mangosd.pid || (extWorld[0] && extWorld[0].pid) || null, since: this.mangosd.running ? this.mangosd.startedAt : null, online: this.online, shuttingDown: !!this.shuttingDown },
        hermes: this.hermes.status(sel),
        binary: this.binaries.info(sel),
        realm: { running: this.realmd.running || extRealm.length > 0, external: !this.realmd.running && extRealm.length > 0, pid: this.realmd.pid || (extRealm[0] && extRealm[0].pid) || null },
        beta: this.flags.has(`${sel}_beta.on`),
        versions: { core: v('core'), world: v('world'), chars: v('chars'), realm: v('realm'), bots: v('bots'), website: v('website'), maps: v('maps') },
        targets: E.versions,
      };
    }
    return out;
  }
}

module.exports = { Launcher };
