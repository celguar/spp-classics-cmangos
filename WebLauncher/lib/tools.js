'use strict';
const fs = require('fs');
const path = require('path');
const https = require('https');
const http = require('http');
const { spawn } = require('child_process');
const { IS_WIN, exists, listFiles, mkdirp, writeText, which, httpError } = require('./util');

// Run a program and collect its output. Options:
//   cwd, stdinFile (piped to stdin), stdoutFile (stdout written there),
//   onLine(line) for live output.
function run(exe, args, opts = {}) {
  return new Promise((resolve, reject) => {
    let child;
    try {
      child = spawn(exe, args, { cwd: opts.cwd, windowsHide: true, stdio: ['pipe', 'pipe', 'pipe'] });
    } catch (e) { reject(e); return; }
    let stdout = '';
    let stderr = '';
    let partial = '';
    const onText = (t) => {
      if (opts.onData) opts.onData(t);
      if (!opts.onLine) return;
      const parts = (partial + t).split(/\r\n|\n|\r/);
      partial = parts.pop();
      for (const l of parts) if (l.trim()) opts.onLine(l);
    };
    if (opts.stdoutFile) {
      mkdirp(path.dirname(opts.stdoutFile));
      child.stdout.pipe(fs.createWriteStream(opts.stdoutFile));
    } else {
      child.stdout.on('data', d => { const t = d.toString('utf8'); if (stdout.length < 4e6) stdout += t; onText(t); });
    }
    child.stderr.on('data', d => { const t = d.toString('utf8'); if (stderr.length < 1e6) stderr += t; onText(t); });
    child.on('error', reject);
    child.on('close', code => resolve({ code, stdout, stderr }));
    child.stdin.on('error', () => { /* program exited before reading all input */ });
    if (opts.stdinFile) fs.createReadStream(opts.stdinFile).on('error', reject).pipe(child.stdin);
    else if (opts.stdinText != null) child.stdin.end(opts.stdinText);
    else child.stdin.end();
  });
}

class Tools {
  constructor(cfg, paths) {
    this.cfg = cfg;
    this.P = paths;
    this.cnf = path.join(paths.runtime, 'connection.cnf');
    const d = cfg.database;
    writeText(this.cnf, `[client]\nuser=${d.user}\npassword=${d.password}\nhost=${d.host}\nport=${d.port}\n`);
  }

  // ---- MySQL client tools -------------------------------------------------------
  mysqlBin(name) {
    const alt = { mysql: 'mariadb', mysqldump: 'mariadb-dump', mysqladmin: 'mariadb-admin', mysqlcheck: 'mariadb-check' };
    const exe = IS_WIN ? '.exe' : '';
    if (this.cfg.database.binDir) return path.join(path.resolve(this.P.root, this.cfg.database.binDir), name + exe);
    const bundled = path.join(this.P.database, 'bin', name + exe);
    if (exists(bundled)) return bundled;
    const found = which([name, alt[name]]);
    if (found) return found;
    throw new Error(`${name} not found. ${IS_WIN ? 'Server/Database is missing.' : 'Install the MySQL/MariaDB client (e.g. apt install mariadb-client) or set database.binDir in WebLauncher/config.json.'}`);
  }

  baseArgs() { return [`--defaults-extra-file=${this.cnf}`, '--default-character-set=utf8']; }

  // Apply one .sql file like `mysql ... --database=db < file`. Errors are logged and
  // the caller carries on, which is what the batch launcher does.
  async sqlFile(ctx, file, db) {
    if (!exists(file)) { ctx && ctx.log(`Skipped missing ${path.basename(file)}`, 'warn'); return false; }
    const args = this.baseArgs();
    if (db) args.push(`--database=${db}`);
    const r = await run(this.mysqlBin('mysql'), args, { stdinFile: file });
    if (r.code !== 0) {
      // mysql echoes the failing statement before the ERROR line; show the error itself
      const lines = r.stderr.split(/\r?\n/).filter(l => l && !/Using a password/i.test(l) && !/^-+$/.test(l));
      const errors = lines.filter(l => /^ERROR/.test(l));
      const msg = (errors.length ? errors : lines).slice(0, 3).map(l => l.slice(0, 300)).join(' | ');
      if (ctx) ctx.log(`${path.basename(file)}: ${msg || 'mysql exited with code ' + r.code}`, 'warn');
      return false;
    }
    return true;
  }

  async sqlDir(ctx, dir, db, { exclude = [] } = {}) {
    for (const f of listFiles(dir, ['.sql'])) {
      if (exclude.includes(path.basename(f).toLowerCase())) continue;
      ctx.log(`  ${path.basename(f)}`);
      await this.sqlFile(ctx, f, db);
    }
  }

  // Run SQL and return { columns, rows }. Throws on error.
  async query(sql, db) {
    const args = [...this.baseArgs(), '-B', '-e', sql];
    if (db) args.push(`--database=${db}`);
    const r = await run(this.mysqlBin('mysql'), args);
    if (r.code !== 0) throw new Error(r.stderr.split(/\r?\n/).filter(l => l && !/Using a password/i.test(l)).join(' ') || 'query failed');
    const lines = r.stdout.split(/\r?\n/).filter(Boolean);
    if (!lines.length) return { columns: [], rows: [] };
    return { columns: lines[0].split('\t'), rows: lines.slice(1).map(l => l.split('\t')) };
  }

