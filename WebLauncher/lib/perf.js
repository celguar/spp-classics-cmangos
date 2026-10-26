'use strict';
// Resource usage for the Performance page: the whole machine (CPU, RAM, disk) and the
// repack's processes. Sampling only runs while the page is open, unless background
// recording is on (perfHistory in config.json): then it samples every 10 seconds and
// keeps 24 hours of per-minute history in runtime/perf-history.json.
//   Linux:   everything comes from /proc.
//   Windows: machine numbers from Node; per-process numbers from one hidden PowerShell
//            helper (Get-Process) that stays alive while sampling, so PowerShell does not
//            start up every few seconds.
const fs = require('fs');
const os = require('os');
const path = require('path');
const { spawn, execFileSync } = require('child_process');
const { IS_WIN, ROOT, readText } = require('./util');

const INTERVAL_MS = 2000;
const IDLE_MS = 30000;      // stop sampling this long after the page was last polled
const HISTORY = 300;        // recent points kept (10 minutes at 2s)
const BG_INTERVAL_MS = 10000; // background recording, while the page is closed
const MINUTE_MS = 60000;
const LONG_MS = 24 * 3600000; // per-minute history kept
const SAVE_MS = 5 * 60000;    // write the history to disk this often

// Process groups shown in the table, matched by process name.
const GROUPS = [
  { key: 'mangosd', label: 'World server', names: ['mangosd'] },
  { key: 'realmd', label: 'Realm server', names: ['realmd'] },
  { key: 'db', label: 'Database', names: ['mysqld', 'mariadbd'] },
  { key: 'web', label: 'Website', names: IS_WIN ? ['spp-httpd'] : ['apache2', 'httpd', 'nginx'], match: IS_WIN ? null : /^php-fpm/ },
  { key: 'hermes', label: 'HermesProxy', names: ['HermesProxy'] },
];
const groupOf = (name) => {
  const n = name.toLowerCase().replace(/\.exe$/, '');
  return GROUPS.find(g => g.names.some(x => x.toLowerCase() === n) || (g.match && g.match.test(n)));
};

// ---- machine -------------------------------------------------------------------------------
function cpuTimes() {
  let idle = 0;
  let total = 0;
  for (const c of os.cpus()) {
    const t = c.times;
    idle += t.idle;
    total += t.user + t.nice + t.sys + t.idle + t.irq;
  }
  return { idle, total };
}

function memory() {
  if (!IS_WIN) {
    const m = {};
    for (const l of readText('/proc/meminfo', '').split('\n')) {
      const r = l.match(/^(\w+):\s+(\d+)/);
      if (r) m[r[1]] = +r[2] * 1024;
    }
    if (m.MemTotal) {
      const avail = m.MemAvailable ?? m.MemFree;
      return { total: m.MemTotal, used: m.MemTotal - avail, cache: (m.Buffers || 0) + (m.Cached || 0) + (m.SReclaimable || 0),
        swapTotal: m.SwapTotal || 0, swapUsed: (m.SwapTotal || 0) - (m.SwapFree || 0) };
    }
  }
  const total = os.totalmem();
  return { total, used: total - os.freemem() };
}

function disk() {
  try {
    const s = fs.statfsSync(ROOT); // Node 18.15+
    return { path: ROOT, total: s.blocks * s.bsize, free: s.bavail * s.bsize };
  } catch { return null; }
}

function osName() {
  if (IS_WIN) return typeof os.version === 'function' ? os.version() : `Windows ${os.release()}`;
  const m = readText('/etc/os-release', '').match(/^PRETTY_NAME="?([^"\n]+)/m);
  return m ? m[1] : `${os.type()} ${os.release()}`;
}

// ---- processes: Linux ----------------------------------------------------------------------
let linuxConst = null;
function linuxConstants() {
  if (linuxConst) return linuxConst;
  let hz = 100;
  try { hz = +execFileSync('getconf', ['CLK_TCK'], { encoding: 'utf8' }).trim() || 100; } catch { /* default */ }
  const bt = readText('/proc/stat', '').match(/^btime (\d+)/m);
  linuxConst = { hz, bootMs: bt ? +bt[1] * 1000 : Date.now() - os.uptime() * 1000 };
  return linuxConst;
}

