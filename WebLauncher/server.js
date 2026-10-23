#!/usr/bin/env node
'use strict';
// SPP Classics web launcher: an admin panel replacing Launcher.bat that works on
// Windows and Linux. Run with `node WebLauncher/server.js` (or Launcher-Web.bat /
// launcher-web.sh) and open http://127.0.0.1:8090
const http = require('http');
const fs = require('fs');
const path = require('path');
const net = require('net');
const os = require('os');
const { spawn } = require('child_process');
const { Launcher } = require('./lib/launcher');
const { IS_WIN, exists, httpError } = require('./lib/util');
const install = require('./lib/ops/install');
const saves = require('./lib/ops/saves');
const manage = require('./lib/ops/manage');
const { Auth } = require('./lib/auth');
const { Scheduler } = require('./lib/scheduler');
const { gitAvailable } = require('./lib/ops/maintenance');

const L = new Launcher();
const cfg = L.cfg;
const PUBLIC = path.join(__dirname, 'public');
const LOOPBACK = ['127.0.0.1', 'localhost', '::1'];

const auth = new Auth(L.P.runtime, cfg.password);
L.scheduler = new Scheduler(L);

// ---- auth ------------------------------------------------------------------------------
// Only answer to IP addresses, localhost and this machine's name, so a web page
// cannot reach the panel through DNS rebinding.
function allowedHost(hostHeader) {
  if (!hostHeader) return false;
  const name = hostHeader.replace(/:\d+$/, '').replace(/^\[|\]$/g, '').toLowerCase();
  if (net.isIP(name) || name === 'localhost' || name === os.hostname().toLowerCase()) return true;
  return [].concat(cfg.allowedHosts || []).map(h => String(h).toLowerCase()).includes(name);
}

function cookies(req) {
  const out = {};
  for (const part of (req.headers.cookie || '').split(';')) {
    const i = part.indexOf('=');
    if (i > 0) out[part.slice(0, i).trim()] = decodeURIComponent(part.slice(i + 1).trim());
  }
  return out;
}
const token = req => cookies(req).spp_session;
const isLoopback = req => /^(::1$|127\.|::ffff:127\.)/.test(req.socket.remoteAddress || '');

// ---- server-sent events -----------------------------------------------------------------
const clients = new Set();
function broadcast(type, data) {
  const msg = `event: ${type}\ndata: ${JSON.stringify(data)}\n\n`;
  for (const res of clients) res.write(msg);
}
L.on('console', (proc, line) => broadcast('console', { proc, line }));
L.on('changed', () => broadcast('changed', {}));
L.jobs.on('job', job => broadcast('job', job));
L.jobs.on('log', (id, entry) => broadcast('joblog', { id, ...entry }));
L.jobs.on('progress', (id, progress) => broadcast('progress', { id, progress }));
setInterval(() => { for (const res of clients) res.write(': ping\n\n'); }, 25000);

// ---- helpers -----------------------------------------------------------------------------
function send(res, status, body, type = 'application/json; charset=utf-8') {
  const data = typeof body === 'string' || Buffer.isBuffer(body) ? body : JSON.stringify(body);
  res.writeHead(status, { 'Content-Type': type, 'Cache-Control': 'no-store', 'X-Content-Type-Options': 'nosniff' });
  res.end(data);
}

function readBody(req) {
  return new Promise((resolve, reject) => {
    let size = 0;
    const chunks = [];
    req.on('data', (c) => {
      size += c.length;
      if (size > 8 * 1024 * 1024) { reject(httpError(413, 'Request too large')); req.destroy(); return; }
      chunks.push(c);
    });
    req.on('end', () => {
      if (!chunks.length) { resolve({}); return; }
      try { resolve(JSON.parse(Buffer.concat(chunks).toString('utf8'))); } catch { reject(httpError(400, 'Invalid JSON')); }
    });
    req.on('error', reject);
  });
}

const sel = () => L.requireSelected().id;
const job = (title, fn) => { const j = L.jobs.run(title, fn); return { job: j.id }; };