  async dump(db, outFile) {
    const r = await run(this.mysqlBin('mysqldump'), [...this.baseArgs(), db], { stdoutFile: outFile });
    if (r.code !== 0) throw new Error(`mysqldump ${db} failed: ${r.stderr.trim()}`);
  }

  async check(ctx) {
    const r = await run(this.mysqlBin('mysqlcheck'), [...this.baseArgs(), '--auto-repair', '--check', '--all-databases'],
      { onLine: l => { if (!/\sOK$/.test(l)) ctx.log(l); } });
    return r.code === 0;
  }

  async adminShutdown() {
    return run(this.mysqlBin('mysqladmin'), [`--defaults-extra-file=${this.cnf}`, 'shutdown']);
  }

  // ---- 7-Zip ----------------------------------------------------------------------
  sevenZip() {
    if (this.cfg.sevenZip) return path.resolve(this.P.root, this.cfg.sevenZip);
    if (IS_WIN) return path.join(this.P.tools, '7za.exe');
    const found = which(['7zz', '7z', '7za']);
    if (!found) throw new Error('7-Zip not found. Install p7zip (e.g. apt install p7zip-full) or set "sevenZip" in WebLauncher/config.json.');
    return found;
  }

  // Extract with full paths into outDir (equivalent of `cd outDir && 7za e -y -spf archive`).
  async extract(ctx, archive, outDir, label) {
    if (!exists(archive)) throw new Error(`Archive not found: ${archive}`);
    mkdirp(outDir);
    let last = -1;
    const r = await run(this.sevenZip(), ['x', '-y', '-bsp1', '-bso0', `-o${outDir}`, archive], {
      // 7-Zip redraws its percentage with backspaces, so look at raw chunks
      onData: (t) => {
        const all = [...t.matchAll(/(\d+)%/g)];
        const pct = all.length ? +all[all.length - 1][1] : null;
        if (pct !== null && ctx && pct !== last) { last = pct; ctx.progress(pct, `Extracting ${label || path.basename(archive)}`); }
      },
    });
    if (ctx) ctx.progress(null);
    if (r.code !== 0) throw new Error(`Extracting ${path.basename(archive)} failed: ${(r.stderr || r.stdout).trim().split(/\r?\n/).slice(-3).join(' ')}`);
  }

  async compress(archive, folderName, cwd) {
    const r = await run(this.sevenZip(), ['a', '-t7z', '-mx=3', '-bso0', '-bsp0', archive, folderName], { cwd });
    if (r.code !== 0) throw new Error(`Creating ${path.basename(archive)} failed: ${r.stderr.trim()}`);
  }

  // ---- Downloads ------------------------------------------------------------------
  // Download to dest, resuming a previous partial download (dest.part) like `wget -c`.
  download(ctx, url, dest, label) {
    mkdirp(path.dirname(dest));
    const part = dest + '.part';
    return new Promise((resolve, reject) => {
      const get = (u, hops) => {
        if (hops > 10) { reject(new Error('Too many redirects')); return; }
        const have = exists(part) ? fs.statSync(part).size : 0;
        const lib = u.startsWith('https:') ? https : http;
        const req = lib.get(u, { headers: { 'User-Agent': 'SPP-WebLauncher', ...(have ? { Range: `bytes=${have}-` } : {}) } }, (res) => {
          if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
            res.resume();
            get(new URL(res.headers.location, u).toString(), hops + 1);
            return;
          }
          if (res.statusCode === 416) { // partial file is already complete
            res.resume();
            fs.renameSync(part, dest);
            resolve(dest);
            return;
          }
          if (res.statusCode !== 200 && res.statusCode !== 206) {
            res.resume();
            reject(httpError(502, `Download failed (${res.statusCode}) ${u}`));
            return;
          }
          const append = res.statusCode === 206;
          const offset = append ? have : 0;
          const total = offset + (+res.headers['content-length'] || 0);
          let got = offset;
          let lastTick = 0;
          const out = fs.createWriteStream(part, { flags: append ? 'a' : 'w' });
          res.on('data', (chunk) => {
            got += chunk.length;
            const now = Date.now();
            if (ctx && now - lastTick > 500) {
              lastTick = now;
              const mb = (got / 1048576).toFixed(1);
              ctx.progress(total ? Math.floor(got * 100 / total) : null,
                `Downloading ${label || path.basename(dest)} - ${mb}${total ? ' / ' + (total / 1048576).toFixed(1) : ''} MB`);
            }
          });
          res.pipe(out);
          res.on('error', reject);
          out.on('error', reject);
          out.on('finish', () => {
            if (ctx) ctx.progress(null);
            if (total && got < total) { reject(new Error('Download interrupted, run it again to resume')); return; }
            fs.renameSync(part, dest);
            resolve(dest);
          });
        });
        req.setTimeout(60000, () => req.destroy(new Error('Download timed out, run it again to resume')));
        req.on('error', reject);
      };
      get(url, 0);
    });
  }
}

module.exports = { Tools, run };