// [{ pid, name, cpuMs, mem, threads, start }]
function linuxProcs() {
  const { hz, bootMs } = linuxConstants();
  const out = [];
  let entries = [];
  try { entries = fs.readdirSync('/proc'); } catch { return out; }
  for (const e of entries) {
    if (!/^\d+$/.test(e)) continue;
    let stat;
    try { stat = fs.readFileSync(`/proc/${e}/stat`, 'utf8'); } catch { continue; }
    const open = stat.indexOf('(');
    const close = stat.lastIndexOf(')');
    const name = stat.slice(open + 1, close);
    if (!groupOf(name)) continue;
    const f = stat.slice(close + 2).split(' '); // f[0] is field 3 (state)
    const rss = readText(`/proc/${e}/status`, '').match(/^VmRSS:\s+(\d+)/m);
    out.push({ pid: +e, name, cpuMs: ((+f[11]) + (+f[12])) * 1000 / hz, mem: rss ? +rss[1] * 1024 : 0,
      threads: +f[17], start: bootMs + (+f[19]) * 1000 / hz });
  }
  return out;
}

// ---- processes: Windows --------------------------------------------------------------------
const PS_SCRIPT = `
$names = @(${GROUPS.flatMap(g => g.names).map(n => `'${n}'`).join(',')})
while ($null -ne [Console]::In.ReadLine()) {
  $out = @(Get-Process -Name $names -ErrorAction SilentlyContinue | ForEach-Object {
    $c = $null; $s = $null
    try { $c = $_.TotalProcessorTime.TotalMilliseconds } catch {}
    try { $s = [long]($_.StartTime.ToUniversalTime() - [datetime]'1970-01-01').TotalMilliseconds } catch {}
    @{ n = $_.ProcessName; id = $_.Id; cpu = $c; mem = $_.WorkingSet64; th = $_.Threads.Count; start = $s }
  })
  [Console]::Out.WriteLine((ConvertTo-Json -Compress -InputObject $out))
}`;

class WinHelper {
  constructor() { this.child = null; this.buf = ''; this.waiting = null; }

  start() {
    const encoded = Buffer.from(PS_SCRIPT, 'utf16le').toString('base64');
    const child = spawn('powershell.exe', ['-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'Bypass', '-EncodedCommand', encoded],
      { windowsHide: true, stdio: ['pipe', 'pipe', 'ignore'] });
    this.child = child;
    this.buf = '';
    child.stdout.on('data', (d) => {
      this.buf += d.toString('utf8');
      let i;
      while ((i = this.buf.indexOf('\n')) >= 0) {
        const line = this.buf.slice(0, i).trim();
        this.buf = this.buf.slice(i + 1);
        if (line && this.waiting) { const w = this.waiting; this.waiting = null; w(line); }
      }
    });
    child.stdin.on('error', () => { /* helper went away */ });
    child.on('exit', () => { if (this.child === child) this.child = null; if (this.waiting) { const w = this.waiting; this.waiting = null; w(null); } });
    child.on('error', () => { if (this.child === child) this.child = null; });
  }

  // [{ pid, name, cpuMs, mem, threads, start }] or null when PowerShell does not answer
  query(timeoutMs = 8000) {
    if (!this.child) this.start();
    if (this.waiting) return Promise.resolve(null);
    return new Promise((resolve) => {
      const t = setTimeout(() => { this.waiting = null; this.stop(); resolve(null); }, timeoutMs);
      this.waiting = (line) => {
        clearTimeout(t);
        if (!line) { resolve(null); return; }
        try {
          resolve([].concat(JSON.parse(line)).map(p => ({ pid: p.id, name: p.n, cpuMs: p.cpu, mem: p.mem, threads: p.th, start: p.start })));
        } catch { resolve(null); }
      };
      try { this.child.stdin.write('\n'); } catch { /* exit handler resolves */ }
    });
  }

  stop() {
    if (!this.child) return;
    try { this.child.stdin.end(); } catch { /* gone */ }
    const c = this.child;
    this.child = null;
    setTimeout(() => { try { c.kill(); } catch { /* gone */ } }, 2000);
  }
}

// ---- sampler -------------------------------------------------------------------------------
class Perf {
  // background: keep sampling (every 10s) while nobody has the page open
  // file: where the per-minute history is kept across launcher restarts
  constructor({ background = false, file = null } = {}) {
    this.history = [];      // recent samples, for the 10 minute chart
    this.long = [];         // one point per minute, 24 hours
    this.acc = null;        // the minute being collected
    this.current = null;
    this.prev = null;       // { at, cpu: cpuTimes(), procs: Map(pid -> cpuMs), self }
    this.timer = null;
    this.lastPoll = 0;
    this.lastSample = 0;
    this.lastSave = Date.now();
    this.dirty = false;
    this.sampling = null;
    this.background = false;
    this.file = file;
    this.win = IS_WIN ? new WinHelper() : null;
    this.load();
    this.setBackground(background);
  }