// ---- API routes ---------------------------------------------------------------------------
// [method, path, handler(body, query)] -> JSON
const routes = {
  'GET /api/status': () => L.status(),
  'GET /api/console': (b, q) => {
    const p = { mangosd: L.mangosd, realmd: L.realmd, mysqld: L.mysqld, httpd: L.httpd, hermes: L.hermes.proc }[q.get('proc') || 'mangosd'];
    if (!p) throw httpError(400, 'Unknown process');
    return { lines: p.lines, running: p.running };
  },
  'POST /api/console': (b) => {
    const cmd = String(b.command || '').replace(/[\r\n]/g, ' ').trim();
    if (!cmd) throw httpError(400, 'Empty command');
    const p = b.proc === 'realmd' ? L.realmd : L.mangosd;
    if (!p.running) throw httpError(409, `${p.name} is not running${L.serverExp ? '' : ' (or was started outside the web launcher)'}`);
    p.write(cmd);
    return {};
  },
  'POST /api/toggle': async (b) => {
    const on = !!b.value;
    switch (b.name) {
      case 'music': L.flags.setToggle('music', on); break;
      case 'autosave': L.flags.setToggle('autosave', on); break;
      case 'autosaveRunning':
        L.flags.setToggle('autosave_running', on);
        if (on && L.mangosd.running) L.startAutosaveTimer(); else if (!on) L.stopAutosaveTimer();
        break;
      case 'autoRestart': L.state.autoRestart = on; L.saveState(); break;
      case 'website':
        L.flags.setToggle('website', on);
        if (!on) await L.stopWebsite();
        else if (L.state.selected && L.prepared.has(L.state.selected)) {
          return job('Starting website', ctx => L.startWebsite(ctx, L.state.selected));
        }
        break;
      default: throw httpError(400, 'Unknown setting');
    }
    L.emit('changed');
    return {};
  },

  // expansion & server lifecycle
  'POST /api/expansion/select': b => job(`Preparing ${L.exp(b.exp).label}`, ctx => install.prepareExpansion(L, ctx, b.exp)),
  'POST /api/expansion/leave': () => job('Returning to expansion selection', ctx => L.leaveExpansion(ctx)),
  'POST /api/server/start': () => job('Starting server', ctx => L.startServer(ctx)),
  'POST /api/binaries/accept': () => { L.binaries.accept(sel()); L.emit('changed'); return {}; },
  'POST /api/server/stop': b => job('Stopping server', ctx => L.stopServer(ctx, { autosave: b.autosave !== false })),
  'POST /api/server/restart': () => job('Restarting server', async (ctx) => { await L.stopServer(ctx, { autosave: false }); await L.startServer(ctx); }),
  'POST /api/shutdown': () => job('Shutting down repack', async (ctx) => {
    await L.leaveExpansion(ctx);
    ctx.log('Everything is stopped. The launcher will now exit; you can close this page.', 'ok');
    setTimeout(() => process.exit(0), 1500);
  }),
  'POST /api/website/update': () => job('Updating website', ctx => install.updateWebsiteFiles(L, ctx)),

  // HermesProxy (modern 1.14 / 2.5 clients)
  'GET /api/hermes': () => L.hermes.info(sel()),
  'POST /api/hermes': async (b) => {
    const exp = sel();
    L.hermes.saveSettings(exp, b);
    const log = { log: (m, l) => L.hermes.proc.push(`[launcher] ${l === 'warn' ? 'Warning: ' : ''}${m}`) };
    if (L.hermes.enabled(exp) && L.mangosd.running && L.serverExp === exp) await L.startHermes(exp, log);
    if (!L.hermes.enabled(exp)) await L.hermes.stop();
    L.emit('changed');
    return L.hermes.info(exp);
  },
  'POST /api/hermes/start': async () => {
    const exp = sel();
    await L.hermes.start(exp, { log: m => L.hermes.proc.push(`[launcher] ${m}`) });
    L.emit('changed');
    return {};
  },
  'POST /api/hermes/stop': async () => { await L.hermes.stop(); L.emit('changed'); return {}; },

  // scheduled maintenance
  'GET /api/maintenance': () => ({ ...L.scheduler.list(), gitAvailable: gitAvailable(L), isWindows: IS_WIN }),
  'GET /api/maintenance/log': (b, q) => ({ log: L.scheduler.historyLog(q.get('at')) }),
  'POST /api/maintenance/save': b => L.scheduler.upsert(b),
  'POST /api/maintenance/delete': (b) => { L.scheduler.remove(b.id); return {}; },
  'POST /api/maintenance/run': b => ({ job: L.scheduler.runNow(b.id).id }),
  'POST /api/maintenance/now': (b) => {
    if (!['restart', 'update'].includes(b.action)) throw httpError(400, 'Choose restart or update');
    const opts = { action: b.action, warnMinutes: b.warnMinutes, gitPull: !!b.gitPull, updateWebsite: !!b.updateWebsite, updateBeta: !!b.updateBeta };
    return { job: L.scheduler.start(opts, { label: b.action === 'update' ? 'Manual update & restart' : 'Manual restart' }).id };
  },

  // accounts
  'GET /api/accounts': async () => {
    const exp = sel();
    const [accounts, online] = await Promise.all([
      manage.listAccounts(L, exp).catch(e => ({ error: e.message })),
      manage.onlinePlayers(L, exp).catch(() => null),
    ]);
    return { accounts, online };
  },
  'POST /api/accounts/create': b => { manage.createAccount(L, b); return {}; },
  'POST /api/accounts/gmlevel': b => { manage.setGmLevel(L, b); return {}; },

  // settings, logs, files
  'GET /api/files': (b, q) => manage.listArea(L, q.get('kind'), q.get('kind') === 'changelog' ? null : sel(), q.get('db')),
  'GET /api/file': (b, q) => manage.readArea(L, q.get('kind'), q.get('kind') === 'changelog' ? null : sel(), q.get('db'), q.get('name')),
  'POST /api/file': (b) => { manage.writeArea(L, b.kind, sel(), b.db, b.name, b.text); return {}; },
  'POST /api/file/delete': (b) => { manage.deleteArea(L, b.kind, sel(), b.db, b.name); return {}; },
  'POST /api/realm': b => job('Changing realm settings', ctx => manage.setRealm(L, ctx, sel(), b)),

  // saves
  'GET /api/saves': () => saves.listSaves(L, sel()),
  'POST /api/saves/save': b => job(`Saving to slot ${b.slot}`, ctx => saves.saveSlot(L, ctx, sel(), String(b.slot), b.name)),
  'POST /api/saves/load': b => job(`Loading slot ${b.slot}`, ctx => saves.loadSlot(L, ctx, sel(), String(b.slot))),
  'POST /api/saves/delete': async (b) => { await saves.deleteSlot(L, sel(), String(b.slot)); return {}; },
  'POST /api/saves/autosave': () => job('Creating autosave', async (ctx) => { await L.startDatabase(ctx); await saves.makeAutosave(L, ctx, sel()); }),
  'POST /api/saves/autosave/load': b => job(`Loading ${b.file}`, ctx => saves.loadAutosave(L, ctx, sel(), b.file)),
  'POST /api/saves/autosave/delete': (b) => { saves.deleteAutosave(L, sel(), b.file); return {}; },

  // bots, database
  'POST /api/bots': b => job('Random bots', ctx => manage.bots(L, ctx, sel(), b.action)),
  'POST /api/wipe': (b) => {
    const exp = sel();
    if (b.what === 'world') return job('Wipe World DB', ctx => manage.wipeWorld(L, ctx, exp));
    if (b.what === 'characters') return job('Wipe Characters', ctx => manage.wipeCharacters(L, ctx, exp, false));
    if (b.what === 'all') return job('Wipe Characters & Accounts', ctx => manage.wipeCharacters(L, ctx, exp, true));
    throw httpError(400, 'Unknown wipe');
  },
  'GET /api/custom': (b, q) => manage.listCustom(L, sel(), q.get('db')),
  'POST /api/custom/apply': b => job(b.file ? `Applying ${b.file}` : 'Applying all custom SQL', ctx => manage.applyCustom(L, ctx, sel(), b.db, b.file || null)),
  'GET /api/locales': () => manage.listLocales(L, sel()),
  'POST /api/locales': b => job('Installing translations', ctx => manage.installLocales(L, ctx, sel(), [].concat(b.locales || []))),
  'GET /api/beta': () => manage.betaInfo(L, sel()),
  'POST /api/beta': (b) => {
    const exp = sel();
    if (b.action === 'enable') return job('Switching to Beta Build', ctx => manage.betaInstall(L, ctx, exp, false));
    if (b.action === 'update') return job('Updating Beta Build', ctx => manage.betaInstall(L, ctx, exp, true));
    if (b.action === 'disable') return job('Switching back to Release', ctx => manage.betaDisable(L, ctx, exp));
    throw httpError(400, 'Unknown action');
  },

  // service menu
  'POST /api/service/fixdb': () => job('Fix database errors', ctx => manage.fixDatabase(L, ctx)),
  'POST /api/service/vcredist': () => { manage.runVcredist(L); return {}; },
  'POST /api/service/extras': () => job('Starting SPP Extras', ctx => manage.openExtras(L, ctx)),
};

