'use strict';
// Server maintenance: graceful restart, or shutdown + update + start.
const path = require('path');
const { IS_WIN, exists, isDir, which } = require('../util');
const { run } = require('../tools');
const install = require('./install');
const manage = require('./manage');
const saves = require('./saves');

function findGit(L) {
  // Server_Update.bat keeps a portable Git next to the SPP_Server folder
  const portable = path.join(L.P.root, '..', 'Git', 'cmd', IS_WIN ? 'git.exe' : 'git');
  if (exists(portable)) return portable;
  return which('git');
}

function gitAvailable(L) {
  return isDir(path.join(L.P.root, '.git')) && !!findGit(L);
}

// Same as Server_Update.bat: fetch the latest repack files.
async function gitPull(L, ctx) {
  if (!isDir(path.join(L.P.root, '.git'))) { ctx.log('The repack folder is not a git checkout, skipping repack files update.', 'warn'); return false; }
  const git = findGit(L);
  if (!git) { ctx.log('Git was not found, skipping repack files update.', 'warn'); return false; }
  ctx.log('Downloading the latest repack files (git pull)...');
  const r = await run(git, ['-C', L.P.root, 'pull', '--ff-only'], { onLine: l => ctx.log(`  ${l}`) });
  if (r.code !== 0) {
    ctx.log('git pull failed (local changes or no network). Continuing with the current files.', 'warn');
    return false;
  }
  if (/WebLauncher[\\/]/.test(r.stdout)) ctx.log('The web launcher itself was updated. Restart the launcher to use the new version.', 'warn');
  return true;
}

// opts: { action: 'restart' | 'update', warnMinutes, gitPull, updateWebsite, updateBeta }
async function runMaintenance(L, ctx, opts) {
  const update = opts.action === 'update';
  const exp = L.mangosd.running ? L.serverExp : L.state.selected;
  if (!exp) return { skipped: true, message: 'No expansion selected.' };
  const wasRunning = L.mangosd.running;
  if (!wasRunning && await L.serverRunning(exp)) {
    ctx.log('The server was started outside the web launcher, its console is not available. Skipped.', 'warn');
    return { skipped: true, message: 'Server started outside the web launcher' };
  }
  if (!wasRunning && !update) {
    ctx.log('World server is not running, nothing to restart.', 'warn');
    return { skipped: true, message: 'Server was not running' };
  }

  const delay = Math.max(0, Math.min(60, Math.round(+opts.warnMinutes || 0))) * 60;
  if (wasRunning) {
    const cmd = `server ${update ? 'shutdown' : 'restart'} ${delay}`;
    ctx.log(`Sending "${cmd}" to the world server.`, 'head');
    if (delay) ctx.log(`Players are warned in game, the server goes down in ${delay / 60} minute(s).`);
    ctx.progress(null, delay ? `Waiting ${delay / 60} minute(s) for the server to shut down` : 'Waiting for the server to shut down');
    await L.stopWorld(ctx, cmd, delay);
    ctx.progress(null);
    ctx.log('World server is down.', 'ok');
    if (L.flags.isOn('autosave')) {
      ctx.log('Autosave is enabled, saving characters...');
      try { await saves.makeAutosave(L, ctx, exp); } catch (e) { ctx.log(`Autosave failed: ${e.message}`, 'warn'); }
    }
  }

  let error = null;
  if (update) {
    try {
      ctx.log('Checking for updates', 'head');
      L.realmd.kill(); // binaries may be replaced
      await L.realmd.waitExit(10000);
      await L.hermes.stop();
      if (opts.gitPull) {
        await gitPull(L, ctx);
        L.reloadVersions();
      }
      L.prepared.delete(exp);
      await install.prepareExpansion(L, ctx, exp);
      if (opts.updateWebsite && L.flags.isOn('website') && L.websiteInstalled() && L.websiteFilesVersion() < L.cfg.websiteVersion) {
        await install.updateWebsiteFiles(L, ctx);
      }
      if (opts.updateBeta && IS_WIN && L.flags.has(`${exp}_beta.on`)) await manage.betaInstall(L, ctx, exp, true);
    } catch (e) {
      error = e;
      ctx.log(`Update failed: ${e.message}`, 'error');
    }
  }

  if (wasRunning) {
    ctx.log('Starting the server again...', 'head');
    try {
      await L.resumeServer(exp, ctx);
    } catch (e) {
      ctx.log(`The server was NOT started again: ${e.message}`, 'error');
      throw new Error(`Server left stopped: ${e.message}`);
    }
    ctx.log('World server started, it is loading now.', 'ok');
  }
  if (error) throw new Error(`Update failed: ${error.message}${wasRunning ? ' (the server was started again)' : ''}`);
  return { message: update ? (wasRunning ? 'Updated and restarted' : 'Updated (server was not running)') : 'Restarted' };
}

module.exports = { runMaintenance, gitAvailable };