  setBackground(on) {
    this.background = !!on;
    if (this.background) this.ensureRunning();
  }

  async readProcs() {
    if (this.win) return (await this.win.query()) || [];
    return linuxProcs();
  }

  async sample() {
    const at = Date.now();
    this.lastSample = at;
    const cpu = cpuTimes();
    const procs = await this.readProcs();
    const self = process.cpuUsage();
    const prev = this.prev;
    const cores = os.cpus().length || 1;
    const wall = prev ? at - prev.at : 0;
    // CPU % of the whole machine (all cores = 100%), like Task Manager
    const pct = (ms, before) => (prev && before != null && ms != null && wall > 0 ? Math.max(0, Math.min(100, (ms - before) / wall / cores * 100)) : null);

    const groups = GROUPS.map(g => ({ key: g.key, label: g.label, names: [], pids: [], cpu: null, mem: 0, threads: 0, since: null }));
    for (const p of procs) {
      const g = groups[GROUPS.indexOf(groupOf(p.name))];
      if (!g) continue;
      if (!g.names.includes(p.name)) g.names.push(p.name);
      g.pids.push(p.pid);
      const c = pct(p.cpuMs, prev && prev.procs.get(p.pid));
      if (c != null) g.cpu = (g.cpu || 0) + c;
      g.mem += p.mem || 0;
      g.threads += p.threads || 0;
      if (p.start && (!g.since || p.start < g.since)) g.since = p.start;
    }
    const mu = process.memoryUsage();
    groups.push({ key: 'launcher', label: 'Web launcher', names: [IS_WIN ? 'node.exe' : 'node'], pids: [process.pid],
      cpu: pct((self.user + self.system) / 1000, prev && (prev.self.user + prev.self.system) / 1000),
      mem: mu.rss, threads: null, since: Date.now() - process.uptime() * 1000 });

    let sysCpu = null;
    if (prev && cpu.total > prev.cpu.total) sysCpu = Math.max(0, Math.min(100, 100 * (1 - (cpu.idle - prev.cpu.idle) / (cpu.total - prev.cpu.total))));
    const mem = memory();
    this.prev = { at, cpu, self, procs: new Map(procs.map(p => [p.pid, p.cpuMs])) };
    this.current = {
      at,
      cpu: sysCpu,
      load: IS_WIN ? null : os.loadavg(),
      mem,
      disk: disk(),
      uptime: os.uptime(),
      procs: groups.filter(g => g.pids.length),
    };
    if (sysCpu != null) {
      const p = {};
      for (const g of this.current.procs) p[g.key] = [g.cpu == null ? null : +g.cpu.toFixed(1), g.mem];
      this.history.push({ t: at, cpu: +sysCpu.toFixed(1), mem: mem.used, p });
      if (this.history.length > HISTORY) this.history.splice(0, this.history.length - HISTORY);
      this.collect(at, sysCpu, mem.used, this.current.procs);
    }
  }