// ---- static files -------------------------------------------------------------------------
const MIME = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.css': 'text/css; charset=utf-8',
  '.png': 'image/png', '.jpg': 'image/jpeg', '.gif': 'image/gif', '.ico': 'image/x-icon', '.mp3': 'audio/mpeg', '.svg': 'image/svg+xml' };

function serveFile(res, file, cache = true) {
  fs.stat(file, (err, st) => {
    if (err || !st.isFile()) { send(res, 404, 'Not found', 'text/plain'); return; }
    res.writeHead(200, { 'Content-Type': MIME[path.extname(file).toLowerCase()] || 'application/octet-stream',
      'Content-Length': st.size, 'Cache-Control': cache ? 'max-age=3600' : 'no-store' });
    fs.createReadStream(file).pipe(res);
  });
}

function serveStatic(req, res, pathname) {
  let rel = decodeURIComponent(pathname);
  if (rel.startsWith('/music/')) {
    const name = path.basename(rel);
    serveFile(res, path.join(L.P.music, name));
    return;
  }
  if (rel === '/' || !path.extname(rel)) rel = '/index.html';
  const file = path.normalize(path.join(PUBLIC, rel));
  if (!file.startsWith(PUBLIC + path.sep)) { send(res, 403, 'Forbidden', 'text/plain'); return; }
  serveFile(res, file, !rel.endsWith('.html') && !rel.endsWith('.js') && !rel.endsWith('.css'));
}

