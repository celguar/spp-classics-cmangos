'use strict';
// Start the web launcher together with the operating system.
//   Windows: a minimized shortcut to Launcher-Web.bat in the user's Startup folder
//            (runs when the user logs in, like Launcher.bat would from there).
//   Linux:   a systemd user service, with "linger" so it runs at boot without a login;
//            a crontab @reboot line where systemd is not available.
// The launcher is started with --autostart, which skips opening the browser and may
// start a server (see autostartServer in state.json).
const fs = require('fs');
const os = require('os');
const path = require('path');
const { execFile } = require('child_process');
const { IS_WIN, ROOT, exists, writeText, rmFile, httpError } = require('./util');

const NAME = 'spp-weblauncher';
const LNK_NAME = 'SPP Classics Web Launcher.lnk';
const CRON_TAG = `# ${NAME}`;

function run(cmd, args, opts = {}) {
  return new Promise((resolve) => {
    const child = execFile(cmd, args, { windowsHide: true, timeout: 20000, ...opts }, (err, stdout, stderr) => {
      resolve({ ok: !err, code: err ? (err.code ?? 1) : 0, out: String(stdout || ''), err: String(stderr || (err && err.message) || '') });
    });
    if (opts.input != null) child.stdin.end(opts.input);
  });
}

const shq = s => `'${String(s).replace(/'/g, `'\\''`)}'`;

// ---- Windows -----------------------------------------------------------------------------
function startupDir() {
  return path.join(process.env.APPDATA || path.join(os.homedir(), 'AppData', 'Roaming'), 'Microsoft', 'Windows', 'Start Menu', 'Programs', 'Startup');
}
const winTarget = () => path.join(ROOT, 'Launcher-Web.bat');

// Paths go through environment variables, so nothing needs quoting for PowerShell.
function powershell(script, env) {
  return run('powershell.exe', ['-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'Bypass', '-Command', script], { env: { ...process.env, ...env } });
}

const win = {
  method: 'Windows Startup folder',
  async info() {
    const lnk = path.join(startupDir(), LNK_NAME);
    if (!exists(lnk)) return { enabled: false, location: lnk };
    const r = await powershell('(New-Object -ComObject WScript.Shell).CreateShortcut($env:SPP_LNK).TargetPath', { SPP_LNK: lnk });
    const target = r.out.trim();
    return { enabled: true, location: lnk, target, stale: !!target && path.resolve(target).toLowerCase() !== winTarget().toLowerCase() };
  },
  async enable() {
    const lnk = path.join(startupDir(), LNK_NAME);
    fs.mkdirSync(startupDir(), { recursive: true });
    const r = await powershell([
      '$s = (New-Object -ComObject WScript.Shell).CreateShortcut($env:SPP_LNK)',
      '$s.TargetPath = $env:SPP_TARGET',
      "$s.Arguments = '--autostart'",
      '$s.WorkingDirectory = $env:SPP_ROOT',
      '$s.WindowStyle = 7', // minimized
      "$s.Description = 'Starts the SPP Classics web launcher'",
      '$s.Save()',
    ].join('; '), { SPP_LNK: lnk, SPP_TARGET: winTarget(), SPP_ROOT: ROOT });
    if (!exists(lnk)) throw new Error(`Could not create the startup shortcut: ${r.err.trim() || 'unknown error'}`);
  },
  async disable() { rmFile(path.join(startupDir(), LNK_NAME)); },
};

// ---- Linux: systemd user service -----------------------------------------------------------
const unitDir = () => path.join(process.env.XDG_CONFIG_HOME || path.join(os.homedir(), '.config'), 'systemd', 'user');
const unitFile = () => path.join(unitDir(), `${NAME}.service`);
const serverJs = () => path.join(ROOT, 'WebLauncher', 'server.js');

function unitText() {
  // systemd needs the full node path (its PATH is minimal); quote paths with spaces
  const q = s => (/[\s"\\]/.test(s) ? `"${s.replace(/(["\\])/g, '\\$1')}"` : s);
  return `[Unit]
Description=SPP Classics web launcher

[Service]
Type=simple
WorkingDirectory=${q(ROOT)}
ExecStart=${q(process.execPath)} ${q(serverJs())} --autostart
# mangosd needs time to save the world when the computer shuts down
TimeoutStopSec=15min
KillMode=mixed

[Install]
WantedBy=default.target
`;
}