  // ---- per-minute history: average CPU and RAM, and the CPU peak of each minute
  collect(at, sysCpu, memUsed, procs) {
    const minute = Math.floor(at / MINUTE_MS) * MINUTE_MS;
    if (this.acc && this.acc.t !== minute) this.flush();
    if (!this.acc) this.acc = { t: minute, n: 0, cpu: 0, max: 0, mem: 0, p: {} };
    const a = this.acc;
    a.n++;
    a.cpu += sysCpu;
    a.max = Math.max(a.max, sysCpu);
    a.mem += memUsed;
    for (const g of procs) {
      const s = a.p[g.key] || (a.p[g.key] = [0, 0, 0, 0]); // cpu sum, cpu samples, mem sum, mem samples
      if (g.cpu != null) { s[0] += g.cpu; s[1]++; }
      s[2] += g.mem;
      s[3]++;
    }
  }

  static point(a) {
    const p = {};
    for (const [k, s] of Object.entries(a.p)) p[k] = [s[1] ? +(s[0] / s[1]).toFixed(1) : null, Math.round(s[2] / s[3])];
    return { t: a.t, cpu: +(a.cpu / a.n).toFixed(1), max: +a.max.toFixed(1), mem: Math.round(a.mem / a.n), p };
  }

  flush() {
    if (!this.acc) return;
    // a launcher restart within the same minute: the newer part replaces it
    if (this.long.length && this.long[this.long.length - 1].t >= this.acc.t) this.long.pop();
    this.long.push(Perf.point(this.acc));
    this.acc = null;
    const from = Date.now() - LONG_MS;
    while (this.long.length && this.long[0].t < from) this.long.shift();
    this.dirty = true;
  }

  load() {
    if (!this.file) return;
    try {
      const data = JSON.parse(fs.readFileSync(this.file, 'utf8'));
      const from = Date.now() - LONG_MS;
      this.long = (data.long || []).filter(x => x && x.t >= from);
    } catch { /* none yet */ }
  }

  // Only written while background recording is on.
  save() {
    if (!this.file || !this.dirty || !this.background) return;
    try {
      fs.mkdirSync(path.dirname(this.file), { recursive: true });
      fs.writeFileSync(`${this.file}.tmp`, JSON.stringify({ long: this.long }));
      fs.renameSync(`${this.file}.tmp`, this.file);
      this.dirty = false;
      this.lastSave = Date.now();
    } catch { /* disk full or read-only: keep it in memory */ }
  }

  async tick() {
    if (this.sampling) return this.sampling;
    this.sampling = this.sample().catch(() => {}).finally(() => {
      this.sampling = null;
      if (this.dirty && Date.now() - this.lastSave > SAVE_MS) this.save();
    });
    return this.sampling;
  }

  ensureRunning() {
    if (this.timer) return;
    this.timer = setInterval(() => {
      const viewed = Date.now() - this.lastPoll < IDLE_MS;
      if (!viewed && !this.background) { this.stopSampling(); return; }
      if (!viewed && Date.now() - this.lastSample < BG_INTERVAL_MS - 500) return;
      this.tick();
    }, INTERVAL_MS);
  }

  stopSampling() {
    clearInterval(this.timer);
    this.timer = null;
    this.prev = null; // a later restart must not compute CPU over the idle gap
    if (this.win) this.win.stop();
  }

  async snapshot(since, longSince) {
    this.lastPoll = Date.now();
    if (!this.timer || !this.prev) {
      // CPU needs two samples; take them before answering so the first view has numbers
      await this.tick();
      await new Promise(r => setTimeout(r, 700));
      await this.tick();
      this.ensureRunning();
    }
    const cpus = os.cpus();
    return {
      interval: INTERVAL_MS,
      background: this.background,
      backgroundInterval: BG_INTERVAL_MS,
      host: { name: os.hostname(), os: osName(), cpuModel: (cpus[0] && cpus[0].model || '').trim(), cores: cpus.length, isWindows: IS_WIN },
      ...this.current,
      history: this.history.filter(h => h.t > (since || 0)),
      ...(longSince == null ? {} : { long: this.long.filter(h => h.t > longSince), longLive: this.acc ? Perf.point(this.acc) : null }),
    };
  }

  // when the launcher exits
  close() { this.flush(); this.save(); this.stopSampling(); }
}

module.exports = { Perf };