// ---- request handling ------------------------------------------------------------------------
const server = http.createServer(async (req, res) => {
  const url = new URL(req.url, 'http://localhost');
  const { pathname } = url;
  try {
    if (!allowedHost(req.headers.host)) throw httpError(403, 'Unknown host name. Add it to "allowedHosts" in WebLauncher/config.json.');
    if (!pathname.startsWith('/api/')) { serveStatic(req, res, pathname); return; }

    // Custom header on every write request: a foreign web page cannot send it
    // without a CORS preflight, which this server never approves.
    if (req.method !== 'GET' && req.headers['x-spp'] !== '1') throw httpError(403, 'Missing request header');

    if (pathname === '/api/login' && req.method === 'POST') {
      const b = await readBody(req);
      // the default admin/admin login only works from this computer
      if (auth.isDefault && !isLoopback(req)) {
        throw httpError(403, 'The default admin password must be changed before logging in from another computer. Log in on the server machine first (Launcher > Launcher Settings).');
      }
      const t = auth.login(b.username, b.password);
      if (!t) { await new Promise(r => setTimeout(r, 800)); throw httpError(401, 'Wrong username or password'); }
      res.setHeader('Set-Cookie', `spp_session=${t}; HttpOnly; SameSite=Strict; Path=/`);
      send(res, 200, {});
      return;
    }
    if (pathname === '/api/session') {
      send(res, 200, { authed: auth.check(token(req)), required: true, username: auth.username, isDefault: auth.isDefault, loopback: isLoopback(req) });
      return;
    }
    if (!auth.check(token(req))) throw httpError(401, 'Login required');
    if (pathname === '/api/logout') { auth.logout(token(req)); send(res, 200, {}); return; }
    if (pathname === '/api/auth/change' && req.method === 'POST') {
      auth.change(token(req), await readBody(req));
      send(res, 200, { username: auth.username });
      return;
    }

    if (pathname === '/api/events') {
      res.writeHead(200, { 'Content-Type': 'text/event-stream', 'Cache-Control': 'no-store', Connection: 'keep-alive' });
      res.write('retry: 3000\n\n');
      clients.add(res);
      req.on('close', () => clients.delete(res));
      return;
    }
    if (pathname === '/api/download') {
      const file = manage.areaFilePath(L, url.searchParams.get('kind'), sel(), url.searchParams.get('db'), url.searchParams.get('name'));
      res.setHeader('Content-Disposition', `attachment; filename="${path.basename(file)}"`);
      serveFile(res, file, false);
      return;
    }

    const handler = routes[`${req.method} ${pathname}`];
    if (!handler) throw httpError(404, 'Unknown API endpoint');
    const body = req.method === 'POST' ? await readBody(req) : {};
    const result = await handler(body, url.searchParams);
    send(res, 200, result === undefined ? {} : result);
  } catch (e) {
    if (!e.status) console.error(e);
    if (!res.headersSent) send(res, e.status || 500, { error: e.message });
  }
});