async function hasSystemd() {
  if (!exists('/run/systemd/system')) return false;
  return (await run('systemctl', ['--user', 'show-environment'])).ok;
}

const systemd = {
  method: 'systemd user service',
  async info() {
    const enabled = (await run('systemctl', ['--user', 'is-enabled', `${NAME}.service`])).out.trim() === 'enabled';
    const linger = (await run('loginctl', ['show-user', os.userInfo().username, '-p', 'Linger', '--value'])).out.trim() === 'yes';
    let stale = false;
    if (enabled && exists(unitFile())) stale = fs.readFileSync(unitFile(), 'utf8') !== unitText();
    return { enabled, location: unitFile(), linger, stale };
  },
  async enable() {
    writeText(unitFile(), unitText());
    await run('systemctl', ['--user', 'daemon-reload']);
    const r = await run('systemctl', ['--user', 'enable', `${NAME}.service`]);
    if (!r.ok) throw new Error(`systemctl --user enable failed: ${r.err.trim()}`);
    // without linger the user services only start when the user logs in
    await run('loginctl', ['enable-linger']);
  },
  async disable() {
    await run('systemctl', ['--user', 'disable', `${NAME}.service`]);
    rmFile(unitFile());
    await run('systemctl', ['--user', 'daemon-reload']);
  },
};

// ---- Linux fallback: crontab @reboot --------------------------------------------------------
async function readCrontab() {
  const r = await run('crontab', ['-l']);
  return r.ok ? r.out : '';
}
function cronLine() {
  const log = path.join(ROOT, 'WebLauncher', 'runtime', 'autostart.log');
  const line = `@reboot cd ${shq(ROOT)} && ${shq(process.execPath)} ${shq(serverJs())} --autostart >> ${shq(log)} 2>&1`;
  return `${line.replace(/%/g, '\\%')} ${CRON_TAG}`; // cron reads % as a newline
}
async function writeCrontab(lines) {
  const text = lines.filter(l => l.trim()).join('\n');
  const r = text ? await run('crontab', ['-'], { input: `${text}\n` }) : await run('crontab', ['-r']);
  if (!r.ok && text) throw new Error(`crontab failed: ${r.err.trim()}`);
}

const cron = {
  method: 'crontab @reboot',
  async info() {
    const line = (await readCrontab()).split('\n').find(l => l.endsWith(CRON_TAG));
    return { enabled: !!line, location: 'crontab -l', stale: !!line && line !== cronLine() };
  },
  async enable() {
    const lines = (await readCrontab()).split('\n').filter(l => !l.endsWith(CRON_TAG));
    await writeCrontab([...lines, cronLine()]);
  },
  async disable() {
    await writeCrontab((await readCrontab()).split('\n').filter(l => !l.endsWith(CRON_TAG)));
  },
};

// ---- public --------------------------------------------------------------------------------
async function backend() {
  if (IS_WIN) return win;
  if (process.platform !== 'linux') return null;
  if (await hasSystemd()) return systemd;
  if ((await run('crontab', ['-l'])).code !== 'ENOENT' && (await run('which', ['crontab'])).ok) return cron;
  return null;
}

async function info() {
  const b = await backend();
  if (!b) return { supported: false, reason: IS_WIN ? '' : 'Neither systemd (user services) nor crontab is available on this system.' };
  return { supported: true, method: b.method, ...(await b.info()) };
}

async function setEnabled(on) {
  const b = await backend();
  if (!b) throw httpError(409, 'Starting with the system is not supported here (no systemd user services or crontab).');
  if (on) await b.enable(); else await b.disable();
  return info();
}

module.exports = { info, setEnabled };
