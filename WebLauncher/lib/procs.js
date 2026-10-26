'use strict';
const fs = require('fs');
const path = require('path');
const net = require('net');
const EventEmitter = require('events');
const { spawn, execFile } = require('child_process');
const { IS_WIN } = require('./util');

// eslint-disable-next-line no-control-regex
const ANSI = /\x1b\[[0-9;?]*[A-Za-z]/g;

// A child process the launcher owns: output is buffered for the web console and
// stdin stays open so commands can be sent (mangosd stops itself on stdin EOF).
class ManagedProcess extends EventEmitter {
  constructor(name, maxLines = 3000) {
    super();
    this.name = name;
    this.maxLines = maxLines;
    this.lines = [];
    this.child = null;
    this.pid = null;
    this.startedAt = null;
    this.exitCode = null;
    this.stopping = false;
    this.partial = '';
    this.flushTimer = null;
  }

  get running() { return !!this.child; }

  start(exe, args, cwd) {
    if (this.child) throw new Error(`${this.name} is already running`);
    this.stopping = false;
    this.exitCode = null;
    this.push(`[launcher] starting ${path.basename(exe)} ${args.join(' ')}`.trim());
    const child = spawn(exe, args, { cwd, windowsHide: true, stdio: ['pipe', 'pipe', 'pipe'] });
    this.child = child;
    this.pid = child.pid;
    this.startedAt = Date.now();
    if (child.pid) this.emit('started', child.pid);
    child.stdout.on('data', d => this.onData(d));
    child.stderr.on('data', d => this.onData(d));
    child.stdin.on('error', () => { /* process went away */ });
    child.on('error', (err) => {
      this.push(`[launcher] ${this.name} failed: ${err.message}`);
      if (!child.pid) this.onExit(-1, null);
    });
    child.on('exit', (code, signal) => this.onExit(code, signal));
    return child;
  }

  onExit(code, signal) {
    if (!this.child) return;
    if (this.partial) { this.push(this.partial); this.partial = ''; }
    this.child = null;
    this.pid = null;
    this.exitCode = code;
    this.push(`[launcher] ${this.name} exited (${code !== null ? 'code ' + code : signal})`);
    this.emit('exit', { code, signal, expected: this.stopping });
  }

  onData(buf) {
    const parts = (this.partial + buf.toString('utf8')).split(/\r\n|\n|\r/);
    this.partial = parts.pop();
    for (const l of parts) this.push(l);
    // a prompt such as "mangos>" has no newline; show it if nothing follows soon
    clearTimeout(this.flushTimer);
    if (this.partial) {
      this.flushTimer = setTimeout(() => { if (this.partial) { this.push(this.partial); this.partial = ''; } }, 400);
    }
  }

  push(raw) {
    const line = String(raw).replace(ANSI, '').replace(/^(mangos>\s*)+/, '').replace(/\x07/g, '');
    if (!line.trim()) return;
    this.lines.push(line);
    if (this.lines.length > this.maxLines) this.lines.splice(0, this.lines.length - this.maxLines);
    this.emit('line', line);
  }

  write(text) {
    if (!this.child) throw new Error(`${this.name} is not running`);
    this.push(`> ${text}`);
    this.child.stdin.write(text + '\n');
  }

  // Empty line on stdin, not echoed (an empty console command does nothing).
  nudge() {
    try { if (this.child) this.child.stdin.write('\n'); } catch { /* exited */ }
  }

  kill() {
    if (!this.child) return;
    this.stopping = true;
    killPid(this.child.pid);
  }

  waitExit(timeoutMs) {
    if (!this.child) return Promise.resolve(true);
    return new Promise((resolve) => {
      const t = setTimeout(() => { this.off('exit', done); resolve(false); }, timeoutMs);
      const done = () => { clearTimeout(t); resolve(true); };
      this.once('exit', done);
    });
  }
}

function killPid(pid) {
  if (!pid) return;
  if (IS_WIN) execFile('taskkill', ['/PID', String(pid), '/T', '/F'], { windowsHide: true }, () => {});
  else { try { process.kill(pid, 'SIGKILL'); } catch { /* gone */ } }
}

function execText(cmd, args) {
  return new Promise((resolve) => {
    execFile(cmd, args, { windowsHide: true, maxBuffer: 8 * 1024 * 1024 }, (err, stdout) => resolve(err ? '' : stdout));
  });
}

// Processes started outside the launcher (by Launcher.bat or a previous launcher run).
// Returns [{ pid, name, path }] for the given executable names.
async function findSystemProcesses(names) {
  const wanted = names.map(n => n.toLowerCase());
  if (IS_WIN) {
    // tasklist is fast; only ask PowerShell for paths when something is found
    const csv = await execText('tasklist', ['/FO', 'CSV', '/NH']);
    const hits = csv.split(/\r?\n/).map(l => l.split('","').map(s => s.replace(/"/g, '')))
      .filter(c => c.length > 1 && wanted.includes(c[0].toLowerCase()));
    if (!hits.length) return [];
    const filter = wanted.map(n => `Name='${n}'`).join(' OR ');
    const json = await execText('powershell', ['-NoProfile', '-NonInteractive', '-Command',
      `Get-CimInstance Win32_Process -Filter "${filter}" | Select-Object ProcessId,Name,ExecutablePath | ConvertTo-Json -Compress`]);
    try {
      const data = [].concat(JSON.parse(json || '[]'));
      return data.map(p => ({ pid: p.ProcessId, name: p.Name, path: p.ExecutablePath || '' }));
    } catch {
      return hits.map(c => ({ pid: +c[1], name: c[0], path: '' }));
    }
  }
  const out = [];
  let entries = [];
  try { entries = fs.readdirSync('/proc'); } catch { return out; }
  for (const e of entries) {
    if (!/^\d+$/.test(e)) continue;
    let exe;
    try { exe = fs.readlinkSync(`/proc/${e}/exe`); } catch { continue; }
    const base = path.basename(exe).replace(/ \(deleted\)$/, '');
    if (wanted.includes(base.toLowerCase())) out.push({ pid: +e, name: base, path: exe });
  }
  return out;
}

function portOpen(host, port, timeoutMs = 800) {
  return new Promise((resolve) => {
    const s = net.connect({ host, port });
    const done = (ok) => { s.destroy(); resolve(ok); };
    s.setTimeout(timeoutMs, () => done(false));
    s.once('connect', () => done(true));
    s.once('error', () => done(false));
  });
}

module.exports = { ManagedProcess, findSystemProcesses, killPid, portOpen };