server.on('error', (e) => {
  console.error(e.code === 'EADDRINUSE' ? `Port ${cfg.port} is already in use. Is the launcher already running? Change "port" in WebLauncher/config.json.` : e.message);
  process.exit(1);
});

server.listen(cfg.port, cfg.host, () => {
  const shown = LOOPBACK.includes(cfg.host) ? '127.0.0.1' : cfg.host === '0.0.0.0' ? '<this-machine-ip>' : cfg.host;
  const url = `http://${shown === '<this-machine-ip>' ? '127.0.0.1' : shown}:${cfg.port}/`;
  console.log(`\n  SPP Classics ${cfg.repackVersion} - Web Launcher`);
  console.log(`  Admin panel: http://${shown}:${cfg.port}/`);
  console.log(`  Platform: ${process.platform}, database ${cfg.database.managed ? 'managed by launcher' : 'external'} at ${cfg.database.host}:${cfg.database.port}`);
  console.log('  Keep this window open while you play. Use "Shutdown Repack" in the panel to stop everything.\n');
  if (cfg.openBrowser && !process.argv.includes('--no-browser')) openBrowser(url);
});

function openBrowser(url) {
  try {
    if (IS_WIN) spawn('rundll32', ['url.dll,FileProtocolHandler', url], { detached: true, stdio: 'ignore' }).unref();
    else if (process.platform === 'darwin') spawn('open', [url], { detached: true, stdio: 'ignore' }).unref();
    else if (process.env.DISPLAY || process.env.WAYLAND_DISPLAY) spawn('xdg-open', [url], { detached: true, stdio: 'ignore' }).on('error', () => {}).unref();
  } catch { /* no browser available */ }
}

// Closing the launcher window: stop the world server cleanly (it saves players).
let exiting = false;
function onSignal() {
  if (exiting) process.exit(1);
  exiting = true;
  console.log('\nStopping server before exit (press Ctrl+C again to force)...');
  L.stopServer(null, { autosave: true }).catch(() => {}).finally(() => process.exit(0));
}
process.on('SIGINT', onSignal);
process.on('SIGTERM', onSignal);
process.on('SIGHUP', onSignal); // console window closed (Windows) / terminal hung up
if (!exists(path.join(PUBLIC, 'index.html'))) console.warn('public/index.html is missing');
