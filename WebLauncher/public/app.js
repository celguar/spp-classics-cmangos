'use strict';
/* SPP Classics admin panel - client. Plain JS, no build step. */
(() => {
  const $ = (sel, el = document) => el.querySelector(sel);
  const $$ = (sel, el = document) => [...el.querySelectorAll(sel)];
  const esc = s => String(s ?? '').replace(/[&<>"']/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  const fmtDate = ms => (ms ? new Date(ms).toLocaleString() : '');
  const fmtSize = b => (b > 1048576 ? (b / 1048576).toFixed(1) + ' MB' : b > 1024 ? Math.round(b / 1024) + ' KB' : b + ' B');

  const S = {
    status: null,
    session: { required: false, authed: true },
    consoles: { mangosd: [], realmd: [], mysqld: [], httpd: [], hermes: [] },
    consoleProc: 'mangosd',
    view: null,
    jobDialog: null,
    lastJob: null,
    menuOpen: (() => { try { return JSON.parse(localStorage.getItem('spp.menu')) || {}; } catch { return {}; } })(),
  };

  // ---------------------------------------------------------------- api
  async function api(path, body) {
    const opts = { method: body === undefined ? 'GET' : 'POST', headers: {} };
    if (body !== undefined) {
      opts.headers['X-SPP'] = '1';
      opts.headers['Content-Type'] = 'application/json';
      opts.body = JSON.stringify(body);
    }
    const res = await fetch(path, opts);
    let data = {};
    try { data = await res.json(); } catch { /* empty */ }
    if (res.status === 401 && path !== '/api/login') { S.session.authed = false; render(); throw new Error('Login required'); }
    if (!res.ok) throw new Error(data.error || res.statusText);
    return data;
  }

  function toast(msg, isError) {
    const el = document.createElement('div');
    el.className = 'toast' + (isError ? ' error' : '');
    el.textContent = msg;
    $('#toasts').appendChild(el);
    setTimeout(() => el.remove(), isError ? 7000 : 4000);
  }

  // Run an action; jobs open the progress dialog, errors become toasts.
  async function act(path, body, opts = {}) {
    try {
      const r = await api(path, body || {});
      if (r.job) openJobDialog(r.job, opts.onDone);
      else if (opts.ok) toast(opts.ok);
      if (!r.job && opts.onDone) opts.onDone();
      refreshStatus();
      return r;
    } catch (e) {
      toast(e.message, true);
      return null;
    }
  }

  // ---------------------------------------------------------------- status & events
  let statusTimer = null;
  async function refreshStatus() {
    clearTimeout(statusTimer);
    try {
      S.status = await api('/api/status');
      if (S.status.job) syncJob(S.status.job);
      renderChrome();
      if (S.view && S.view.onStatus) S.view.onStatus(S.status);
    } catch (e) {
      if (S.session.authed) $('#statusbox').innerHTML = '<span><span class="dot off"></span>Launcher not reachable</span>';
    }
    statusTimer = setTimeout(refreshStatus, 5000);
  }
  let statusSoon = null;
  const scheduleStatus = () => { clearTimeout(statusSoon); statusSoon = setTimeout(refreshStatus, 250); };

  let events = null;
  function connectEvents() {
    if (events) events.close();
    events = new EventSource('/api/events');
    events.addEventListener('console', (e) => { const d = JSON.parse(e.data); pushConsole(d.proc, d.line); });
    events.addEventListener('changed', scheduleStatus);
    events.addEventListener('job', e => syncJob(JSON.parse(e.data)));
    events.addEventListener('joblog', e => onJobLog(JSON.parse(e.data)));
    events.addEventListener('progress', e => onJobProgress(JSON.parse(e.data)));
    events.addEventListener('open', () => { reloadConsole(S.consoleProc); scheduleStatus(); });
  }

  // ---------------------------------------------------------------- music
  const music = { el: new Audio(), pending: null, played: new Set() };
  music.el.volume = 0.45;
  function playSound(name, once) {
    if (!S.status || !S.status.flags.music) return;
    if (once && music.played.has(name)) return;
    music.played.add(name);
    music.el.src = `/music/${name}.mp3`;
    music.el.play().catch(() => { music.pending = name; });
  }
  document.addEventListener('pointerdown', () => {
    if (music.pending) { const n = music.pending; music.pending = null; music.el.src = `/music/${n}.mp3`; music.el.play().catch(() => {}); }
  });

  // ---------------------------------------------------------------- chrome (theme, menu, status box)
  const expOf = () => (S.status && S.status.selected) || 'vanilla';
  const expInfo = id => S.status && S.status.expansions.find(e => e.id === id);

  function renderChrome() {
    const st = S.status;
    if (!st) return;
    const exp = expOf();
    document.body.className = `exp-${exp}`;
    $('#favicon').href = `theme/${exp}/favicon.ico`;
    $('#footer-version').textContent = `SPP Classics v${st.repackVersion}`;
    document.title = st.server ? `${st.server.realmName} - SPP Classics Admin` : 'SPP Classics Admin';
    renderMenu();
    renderStatusBox();
  }

  function menuGroups() {
    const st = S.status;
    const groups = [];
    if (st && st.selected) {
      groups.push({ id: 'realm', title: 'Realm', icon: 'news', items: [['', 'Overview'], ['accounts', 'Accounts'], ['maintenance', 'Maintenance']] });
      groups.push({ id: 'config', title: 'Settings', icon: 'gameguide', items: [['settings', 'Server Settings'], ['logs', 'Logs & Crashes']] });
      groups.push({ id: 'chars', title: 'Characters', icon: 'account', items: [['saves', 'Saves'], ['bots', 'Random Bots']] });
      groups.push({ id: 'db', title: 'Database', icon: 'interactive', items: [['database', 'Wipe & Modify DB'], ['locales', 'Translations'], ['beta', 'Beta Build']] });
    }
    groups.push({ id: 'launcher', title: 'Launcher', icon: 'support', items: [['realms', 'Choose Expansion'], ['admin', 'Launcher Settings'], ['service', 'Service'], ['changelog', 'Changelog']] });
    return groups;
  }

  function renderMenu() {
    const exp = expOf();
    const route = currentRoute();
    $('#menu').innerHTML = menuGroups().map((g) => {
      const open = S.menuOpen[g.id] !== false;
      return `<div class="menu-group${open ? ' open' : ''}" data-group="${g.id}">
        <button class="menu-button" data-toggle-group="${g.id}" aria-expanded="${open}">
          <span class="menu-icon" style="background-image:url('theme/${exp}/icon-${g.icon}-${open ? 'on' : 'off'}.gif')"></span>${esc(g.title)}<span class="menu-toggle"></span>
        </button>
        <div class="menu-items"><div class="top"></div><div class="mid">
          ${g.items.map(([r, label]) => `<a class="menufiller${r === route ? ' active' : ''}" href="#/${r}">${esc(label)}</a>`).join('')}
        </div><div class="bot"></div></div>
      </div>`;
    }).join('');
  }

  $('#menu').addEventListener('click', (e) => {
    const b = e.target.closest('[data-toggle-group]');
    if (!b) return;
    const id = b.dataset.toggleGroup;
    S.menuOpen[id] = S.menuOpen[id] === false;
    try { localStorage.setItem('spp.menu', JSON.stringify(S.menuOpen)); } catch { /* private mode */ }
    renderMenu();
  });

  function stateDot(running, online) {
    if (!running) return '<span class="dot off"></span>';
    return `<span class="dot ${online === false ? 'mid' : 'on'}"></span>`;
  }

  function renderStatusBox() {
    const st = S.status;
    const parts = [];
    if (st.server) {
      const w = st.server.world;
      parts.push(`<span class="realm">${esc(st.server.realmName)}</span>`);
      parts.push(`<span>${stateDot(w.running, w.online || w.external)}World ${w.running ? (w.online || w.external ? 'online' : 'loading') : 'offline'}</span>`);
      parts.push(`<span>${stateDot(st.server.realm.running)}Realm</span>`);
    } else {
      parts.push('<span class="realm">Choose an expansion</span>');
    }
    parts.push(`<span>${stateDot(st.database.up)}DB</span>`);
    if (st.flags.website) parts.push(`<span>${stateDot(st.website.running || !st.website.managed)}Web</span>`);
    parts.push(`<button class="link" data-music>Music: ${st.flags.music ? 'On' : 'Off'}</button>`);
    const j = S.lastJob;
    if (j && j.status === 'running') parts.push(`<span class="jobchip" data-showjob><span class="spin"></span>${esc(j.title)}...</span>`);
    if (S.session.isDefault) parts.push('<a href="#/admin" style="color:#ff8a7a">Change the default password!</a>');
    parts.push(`<button class="link" data-logout title="Logged in as ${esc(S.session.username || '')}">Logout</button>`);
    $('#statusbox').innerHTML = parts.join('<span class="sep"></span>');
  }

  $('#statusbox').addEventListener('click', async (e) => {
    if (e.target.closest('[data-showjob]') && S.lastJob) openJobDialog(S.lastJob.id);
    if (e.target.closest('[data-music]')) {
      const on = !S.status.flags.music;
      await act('/api/toggle', { name: 'music', value: on });
      if (!on) music.el.pause();
      else { S.status.flags.music = true; playSound(S.status.selected ? `${S.status.selected}_intro_long` : 'launcher_intro'); }
    }
    if (e.target.closest('[data-logout]')) { await api('/api/logout', {}).catch(() => {}); location.reload(); }
  });

  // ---------------------------------------------------------------- dialogs
  function dialog({ title, body, foot, wide, onClose }) {
    const root = $('#modal-root');
    const ov = document.createElement('div');
    ov.className = 'overlay';
    ov.innerHTML = `<div class="dialog${wide ? ' wide' : ''}" role="dialog" aria-modal="true" aria-label="${esc(title)}">
      <div class="banner"><span class="grow">${esc(title)}</span><button class="close-x" data-close aria-label="Close">&times;</button></div>
      <div class="body">${body || ''}</div>
      <div class="foot">${foot || ''}</div></div>`;
    const close = () => { ov.remove(); document.removeEventListener('keydown', onKey); if (onClose) onClose(); };
    const onKey = (e) => { if (e.key === 'Escape') close(); };
    ov.addEventListener('click', (e) => { if (e.target.closest('[data-close]')) close(); });
    document.addEventListener('keydown', onKey);
    root.appendChild(ov);
    return { el: ov, close };
  }

  function confirmDialog({ title, warning, text, ok = 'Yes, continue', danger = true, input }) {
    return new Promise((resolve) => {
      let done = false;
      const d = dialog({
        title,
        body: `${warning ? `<div class="warnbox"><h4>WARNING</h4>${warning.map(l => `<div>${esc(l)}</div>`).join('')}</div>` : ''}
          ${text ? `<p>${esc(text)}</p>` : ''}
          ${input ? `<label class="field" style="width:100%">${esc(input.label)}<input type="text" data-input maxlength="${input.max || 64}" value="${esc(input.value || '')}"></label>` : ''}`,
        foot: `<button class="btn" data-close>Cancel</button><button class="btn${danger ? ' danger' : ''}" data-ok>${esc(ok)}</button>`,
        onClose: () => { if (!done) resolve(null); },
      });
      const inp = $('[data-input]', d.el);
      if (inp) { inp.focus(); inp.select(); inp.addEventListener('keydown', (e) => { if (e.key === 'Enter') $('[data-ok]', d.el).click(); }); }
      else $('[data-ok]', d.el).focus();
      $('[data-ok]', d.el).addEventListener('click', () => { done = true; resolve(inp ? inp.value : true); d.close(); });
    });
  }

  // ---------------------------------------------------------------- jobs
  function syncJob(job) {
    const prev = S.lastJob;
    S.lastJob = job;
    if (S.jobDialog && S.jobDialog.id === job.id) renderJobDialog();
    if (prev && prev.id === job.id && prev.status === 'running' && job.status !== 'running') onJobFinished(job);
    else if ((!prev || prev.id !== job.id) && job.status === 'running') {
      if (/^Preparing/.test(job.title)) playSound(`${expFromTitle(job.title) || expOf()}_intro_process`);
      if (!S.jobDialog) openJobDialog(job.id);
    }
    renderStatusBox && S.status && renderStatusBox();
  }
  function expFromTitle(t) {
    const e = S.status && S.status.expansions.find(x => t.includes(x.label));
    return e && e.id;
  }
  function onJobLog(entry) {
    if (!S.lastJob || S.lastJob.id !== entry.id) return;
    S.lastJob.log.push(entry);
    if (S.jobDialog && S.jobDialog.id === entry.id) appendJobLog(entry);
  }
  function onJobProgress({ id, progress }) {
    if (!S.lastJob || S.lastJob.id !== id) return;
    S.lastJob.progress = progress;
    if (S.jobDialog && S.jobDialog.id === id) renderJobProgress();
  }
  function onJobFinished(job) {
    if (job.status === 'done' && /^Preparing/.test(job.title)) playSound(`${expOf()}_intro_ready`);
    const cb = S.jobDialog && S.jobDialog.id === job.id && S.jobDialog.onDone;
    if (cb) cb(job);
    refreshStatus();
    if (S.view && S.view.reload) S.view.reload();
  }

  function openJobDialog(id, onDone) {
    if (S.jobDialog) S.jobDialog.d.close();
    const d = dialog({
      title: 'Working...',
      body: `<div class="progress-text" data-ptext></div><div class="progress indet" data-pbar><i style="width:0"></i></div>
             <div class="joblog" data-log></div>`,
      foot: '<span class="muted small" data-hint style="margin-right:auto">You can close this window, the task keeps running.</span><button class="btn" data-close>Close</button>',
      onClose: () => { S.jobDialog = null; },
    });
    S.jobDialog = { id, d, onDone };
    if (S.lastJob && S.lastJob.id === id) {
      renderJobDialog(true);
      // finished before the API call returned
      if (S.lastJob.status !== 'running' && onDone) onDone(S.lastJob);
    }
    else api('/api/status').then(st => { if (st.job && st.job.id === id) { S.lastJob = st.job; renderJobDialog(true); } }).catch(() => {});
  }

  function renderJobDialog(full) {
    const jd = S.jobDialog;
    const job = S.lastJob;
    if (!jd || !job || job.id !== jd.id) return;
    const el = jd.d.el;
    $('.banner .grow', el).textContent = job.status === 'running' ? `${job.title}...` : job.status === 'done' ? `${job.title} - complete` : `${job.title} - failed`;
    if (full) { $('[data-log]', el).innerHTML = ''; job.log.forEach(appendJobLog); }
    renderJobProgress();
    $('[data-hint]', el).style.visibility = job.status === 'running' ? 'visible' : 'hidden';
  }
  function renderJobProgress() {
    const jd = S.jobDialog;
    const job = S.lastJob;
    if (!jd || !job) return;
    const el = jd.d.el;
    const bar = $('[data-pbar]', el);
    const p = job.progress;
    if (job.status !== 'running') {
      bar.classList.remove('indet');
      bar.firstElementChild.style.width = '100%';
      bar.style.opacity = job.status === 'done' ? 1 : .4;
      $('[data-ptext]', el).textContent = job.status === 'done' ? 'Finished.' : `Failed: ${job.error || ''}`;
      return;
    }
    bar.classList.toggle('indet', !p || p.pct == null);
    bar.firstElementChild.style.width = p && p.pct != null ? `${p.pct}%` : '0';
    $('[data-ptext]', el).textContent = p ? `${p.text}${p.pct != null ? ` (${p.pct}%)` : ''}` : 'Please wait...';
  }
  function appendJobLog(entry) {
    const box = S.jobDialog && $('[data-log]', S.jobDialog.d.el);
    if (!box) return;
    const near = box.scrollTop + box.clientHeight >= box.scrollHeight - 30;
    const div = document.createElement('div');
    div.className = entry.level;
    div.textContent = entry.text;
    box.appendChild(div);
    if (near) box.scrollTop = box.scrollHeight;
  }

  // ---------------------------------------------------------------- console
  async function reloadConsole(proc) {
    try {
      const r = await api(`/api/console?proc=${proc}`);
      S.consoles[proc] = r.lines;
      if (S.consoleProc === proc) renderConsole();
    } catch { /* not authed yet */ }
  }
  function lineClass(l) {
    if (l.startsWith('> ')) return 'l-cmd';
    if (/^\[(launcher|autosave)\]/.test(l)) return 'l-launcher';
    if (/\b(error|failed|crash)/i.test(l)) return 'l-err';
    return '';
  }
  function lineNode(l) {
    const d = document.createElement('div');
    const c = lineClass(l);
    if (c) d.className = c;
    d.textContent = l;
    return d;
  }
  function renderConsole() {
    const box = $('#console');
    if (!box) return;
    const frag = document.createDocumentFragment();
    S.consoles[S.consoleProc].forEach(l => frag.appendChild(lineNode(l)));
    box.replaceChildren(frag);
    box.scrollTop = box.scrollHeight;
  }
  function pushConsole(proc, line) {
    const buf = S.consoles[proc] || (S.consoles[proc] = []);
    buf.push(line);
    if (buf.length > 3000) buf.splice(0, buf.length - 3000);
    const box = $('#console');
    if (box && proc === S.consoleProc) {
      const near = box.scrollTop + box.clientHeight >= box.scrollHeight - 40;
      box.appendChild(lineNode(line));
      while (box.childElementCount > 3000) box.firstElementChild.remove();
      if (near) box.scrollTop = box.scrollHeight;
    }
  }
  function consoleHtml() {
    const tabs = [['mangosd', 'World server'], ['realmd', 'Realm server'], ['hermes', 'HermesProxy'], ['mysqld', 'Database'], ['httpd', 'Website']];
    return `<div class="console-tabs">${tabs.map(([p, l]) => `<button data-proc="${p}" class="${p === S.consoleProc ? 'on' : ''}">${l}</button>`).join('')}</div>
      <div class="console" id="console" tabindex="0" aria-label="Server console output"></div>
      <form class="console-input" id="console-form" autocomplete="off"><span>mangos&gt;</span>
        <input type="text" id="console-cmd" placeholder="Type a server command, e.g. account create NAME PASS, saveall, server info" aria-label="Console command"></form>`;
  }
  const history = [];
  let histPos = 0;
  function mountConsole(root) {
    renderConsole();
    reloadConsole(S.consoleProc);
    root.addEventListener('click', (e) => {
      const t = e.target.closest('[data-proc]');
      if (!t) return;
      S.consoleProc = t.dataset.proc;
      $$('.console-tabs button', root).forEach(b => b.classList.toggle('on', b === t));
      renderConsole();
      reloadConsole(S.consoleProc);
    });
    const input = $('#console-cmd', root);
    input.addEventListener('keydown', (e) => {
      if (e.key === 'ArrowUp' && histPos > 0) { histPos--; input.value = history[histPos]; e.preventDefault(); }
      if (e.key === 'ArrowDown') { histPos = Math.min(history.length, histPos + 1); input.value = history[histPos] || ''; e.preventDefault(); }
    });
    $('#console-form', root).addEventListener('submit', async (e) => {
      e.preventDefault();
      const cmd = input.value.trim();
      if (!cmd) return;
      history.push(cmd);
      histPos = history.length;
      input.value = '';
      const proc = S.consoleProc === 'realmd' ? 'realmd' : 'mangosd';
      if (proc !== S.consoleProc) { S.consoleProc = proc; $$('.console-tabs button', root).forEach(b => b.classList.toggle('on', b.dataset.proc === proc)); renderConsole(); }
      try { await api('/api/console', { proc, command: cmd }); } catch (err) { toast(err.message, true); }
    });
  }

  // ---------------------------------------------------------------- file editor / viewer
  async function openFile(kind, name, db, editable) {
    let f;
    try { f = await api(`/api/file?kind=${kind}&name=${encodeURIComponent(name)}${db ? `&db=${db}` : ''}`); }
    catch (e) { toast(e.message, true); return; }
    if (f.binary) {
      location.href = `/api/download?kind=${kind}&name=${encodeURIComponent(name)}${db ? `&db=${db}` : ''}`;
      return;
    }
    const canEdit = editable && f.writable && !f.truncated;
    const d = dialog({
      title: name,
      wide: true,
      body: canEdit ? '<textarea class="editor" spellcheck="false" aria-label="File contents"></textarea>' : '<pre class="viewer"></pre>',
      foot: `<span class="muted small" style="margin-right:auto">${f.truncated ? `Showing the last 2 MB of ${fmtSize(f.size)}.` : fmtSize(f.size)}${canEdit && kind === 'config' ? ' &middot; A backup is kept as .bak. Restart the server to apply changes.' : ''}</span>
        <button class="btn" data-close>${canEdit ? 'Cancel' : 'Close'}</button>${canEdit ? '<button class="btn" data-save>Save</button>' : ''}`,
    });
    const area = $(canEdit ? 'textarea' : 'pre', d.el);
    if (canEdit) area.value = f.text; else { area.textContent = f.text; area.scrollTop = area.scrollHeight; }
    if (canEdit) {
      area.addEventListener('keydown', (e) => {
        if (e.key === 'Tab') { e.preventDefault(); const s = area.selectionStart; area.setRangeText('\t', s, area.selectionEnd, 'end'); }
        if ((e.ctrlKey || e.metaKey) && e.key === 's') { e.preventDefault(); $('[data-save]', d.el).click(); }
      });
      $('[data-save]', d.el).addEventListener('click', async () => {
        try { await api('/api/file', { kind, name, db, text: area.value }); toast(`${name} saved`); d.close(); if (S.view && S.view.reload) S.view.reload(); }
        catch (e) { toast(e.message, true); }
      });
      // start at the top: browsers leave the caret (and the scroll) at the end after setting value
      area.setSelectionRange(0, 0);
      area.focus({ preventScroll: true });
      area.scrollTop = 0;
    }
  }

  // ---------------------------------------------------------------- views
  const GM = ['Player', 'Moderator', 'Game Master', 'Administrator'];
  const SIZES = { vanilla: '~750 MB', tbc: '~1 GB', wotlk: '~1.5 GB' };

  function needExp() {
    if (!S.status || !S.status.selected) { location.hash = '#/realms'; return true; }
    return false;
  }
  function banner(title, extra = '') { return `<div class="banner"><span class="grow">${esc(title)}</span>${extra}</div>`; }
  const srv = () => S.status.server;
  const worldUp = () => srv() && srv().world.running;

  // -- expansion selection
  const viewRealms = {
    render() {
      const st = S.status;
      const running = st.expansions.find(e => e.running);
      return `${banner('Choose Expansion', `<small>Repack v${esc(st.repackVersion)}</small>`)}
        <p>Select the World of Warcraft version to run. Game data for an expansion is downloaded the first time you select it, so the first start takes a while.</p>
        <div class="realms">${st.expansions.map((e) => {
          const isSel = st.selected === e.id;
          const blocked = running && running.id !== e.id;
          const state = [
            e.installed ? '<b>Installed</b>' : `Not installed (${SIZES[e.id]} download)`,
            e.running ? '<b style="color:#7fe07f">Running</b>' : '',
            e.beta ? '<span class="badge beta">BETA</span>' : '',
          ].filter(Boolean).join(' &middot; ');
          return `<div class="realm-card" data-exp="${e.id}">
            <div class="info"><h3>${esc(e.label)}</h3>
              <div class="meta">Patch ${esc(e.patch)} &middot; ${esc(e.realmName)}</div>
              <div class="state">${state}</div>
              ${isSel && st.server && st.server.prepared
                ? '<a class="btn" href="#/">Return to realm</a>'
                : `<button class="btn" data-select="${e.id}" ${blocked ? `disabled title="Stop the ${esc(running.label)} server first"` : ''}>${e.installed ? 'Enter realm' : 'Install &amp; enter'}</button>`}
            </div></div>`;
        }).join('')}</div>
        <div class="subheader">Launcher options</div>
        <div class="row center">
          <label class="check"><input type="checkbox" data-toggle="website" ${st.flags.website ? 'checked' : ''}> Website</label>
          <span class="muted small" style="margin-right:16px">Armory, player map and account sign-up on http://${esc(location.hostname)}/</span>
          <label class="check"><input type="checkbox" data-toggle="music" ${st.flags.music ? 'checked' : ''}> Launcher music</label>
        </div>
        <div class="subheader">Shut down</div>
        <p>Stops the realm, website and database, then closes the launcher.</p>
        <button class="btn danger" data-shutdown>Shutdown Repack</button>`;
    },
    mount(root) {
      playSound('launcher_intro', true);
      root.addEventListener('click', async (e) => {
        const s = e.target.closest('[data-select]');
        if (s) act('/api/expansion/select', { exp: s.dataset.select }, { onDone: async (j) => { if (j.status === 'done') { await refreshStatus(); navigate('#/'); } } });
        if (e.target.closest('[data-shutdown]')) shutdownRepack();
      });
      root.addEventListener('change', (e) => {
        const t = e.target.closest('[data-toggle]');
        if (t) act('/api/toggle', { name: t.dataset.toggle, value: t.checked });
      });
    },
    onStatus: rerenderWhenChanged(st => [st.selected, st.expansions, st.flags.website, st.flags.music, st.server && st.server.prepared]),
  };

  // Re-render a view only when the part of the status it shows has changed.
  function rerenderWhenChanged(pick) {
    let last = null;
    return function onStatus(st) {
      const sig = JSON.stringify(pick(st));
      if (last !== null && sig !== last && !$('.overlay')) rerender();
      last = sig;
    };
  }

  async function shutdownRepack() {
    const ok = await confirmDialog({
      title: 'Shutdown Repack',
      text: 'The server will save and shut down, then the website, the database and this launcher are stopped. You will need to start the launcher again to play.',
      ok: 'Shutdown',
    });
    if (ok) act('/api/shutdown', {});
  }

  // -- realm overview
  const viewDashboard = {
    render() {
      const st = S.status;
      const s = st.server;
      const e = expInfo(s.exp);
      const v = s.versions;
      return `${banner(s.realmName, `<small>${esc(e.label)} ${esc(e.patch)}</small> <span class="badge${s.beta ? ' beta' : ''}">${s.beta ? 'BETA' : 'RELEASE'}</span>`)}
        <div class="versions">Repack <b>${esc(st.repackVersion)}</b> &middot; Core <b>${v.core}</b>${s.binary && s.binary.found && s.binary.coreVersion != null && s.binary.coreVersion !== v.core ? ` (binary <b>${s.binary.coreVersion}</b>)` : ''} &middot; DB <b>${v.world}</b> &middot; Web <b>${st.website.version || '-'}</b> &middot; Address <b>${esc(s.address)}</b></div>
        <div id="dash-live"></div>
        <div class="subheader">Players online</div>
        <div id="players"><span class="empty">Start the server to see who is online.</span></div>
        <div class="subheader">Server console</div>
        ${consoleHtml()}`;
    },
    mount(root) {
      this.renderLive();
      mountConsole(root);
      this.loadPlayers();
      this.timer = setInterval(() => this.loadPlayers(), 30000);
      root.addEventListener('click', (e) => {
        const a = e.target.closest('[data-act]');
        if (!a) return;
        const k = a.dataset.act;
        if (k === 'start') act('/api/server/start', {});
        if (k === 'stop') this.stop();
        if (k === 'restart') act('/api/server/restart', {});
        if (k === 'prepare') act('/api/expansion/select', { exp: srv().exp });
        if (k === 'accept-binary') this.acceptBinary();
        if (k === 'website-update') act('/api/website/update', {});
        if (k === 'autosave') act('/api/saves/autosave', {});
        if (k === 'leave') this.leave();
      });
      root.addEventListener('change', (e) => {
        const t = e.target.closest('[data-toggle]');
        if (t) act('/api/toggle', { name: t.dataset.toggle, value: t.checked });
      });
    },
    unmount() { clearInterval(this.timer); },
    async stop() {
      const ok = await confirmDialog({
        title: 'Stop Server',
        warning: ['Server shutdown command will be used.', 'Players are saved and logged out.'],
        text: S.status.flags.autosave ? 'An autosave is made after the server stops.' : '',
        ok: 'Stop server',
      });
      if (ok) act('/api/server/stop', {});
    },
    async acceptBinary() {
      const b = srv().binary;
      const ok = await confirmDialog({
        title: 'Start with this binary',
        warning: [`mangosd is recorded as core version ${b.coreVersion}, the databases are at ${b.required}.`, 'If the binary really is older, the server may fail or damage character data.'],
        text: 'Use this exact mangosd as up to date and start the server?',
        ok: 'Start anyway',
      });
      if (!ok) return;
      if (await act('/api/binaries/accept', {})) act('/api/server/start', {});
    },
    async leave() {
      const ok = await confirmDialog({
        title: 'Change Expansion',
        text: 'This stops the server (if running), the website and the database, and goes back to expansion selection.',
        ok: 'Continue', danger: false,
      });
      if (ok) act('/api/expansion/leave', {}, { onDone: () => { location.hash = '#/realms'; } });
    },
    async loadPlayers() {
      const box = $('#players');
      if (!box || !worldUp()) return;
      try {
        const r = await api('/api/accounts');
        if (!r.online) return;
        const p = r.online.players;
        box.innerHTML = `<p><b>${p.length}</b> player${p.length === 1 ? '' : 's'} and <b>${r.online.bots}</b> random bots online.</p>
          ${p.length ? `<table class="list"><tr><th>Name</th><th>Level</th></tr>${p.map(x => `<tr><td>${esc(x.name)}</td><td>${x.level}</td></tr>`).join('')}</table>` : ''}`;
      } catch { /* db busy */ }
    },
    renderLive() {
      const box = $('#dash-live');
      if (!box) return;
      const st = S.status;
      const s = st.server;
      const w = s.world;
      const busy = st.job && st.job.status === 'running';
      const notes = [];
      if (!s.binariesFound) {
        notes.push(`<div class="notice warning"><strong>Server binaries not found.</strong> Expected <code>mangosd</code> and <code>realmd</code> in <code>${esc(s.binDir)}</code>.
          ${st.isWindows ? 'Select the expansion again to extract them.' : 'Linux binaries come from <code>Linux64/Linux64.7z</code> (built by the "Linux Binaries" GitHub workflow) or from your own CMaNGOS build (set <code>binaries</code> in WebLauncher/config.json).'}</div>`);
      }
      const bin = s.binary;
      if (bin && bin.found && !bin.ok && !w.running) {
        notes.push(`<div class="notice warning"><strong>Server binary is older than the databases.</strong>
          mangosd is for core version <b>${bin.coreVersion}</b>, the repack is at <b>${bin.required}</b>. Starting it could damage the databases, so Start is blocked.
          ${s.binaryHint ? '' : st.isWindows ? 'Choose the expansion again to extract the new binaries.' : 'Get new Linux binaries (update the repack, or rebuild CMaNGOS and replace mangosd/realmd).'}
          <div style="margin-top:6px"><button class="btn danger" data-act="accept-binary" ${busy ? 'disabled' : ''}>Start anyway</button>
          <span class="small muted">only if you know this binary matches the current databases</span></div></div>`);
      }
      if (!s.prepared && !w.running) notes.push('<div class="notice">Databases have not been checked since the launcher started. <button class="link" data-act="prepare">Check for updates now</button> (also done automatically on start).</div>');
      if (w.external) notes.push('<div class="notice">This server was started outside the web launcher (for example by Launcher.bat). Its console is not available here, but you can stop it.</div>');
      if (st.flags.website && !st.website.installed) {
        notes.push(`<div class="notice"><strong>Website not installed.</strong> ${st.website.managed ? 'It runs on this machine with the bundled Apache.' : 'Files go to Server/website; host them with your own web server and PHP.'}
          <button class="btn" data-act="website-update" ${busy ? 'disabled' : ''}>Download website (~170 MB)</button></div>`);
      } else if (st.flags.website && st.website.version < st.website.target) {
        notes.push(`<div class="notice">Website update available (${st.website.version} &rarr; ${st.website.target}). <button class="btn" data-act="website-update" ${busy ? 'disabled' : ''}>Update website (~170 MB)</button></div>`);
      }
      const tile = (k, on, mid, label, sub) => `<div class="tile"><div class="k">${k}</div><div class="v"><span class="dot ${on ? (mid ? 'mid' : 'on') : 'off'}"></span>${label}</div><div class="s">${sub || '&nbsp;'}</div></div>`;
      const uptime = w.since ? `up since ${new Date(w.since).toLocaleTimeString()}` : '';
      const site = st.website.url || `http://${location.hostname}/`;
      box.innerHTML = `${notes.join('')}
        <div class="tiles">
          ${tile('World server', w.running, w.running && !w.online && !w.external, w.running ? (w.online || w.external ? 'Online' : 'Loading...') : 'Offline', w.pid ? `pid ${w.pid} ${uptime}` : '')}
          ${tile('Realm server', s.realm.running, false, s.realm.running ? 'Online' : 'Offline', 'Login on port 3724')}
          ${s.hermes && s.hermes.enabled ? tile('HermesProxy', s.hermes.running, false, s.hermes.running ? 'Online' : 'Offline', 'Modern clients, portal port 1119') : ''}
          ${tile('Database', st.database.up, false, st.database.up ? 'Online' : 'Offline', `${esc(st.database.host)}:${st.database.port}`)}
          ${tile('Website', st.flags.website && (st.website.running || (!st.website.managed && st.website.installed)), false,
            !st.flags.website ? 'Disabled' : st.website.running ? 'Online' : st.website.managed ? 'Offline' : st.website.installed ? 'External' : 'Not installed', st.flags.website ? `<a href="${esc(site)}" target="_blank" rel="noopener">${esc(site)}</a>` : '')}
        </div>
        <div class="row center">
          ${w.running
            ? `<button class="btn big danger" data-act="stop" ${busy ? 'disabled' : ''}>Stop Server</button>
               <button class="btn" data-act="restart" ${busy || w.external ? 'disabled' : ''}>Restart</button>`
            : `<button class="btn big" data-act="start" ${busy || !s.binariesFound || (s.binary && !s.binary.ok) ? 'disabled' : ''}>Start Server</button>`}
          <button class="btn" data-act="autosave" ${busy ? 'disabled' : ''}>Save now</button>
          <label class="check" title="Automatically start the world server and HermesProxy again if they crash"><input type="checkbox" data-toggle="autoRestart" ${st.flags.autoRestart ? 'checked' : ''}> Restarter mode</label>
          <span class="spacer"></span>
          <button class="btn" data-act="leave" ${busy ? 'disabled' : ''}>Change expansion</button>
        </div>
        ${st.maintenance && st.maintenance.next ? `<p class="small" style="margin:8px 0 0">Next scheduled maintenance: <b>${fmtDate(st.maintenance.next.at)}</b> (${st.maintenance.next.action === 'update' ? 'update &amp; restart' : 'restart'}) &middot; <a href="#/maintenance">Maintenance</a></p>` : ''}
        <p class="small muted" style="margin-top:8px">To play, put <code>set realmlist ${esc(s.address)}</code> in your client's realmlist.wtf. Create an account on the <a href="#/accounts">Accounts</a> page${st.flags.website ? ' or on the website' : ''}.</p>`;
    },
    onStatus() { this.renderLive(); },
  };

  // -- accounts
  const viewAccounts = {
    render() {
      return `${banner('Accounts')}
        <div id="acc-note"></div>
        <div class="subheader">Create account</div>
        <form class="row" id="acc-form" autocomplete="off">
          <label class="field">Account name<input type="text" name="username" maxlength="16" required pattern="[A-Za-z0-9]{3,16}"></label>
          <label class="field">Password<input type="password" name="password" maxlength="16" required autocomplete="new-password"></label>
          <label class="field">Account type<select name="gmlevel">${GM.map((g, i) => `<option value="${i}">${g}${i ? ` (GM ${i})` : ''}</option>`).join('')}</select></label>
          <button class="btn" type="submit" style="margin-bottom:9px">Create account</button>
        </form>
        <p class="small muted">Commands are sent to the server console: <code>account create NAME PASSWORD</code> and <code>account set gmlevel NAME 3</code>. The result shows in the console on the Overview page.</p>
        <div class="subheader">Accounts</div>
        <div id="acc-list"><span class="empty">Loading...</span></div>
        <div class="subheader">Connecting to the realm</div>
        <p>Edit <code>realmlist.wtf</code> in your WoW folder: <code>set realmlist ${esc(srv().address)}</code>. To play with other people, change the server address in <a href="#/settings">Server Settings</a>.</p>`;
    },
    mount(root) {
      this.renderNote();
      this.reload();
      $('#acc-form', root).addEventListener('submit', async (e) => {
        e.preventDefault();
        const f = new FormData(e.target);
        const body = Object.fromEntries(f.entries());
        if (await act('/api/accounts/create', body, { ok: `Creating account ${body.username}... check the console for the result` })) {
          e.target.reset();
          setTimeout(() => this.reload(), 2500);
        }
      });
      root.addEventListener('change', async (e) => {
        const sel = e.target.closest('[data-gm]');
        if (sel) await act('/api/accounts/gmlevel', { username: sel.dataset.gm, gmlevel: sel.value }, { ok: `GM level of ${sel.dataset.gm} set to ${sel.value}` });
      });
    },
    renderNote() {
      const n = $('#acc-note');
      if (n) n.innerHTML = worldUp() && !srv().world.external ? '' : '<div class="notice">Start the server from the web launcher (and wait until it is online) to create accounts or change GM levels.</div>';
    },
    async reload() {
      const box = $('#acc-list');
      if (!box) return;
      try {
        const r = await api('/api/accounts');
        const a = r.accounts;
        if (a.error) { box.innerHTML = `<span class="empty">${esc(a.error)}</span>`; return; }
        if (!a.rows.length) { box.innerHTML = '<span class="empty">No accounts yet (random bot accounts are hidden).</span>'; return; }
        const gi = a.columns.findIndex(c => c.toLowerCase() === 'gmlevel');
        const ui = a.columns.findIndex(c => c.toLowerCase() === 'username');
        box.innerHTML = `<div class="scroll-x"><table class="list"><tr>${a.columns.map(c => `<th>${esc(c)}</th>`).join('')}</tr>
          ${a.rows.map(row => `<tr>${row.map((v, i) => (i === gi && ui >= 0
            ? `<td><select data-gm="${esc(row[ui])}" aria-label="GM level">${GM.map((g, l) => `<option value="${l}" ${+v === l ? 'selected' : ''}>${l} - ${g}</option>`).join('')}</select></td>`
            : `<td>${esc(v === 'NULL' ? '' : v)}</td>`)).join('')}</tr>`).join('')}</table></div>`;
      } catch (e) { box.innerHTML = `<span class="empty">${esc(e.message)}</span>`; }
    },
    onStatus() { this.renderNote(); },
  };

  // -- settings
  const CONF_NAMES = {
    'mangosd.conf': 'World settings (rates, gameplay)', 'aiplayerbot.conf': 'Bots settings', 'ahbot.conf': 'Auction House Bot',
    'realmd.conf': 'Realm (login) server', 'immersive.conf': 'Immersive', 'hardcore.conf': 'Hardcore', 'transmog.conf': 'Transmog',
    'achievements.conf': 'Achievements', 'dualspec.conf': 'Dual spec', 'barber.conf': 'Barber', 'boost.conf': 'Character boost', 'trainingdummies.conf': 'Training dummies',
  };
  const viewSettings = {
    render() {
      const s = srv();
      const d = S.status.database;
      return `${banner('Server Settings')}
        <div class="subheader">Realm</div>
        <form class="row" id="realm-form">
          <label class="field">Realm name<input type="text" name="name" maxlength="32" value="${esc(s.realmName)}" required></label>
          <label class="field">Server address<input type="text" name="address" maxlength="32" value="${esc(s.address)}" required></label>
          <button class="btn" type="submit" style="margin-bottom:9px">Save</button>
        </form>
        <p class="small muted">Keep 127.0.0.1 to play alone. To play with other people enter this machine's LAN or public IP address; they put it in their realmlist.wtf.</p>
        <div class="subheader">Configuration files</div>
        <div id="conf-list"><span class="empty">Loading...</span></div>
        <p class="small muted">Edit carefully! Restart the server for changes to take effect. If you change the number of random bots, use Random Bots &rarr; Reset afterwards.</p>
        <div class="subheader">HermesProxy (modern Classic clients)</div>
        <div id="hermes"><span class="empty">Loading...</span></div>
        <div class="subheader">MySQL database</div>
        <table class="list" style="max-width:420px"><tr><td>Host</td><td><b>${esc(d.host)}</b> &nbsp; Port <b>${d.port}</b></td></tr>
          <tr><td>User</td><td><b>${esc(d.user)}</b> &nbsp; Password <b>${esc(d.password)}</b></td></tr>
          <tr><td>Managed</td><td>${d.managed ? 'Started and stopped by the launcher' : 'External server (not started by the launcher)'}</td></tr></table>
        <p class="small muted">Connection settings live in <code>WebLauncher/config.json</code>; the server's own connection strings are in mangosd.conf and realmd.conf.</p>`;
    },
    mount(root) {
      this.reload();
      $('#realm-form', root).addEventListener('submit', (e) => {
        e.preventDefault();
        act('/api/realm', Object.fromEntries(new FormData(e.target).entries()));
      });
      root.addEventListener('click', (e) => {
        const b = e.target.closest('[data-edit]');
        if (b) openFile('config', b.dataset.edit, null, true);
        if (e.target.closest('[data-hermes-conf]')) openFile('hermes', 'HermesProxy.config', null, true);
        const hs = e.target.closest('[data-hermes-run]');
        if (hs) act(`/api/hermes/${hs.dataset.hermesRun}`, {}, { onDone: () => this.reloadHermes() });
      });
      root.addEventListener('submit', async (e) => {
        if (e.target.id !== 'hermes-form') return;
        e.preventDefault();
        const f = new FormData(e.target);
        try {
          this.hermes = await api('/api/hermes', { enabled: f.has('enabled'), exe: f.get('exe'), clientBuild: f.get('clientBuild'), externalAddress: f.get('externalAddress') });
          toast('HermesProxy settings saved, HermesProxy.config updated');
          this.renderHermes();
          refreshStatus();
        } catch (err) { toast(err.message, true); }
      });
    },
    async reloadHermes() {
      try { this.hermes = await api('/api/hermes'); } catch (e) { this.hermes = { error: e.message }; }
      this.renderHermes();
    },
    renderHermes() {
      const box = $('#hermes');
      const h = this.hermes;
      if (!box || !h) return;
      if (h.error) { box.innerHTML = `<span class="empty">${esc(h.error)}</span>`; return; }
      const intro = '<p>HermesProxy lets the modern Classic game clients (1.14.x for Vanilla, 2.5.x for TBC) play on this server.</p>';
      if (!h.supported) { box.innerHTML = `${intro}<div class="notice">HermesProxy only supports the Vanilla (1.12.1) and TBC (2.4.3) servers, not WotLK.</div>`; return; }
      if (!h.executables.length) {
        box.innerHTML = `${intro}<div class="notice warning"><strong>HermesProxy was not found.</strong> Put a HermesProxy build (with its HermesProxy.config) in <code>${esc(h.dir)}</code>.
          Builds: <a href="https://github.com/WowLegacyCore/HermesProxy/releases" target="_blank" rel="noopener">HermesProxy releases</a>.</div>`;
        return;
      }
      const s = h.settings;
      const sb = h.serverBuild;
      const groups = {};
      h.builds.forEach((b) => { (groups[b.version] = groups[b.version] || []).push(b); });
      const running = srv().world.running;
      const prox = S.status && S.status.server && S.status.server.hermes;
      box.innerHTML = `${intro}
        <form id="hermes-form" autocomplete="off">
          <label class="check"><input type="checkbox" name="enabled" ${s.enabled ? 'checked' : ''}> <b>Start HermesProxy together with the server</b></label>
          <div>
            <div class="row" style="margin-top:8px">
              <label class="field">Executable<select name="exe">${h.executables.map(x => `<option value="${esc(x.path)}" ${x.path === s.exe ? 'selected' : ''}>${esc(x.name)} (${new Date(x.mtime).toLocaleDateString()})</option>`).join('')}</select></label>
              <label class="field">Game client version (ClientBuild)<select name="clientBuild">
                ${Object.entries(groups).map(([ver, list]) => `<optgroup label="${esc(ver)}">${list.map(b => `<option value="${b.build}" ${b.build === s.clientBuild ? 'selected' : ''}>${esc(b.version)}.${b.build}${b.note ? ` (${esc(b.note)})` : ''}</option>`).join('')}</optgroup>`).join('')}
              </select></label>
              <label class="field">Server version (ServerBuild)<input type="text" value="${esc(sb.version)} (${sb.build})" disabled title="Set automatically from the expansion"></label>
              <label class="field">External address<input type="text" name="externalAddress" value="${esc(s.externalAddress)}" maxlength="64" required title="Address the game clients connect to"></label>
            </div>
          </div>
          <div class="row center">
            <button class="btn" type="submit">Save</button>
            <button class="btn" type="button" data-hermes-conf>Edit HermesProxy.config</button>
            ${prox && prox.running ? '<button class="btn danger" type="button" data-hermes-run="stop">Stop proxy</button>'
              : `<button class="btn" type="button" data-hermes-run="start" ${running && s.enabled ? '' : 'disabled title="Enable it and start the server first"'}>Start proxy now</button>`}
            <span class="small">${prox && prox.running ? '<span class="dot on"></span>Running' : '<span class="dot off"></span>Not running'}</span>
          </div>
        </form>
        <p class="small muted">Saving writes ClientBuild, ServerBuild, ServerAddress, ServerPort and ExternalAddress into <code>${esc(h.configFile || '')}</code>; this is also done before every start.
          Keep <b>127.0.0.1</b> as external address to play on this computer, or use this machine's LAN/public IP for other players.</p>
        <p class="small muted"><b>Client setup:</b> in the game folder set <code>SET portal "127.0.0.1"</code> in <code>${sb.clientMajor === 1 ? '_classic_era_' : '_classic_'}/WTF/Config.wtf</code>,
          start the game with <a href="https://github.com/Arctium/WoW-Launcher/releases/tag/latest" target="_blank" rel="noopener">Arctium Launcher</a> <code>--staticseed --version=${sb.clientMajor === 1 ? 'ClassicEra' : 'Classic'}</code>
          and keep <i>Optimize Network for Speed</i> enabled in the game's network options. Log in with your normal account.</p>`;
    },
    onStatus(st) {
      const h = st.server && st.server.hermes;
      const sig = JSON.stringify([h && h.running, st.server && st.server.world.running]);
      if (this.hermesSig !== undefined && sig !== this.hermesSig && !$('.overlay')) this.renderHermes();
      this.hermesSig = sig;
    },
    async reload() {
      this.reloadHermes();
      const box = $('#conf-list');
      if (!box) return;
      try {
        const r = await api('/api/files?kind=config');
        const order = Object.keys(CONF_NAMES);
        r.files.sort((a, b) => ((order.indexOf(a.name) + 1 || 99) - (order.indexOf(b.name) + 1 || 99)) || a.name.localeCompare(b.name));
        box.innerHTML = `<table class="list"><tr><th>File</th><th>Description</th><th>Modified</th><th></th></tr>
          ${r.files.map(f => `<tr><td><b>${esc(f.name)}</b></td><td>${esc(CONF_NAMES[f.name] || '')}</td><td class="small">${fmtDate(f.mtime)}</td>
            <td class="actions"><button class="btn" data-edit="${esc(f.name)}">Edit</button></td></tr>`).join('')}</table>
          <p class="small muted">Folder: <code>${esc(r.folder)}</code></p>`;
      } catch (e) { box.innerHTML = `<span class="empty">${esc(e.message)}</span>`; }
    },
  };

  // -- logs
  const viewLogs = {
    render() {
      return `${banner('Logs & Crashes')}
        <div class="subheader">Server logs</div><div id="log-list"><span class="empty">Loading...</span></div>
        <div class="subheader">Crash logs</div><div id="crash-list"><span class="empty">Loading...</span></div>`;
    },
    mount(root) {
      this.reload();
      root.addEventListener('click', (e) => {
        const b = e.target.closest('[data-view]');
        if (b) openFile(b.dataset.kind, b.dataset.view, null, false);
      });
    },
    async reload() {
      for (const [kind, id] of [['log', '#log-list'], ['crash', '#crash-list']]) {
        const box = $(id);
        if (!box) continue;
        try {
          const r = await api(`/api/files?kind=${kind}`);
          box.innerHTML = r.files.length
            ? `<table class="list"><tr><th>File</th><th>Size</th><th>Modified</th><th></th></tr>${r.files.slice(0, 200).map(f => `<tr><td>${esc(f.name)}</td><td>${fmtSize(f.size)}</td><td class="small">${fmtDate(f.mtime)}</td>
                <td class="actions"><button class="btn" data-kind="${kind}" data-view="${esc(f.name)}">${/\.(txt|log)$/i.test(f.name) ? 'View' : 'Download'}</button></td></tr>`).join('')}</table>
               <p class="small muted">Folder: <code>${esc(r.folder)}</code></p>`
            : `<span class="empty">No ${kind === 'log' ? 'logs' : 'crash logs'} yet.</span>`;
        } catch (e) { box.innerHTML = `<span class="empty">${esc(e.message)}</span>`; }
      }
    },
  };

  // -- saves
  const viewSaves = {
    render() { return `${banner('Saves')}<div id="saves"><span class="empty">Loading...</span></div>`; },
    mount(root) {
      this.reload();
      root.addEventListener('click', e => this.click(e));
      root.addEventListener('change', (e) => {
        const t = e.target.closest('[data-toggle]');
        if (t) act('/api/toggle', { name: t.dataset.toggle, value: t.checked }, { onDone: () => this.reload() });
      });
    },
    async click(e) {
      const b = e.target.closest('[data-save],[data-load],[data-del],[data-aload],[data-adel],[data-now]');
      if (!b) return;
      const running = worldUp();
      if (b.dataset.save) {
        const slot = this.data.slots.find(s => s.id === b.dataset.save);
        const name = await confirmDialog({
          title: `Save to slot ${slot.id}`,
          warning: slot.filled ? ['This will overwrite the previous save!'] : null,
          text: 'Accounts and characters (including bots) are exported to this slot.',
          input: { label: 'Name for the save', value: slot.name || '', max: 64 },
          ok: 'Save', danger: false,
        });
        if (name !== null) act('/api/saves/save', { slot: slot.id, name });
      }
      if (b.dataset.load) {
        if (running) { toast('Please stop the server before loading a save.', true); return; }
        const slot = this.data.slots.find(s => s.id === b.dataset.load);
        const warning = ['This will overwrite your characters and accounts!'];
        if (slot.id === 'transfer') warning.push('After a transfer all random bots are deleted, except bots in someone\'s friends list or in a real player\'s guild.');
        if (await confirmDialog({ title: `Load ${slot.label}`, warning, text: `Load "${slot.name}"?`, ok: 'Load save' })) act('/api/saves/load', { slot: slot.id });
      }
      if (b.dataset.del) {
        if (await confirmDialog({ title: `Delete save ${b.dataset.del}`, text: 'Delete this save? This cannot be undone.', ok: 'Delete' })) {
          act('/api/saves/delete', { slot: b.dataset.del }, { ok: 'Save deleted', onDone: () => this.reload() });
        }
      }
      if (b.dataset.aload) {
        if (running) { toast('Please stop the server before loading a save.', true); return; }
        if (await confirmDialog({ title: 'Load autosave', warning: ['This will overwrite your characters and accounts!'], text: `Restore ${b.dataset.aload}?`, ok: 'Load autosave' })) {
          act('/api/saves/autosave/load', { file: b.dataset.aload });
        }
      }
      if (b.dataset.adel) {
        if (await confirmDialog({ title: 'Delete autosave', text: `Delete ${b.dataset.adel}?`, ok: 'Delete' })) {
          act('/api/saves/autosave/delete', { file: b.dataset.adel }, { onDone: () => this.reload() });
        }
      }
      if (b.dataset.now !== undefined) act('/api/saves/autosave', {});
    },
    async reload() {
      const box = $('#saves');
      if (!box) return;
      try {
        const d = this.data = await api('/api/saves');
        box.innerHTML = `
          <table class="list"><tr><th>Slot</th><th>Name</th><th>Saved</th><th></th></tr>
          ${d.slots.map(s => `<tr><td><b>${esc(s.label)}</b></td><td>${s.filled ? esc(s.name || '') : '<span class="empty">Empty slot</span>'}</td>
            <td class="small">${fmtDate(s.mtime)}</td><td class="actions">
            ${s.importOnly ? '' : `<button class="btn" data-save="${s.id}">Save</button>`}
            <button class="btn" data-load="${s.id}" ${s.filled ? '' : 'disabled'}>Load</button>
            ${s.importOnly ? '' : `<button class="btn danger" data-del="${s.id}" ${s.filled ? '' : 'disabled'}>Delete</button>`}</td></tr>`).join('')}</table>
          <div class="subheader">Autosave</div>
          <div class="row center" style="gap:6px 22px">
            <label class="check"><input type="checkbox" data-toggle="autosave" ${d.autosave ? 'checked' : ''}> Autosave when the server starts and stops</label>
            <label class="check"><input type="checkbox" data-toggle="autosaveRunning" ${d.autosaveRunning ? 'checked' : ''}> Autosave every ${d.intervalMin} minutes while running</label>
            <button class="btn" data-now>Autosave now</button>
          </div>
          <div class="subheader">Autosaves (${d.autosaves.length})</div>
          ${d.autosaves.length ? `<table class="list"><tr><th>Autosave</th><th>Size</th><th>Created</th><th></th></tr>
            ${d.autosaves.map(a => `<tr><td>${esc(a.name.replace(/\.7z$/, ''))}</td><td>${fmtSize(a.size)}</td><td class="small">${fmtDate(a.mtime)}</td>
              <td class="actions"><button class="btn" data-aload="${esc(a.name)}">Load</button><button class="btn danger" data-adel="${esc(a.name)}">Delete</button></td></tr>`).join('')}</table>`
            : '<p class="empty">No autosaves yet.</p>'}
          <p class="small muted">Saves folder: <code>${esc(d.folder)}</code></p>`;
      } catch (e) { box.innerHTML = `<span class="empty">${esc(e.message)}</span>`; }
    },
  };

  // -- bots
  const viewBots = {
    render() {
      const card = (id, title, lines, warn) => `<div class="metal"><div class="inner"><h3>${title}</h3>
        <ul style="margin:0 0 10px;padding-left:18px">${lines.map(l => `<li>${l}</li>`).join('')}</ul>
        <button class="btn danger" data-bots="${id}" data-warn="${esc(warn)}">${title}</button></div></div>`;
      return `${banner('Random Bots')}
        <p>The server is stopped first if it is running. Changes apply on the next start.</p>
        <div class="grid">
          ${card('reset', 'Reset bots settings', ['randomise timer', 'online bot number', 'RTSC settings', 'changed strategies'], 'All bots settings will be reset')}
          ${card('delete', 'Delete random bots', ['delete all random bots', 'except bots in friends lists or guilds', 'new bots are created on next start'], 'All random bots will be removed. Bots in friend/guild will stay')}
          ${card('deleteAll', 'Delete ALL random bots', ['delete every random bot', 'including bots in guilds/friends', 'new bots are created on next start'], 'All random bots will be removed, including those in guilds/friends')}
        </div>
        <p class="small muted">Changed AiPlayerbot.MinRandomBots / MaxRandomBots in aiplayerbot.conf? Run <b>Reset bots settings</b> for it to take effect.</p>`;
    },
    mount(root) {
      root.addEventListener('click', async (e) => {
        const b = e.target.closest('[data-bots]');
        if (!b) return;
        if (await confirmDialog({ title: b.textContent, warning: [b.dataset.warn] })) act('/api/bots', { action: b.dataset.bots });
      });
    },
  };

  // -- database (wipe + custom sql)
  const viewDatabase = {
    db: 'world',
    render() {
      const card = (id, title, lines, warn) => `<div class="metal"><div class="inner"><h3>${title}</h3>
        <ul style="margin:0 0 10px;padding-left:18px">${lines.map(l => `<li>${l}</li>`).join('')}</ul>
        <button class="btn danger" data-wipe="${id}" data-warn="${esc(warn)}">${title}</button></div></div>`;
      return `${banner('Database')}
        <div class="subheader">Wipe database</div>
        <div class="grid">
          ${card('world', 'Wipe World DB', ['reinstall the world database', 'custom content (items, NPCs, spawns) is removed', 'translations are removed'], 'World Database will be reinstalled. Any custom things will be removed')}
          ${card('characters', 'Wipe Characters', ['delete all characters', 'including bot characters', 'accounts are kept'], 'All characters AND bots will be removed (FOREVER)')}
          ${card('all', 'Wipe Chars & Accounts', ['delete all characters and accounts', 'including bot accounts and characters'], 'All characters AND accounts will be removed (FOREVER)')}
        </div>
        <div class="subheader">Modify database (custom SQL)</div>
        <div class="row center" style="margin-bottom:8px">
          ${[['world', 'World DB', 'items, NPCs, objects, scripts & other content'], ['characters', 'Characters DB', 'characters, inventory, auction'], ['accounts', 'Accounts DB', 'accounts']]
            .map(([id, l, t]) => `<label class="check" title="${t}" style="margin-right:14px"><input type="radio" name="moddb" value="${id}" ${this.db === id ? 'checked' : ''}> ${l}</label>`).join('')}
        </div>
        <div id="custom"><span class="empty">Loading...</span></div>`;
    },
    mount(root) {
      this.reload();
      root.addEventListener('change', (e) => { if (e.target.name === 'moddb') { this.db = e.target.value; this.reload(); } });
      root.addEventListener('click', async (e) => {
        const w = e.target.closest('[data-wipe]');
        if (w && await confirmDialog({ title: w.textContent, warning: [w.dataset.warn, 'The server is stopped first if it is running.'] })) act('/api/wipe', { what: w.dataset.wipe });
        const ed = e.target.closest('[data-cedit]');
        if (ed) openFile('custom', ed.dataset.cedit, this.db, true);
        const ap = e.target.closest('[data-capply]');
        if (ap) {
          const all = ap.dataset.capply === '*';
          const warning = ['Changes you are going to apply are PERMANENT.', this.db === 'world'
            ? 'To revert custom changes in World DB you will have to use Wipe World DB.'
            : 'To revert them you will have to connect to the database and undo your changes manually.'];
          if (await confirmDialog({ title: all ? 'Apply all SQL files' : `Apply ${ap.dataset.capply}`, warning, ok: 'Apply' })) {
            act('/api/custom/apply', { db: this.db, file: all ? null : ap.dataset.capply });
          }
        }
        const del = e.target.closest('[data-cdel]');
        if (del && await confirmDialog({ title: 'Delete SQL file', text: `Delete ${del.dataset.cdel}?`, ok: 'Delete' })) {
          act('/api/file/delete', { kind: 'custom', db: this.db, name: del.dataset.cdel }, { onDone: () => this.reload() });
        }
        if (e.target.closest('[data-cnew]')) {
          let name = await confirmDialog({ title: 'New SQL file', input: { label: 'File name', value: 'my_changes.sql' }, ok: 'Create', danger: false });
          if (!name) return;
          name = name.trim().replace(/[^\w.-]/g, '_');
          if (!/\.sql$/i.test(name)) name += '.sql';
          try { await api('/api/file', { kind: 'custom', db: this.db, name, text: '-- Your SQL here\r\n' }); await this.reload(); openFile('custom', name, this.db, true); }
          catch (err) { toast(err.message, true); }
        }
      });
    },
    async reload() {
      const box = $('#custom');
      if (!box) return;
      try {
        const r = await api(`/api/custom?db=${this.db}`);
        box.innerHTML = `<table class="list"><tr><th>SQL file</th><th>Modified</th><th></th></tr>
          ${r.files.map(f => `<tr><td><b>${esc(f.name)}</b>${f.name === 'manual_sql_file.sql' ? ' <span class="muted small">(manual file)</span>' : ''}</td><td class="small">${fmtDate(f.mtime)}</td>
            <td class="actions"><button class="btn" data-cedit="${esc(f.name)}">Edit</button><button class="btn" data-capply="${esc(f.name)}">Apply</button>
            ${f.name === 'manual_sql_file.sql' ? '' : `<button class="btn danger" data-cdel="${esc(f.name)}">Delete</button>`}</td></tr>`).join('')}</table>
          <div class="row"><button class="btn" data-cnew>New SQL file</button><button class="btn" data-capply="*">Apply ALL SQL files</button>
          <span class="small muted" style="align-self:center">(except the manual file) to <b>${esc(r.database)}</b></span></div>
          <p class="small muted">Folder: <code>${esc(r.folder)}</code></p>`;
      } catch (e) { box.innerHTML = `<span class="empty">${esc(e.message)}</span>`; }
    },
  };

  // -- translations
  const viewLocales = {
    render() { return `${banner('Install Translations')}<div id="loc"><span class="empty">Loading...</span></div>`; },
    mount(root) {
      this.reload();
      root.addEventListener('click', (e) => {
        if (!e.target.closest('[data-install]')) return;
        const locales = $$('input[name=loc]:checked', root).map(i => i.value);
        if (!locales.length) { toast('Choose at least one language', true); return; }
        act('/api/locales', { locales });
      });
    },
    async reload() {
      const box = $('#loc');
      if (!box) return;
      try {
        const list = await api('/api/locales');
        box.innerHTML = `<p>Translates quests, items, NPCs and other world content for players using a localized game client.</p>
          <table class="list" style="max-width:520px"><tr><th></th><th>Language</th><th>Status</th></tr>
          ${list.map(l => `<tr><td style="width:24px"><input type="checkbox" name="loc" value="${l.key}" id="loc-${l.key}"></td>
            <td><label for="loc-${l.key}">${esc(l.label)}</label></td><td class="${l.status === 'Not installed' ? 'muted' : 'ok'}">${esc(l.status)}</td></tr>`).join('')}</table>
          <button class="btn" data-install>Install selected</button>
          <p class="small muted">Reinstalling or updating the world database removes translations; install them again afterwards.</p>`;
      } catch (e) { box.innerHTML = `<span class="empty">${esc(e.message)}</span>`; }
    },
  };

  // -- beta build
  const viewBeta = {
    render() { return `${banner('Beta Build')}<div id="beta"><span class="empty">Loading...</span></div>`; },
    mount(root) {
      this.reload();
      root.addEventListener('click', async (e) => {
        const b = e.target.closest('[data-beta]');
        if (!b) return;
        const a = b.dataset.beta;
        const text = a === 'enable' ? 'You are about to download the Beta Build. It has the latest features, but may be buggy. You can revert it later.'
          : a === 'disable' ? 'You are about to restore the original server binary (mangosd).' : 'Download the latest Beta Build?';
        if (await confirmDialog({ title: b.textContent, text, ok: b.textContent, danger: false })) act('/api/beta', { action: a });
      });
    },
    async reload() {
      const box = $('#beta');
      if (!box) return;
      try {
        const b = await api('/api/beta');
        if (!b.supported) { box.innerHTML = '<p>Beta builds are Windows binaries from the mangosbot-bots releases. On Linux, update by rebuilding CMaNGOS from source.</p>'; return; }
        box.innerHTML = `<p>Status: ${b.enabled ? `<span class="badge beta">BETA</span> since ${esc(b.since || '')}` : '<span class="badge">RELEASE</span>'}
          &middot; mangosd built ${fmtDate(b.binaryDate)}</p>
          <p>Beta builds come from the latest <a href="https://github.com/celguar/mangosbot-bots/releases" target="_blank" rel="noopener">mangosbot-bots release</a>. The server is stopped first if it is running.</p>
          ${b.enabled ? '<button class="btn" data-beta="update">Update Beta Build</button><button class="btn" data-beta="disable">Switch back to Release</button>'
            : '<button class="btn" data-beta="enable">Switch to Beta Build</button>'}`;
      } catch (e) { box.innerHTML = `<span class="empty">${esc(e.message)}</span>`; }
    },
    onStatus() { /* reload happens after jobs */ },
  };

  // -- service
  const viewService = {
    render() {
      const st = S.status;
      const win = st.isWindows;
      return `${banner('Service')}
        <div class="grid">
          <div class="metal"><div class="inner"><h3>Fix database errors</h3><p>Checks and repairs all tables. Can help after a sudden server shutdown.</p>
            <button class="btn" data-svc="fixdb">Fix database</button></div></div>
          ${win ? `<div class="metal"><div class="inner"><h3>Visual C++ runtimes</h3><p>Needed for the server to run. Opens the installer on this machine.</p>
            <button class="btn" data-svc="vcredist">Install VC++ Redist</button></div></div>
          <div class="metal"><div class="inner"><h3>SPP Extras</h3><p>Opens the SPP Extras tool on this machine.</p>
            <button class="btn" data-svc="extras">Open SPP Extras</button></div></div>` : ''}
          <div class="metal"><div class="inner"><h3>Report a bug</h3><p>The playerbots system is developed by ike3; this repack uses a modified version of it.</p>
            <a class="btn" href="https://github.com/celguar/mangosbot-bots/issues" target="_blank" rel="noopener">Open bug tracker</a></div></div>
          <div class="metal"><div class="inner"><h3>Website files</h3><p>Installed version: <b>${st.website.version || 'none'}</b>, latest: <b>${st.website.target}</b>.</p>
            <button class="btn" data-svc="website">${st.website.installed ? 'Reinstall website' : 'Install website'} (~170 MB)</button></div></div>
        </div>
        <div class="subheader">Launcher</div>
        <table class="list" style="max-width:640px">
          <tr><td>Platform</td><td>${esc(st.platform)}${win ? '' : ' (Linux: bring your own mangosd/realmd builds and MySQL/MariaDB)'}</td></tr>
          <tr><td>Database</td><td>${st.database.managed ? 'Managed by the launcher' : 'External'} at ${esc(st.database.host)}:${st.database.port}</td></tr>
          <tr><td>Website</td><td>${st.website.managed ? 'Bundled Apache, managed by the launcher' : 'Not managed (host Server/website yourself)'}</td></tr>
        </table>
        <button class="btn danger" data-shutdown>Shutdown Repack</button>`;
    },
    mount(root) {
      root.addEventListener('click', async (e) => {
        const b = e.target.closest('[data-svc]');
        if (e.target.closest('[data-shutdown]')) shutdownRepack();
        if (!b) return;
        const s = b.dataset.svc;
        if (s === 'fixdb') act('/api/service/fixdb', {});
        if (s === 'vcredist') act('/api/service/vcredist', {}, { ok: 'Installer started on the server machine' });
        if (s === 'extras') act('/api/service/extras', {});
        if (s === 'website' && await confirmDialog({ title: 'Website', text: 'Download and install the latest website (~170 MB)?', ok: 'Download', danger: false })) act('/api/website/update', {});
      });
    },
    onStatus: rerenderWhenChanged(st => [st.website, st.database]),
  };

  // -- changelog
  const viewChangelog = {
    render() { return `${banner('Changelog')}<div class="row" style="align-items:flex-start;gap:16px"><div id="cl-list" style="min-width:180px"></div><div style="flex:1;min-width:260px"><pre class="viewer" id="cl-text" style="height:auto;max-height:70vh;min-height:300px"></pre></div></div>`; },
    async mount(root) {
      root.addEventListener('click', (e) => { const a = e.target.closest('[data-cl]'); if (a) { e.preventDefault(); this.show(a.dataset.cl); } });
      try {
        const r = await api('/api/files?kind=changelog');
        this.files = r.files;
        $('#cl-list').innerHTML = r.files.map(f => `<a class="menufiller" style="background-color:#1d160c" href="#" data-cl="${esc(f.name)}">v${esc(f.name.replace(/\.txt$/, '').replace('_', ' - '))}</a>`).join('');
        if (r.files[0]) this.show(r.files[0].name);
      } catch (e) { toast(e.message, true); }
    },
    async show(name) {
      try {
        const f = await api(`/api/file?kind=changelog&name=${encodeURIComponent(name)}`);
        $('#cl-text').textContent = f.text;
        $$('[data-cl]').forEach(a => a.classList.toggle('active', a.dataset.cl === name));
      } catch (e) { toast(e.message, true); }
    },
  };

  const viewLogin = {
    render() {
      const s = S.session;
      return `${banner('Admin Login')}
        <div class="login"><div class="metal"><div class="inner">
          <form id="login-form" autocomplete="on">
            <h3>SPP Classics Admin Panel</h3>
            <p class="small muted">Log in to manage the server.</p>
            <label class="field" style="width:100%">Username<input type="text" name="username" required autocomplete="username" value="${esc(s.username && s.isDefault ? s.username : '')}"></label>
            <label class="field" style="width:100%">Password<input type="password" name="password" required autocomplete="current-password"></label>
            <div class="row" style="justify-content:flex-end"><button class="btn big" type="submit">Login</button></div>
            ${s.isDefault && s.loopback ? '<p class="small muted" style="margin:8px 0 0">First login: <b>admin</b> / <b>admin</b>. You will be asked to change it.</p>' : ''}
          </form>
        </div></div></div>`;
    },
    mount(root) {
      const form = $('#login-form', root);
      (form.username.value ? form.password : form.username).focus();
      form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const f = new FormData(form);
        try {
          await api('/api/login', { username: f.get('username'), password: f.get('password') });
          await start();
          if (S.session.isDefault) location.hash = '#/admin';
        } catch (err) { toast(err.message, true); form.password.select(); }
      });
    },
  };

  // -- scheduled maintenance
  const WEEKDAYS = [[1, 'Monday'], [2, 'Tuesday'], [3, 'Wednesday'], [4, 'Thursday'], [5, 'Friday'], [6, 'Saturday'], [0, 'Sunday']];
  const ACTIONS = { restart: 'Restart', update: 'Update & restart' };
  const RESULT_CLASS = { done: 'ok', failed: 'bad', skipped: 'warnc', missed: 'warnc' };

  function updateOptionsHtml(o, isWin, git) {
    return `<label class="check"><input type="checkbox" name="gitPull" ${o.gitPull ? 'checked' : ''} ${git ? '' : 'disabled'}> Download the latest repack files first (git pull)${git ? '' : ' <span class="muted small">- not a git install</span>'}</label><br>
      <label class="check"><input type="checkbox" name="updateWebsite" ${o.updateWebsite ? 'checked' : ''}> Update the website when a new version is available (~170 MB)</label><br>
      ${isWin ? `<label class="check"><input type="checkbox" name="updateBeta" ${o.updateBeta ? 'checked' : ''}> Download the latest Beta Build if Beta is enabled</label>` : ''}`;
  }

  const viewMaintenance = {
    render() {
      return `${banner('Scheduled Maintenance')}
        <p>Restart the world server automatically, or shut it down to install updates and start it again.
          Players get an in-game countdown before the server goes down.</p>
        <div id="mt"><span class="empty">Loading...</span></div>`;
    },
    mount(root) {
      this.reload();
      root.addEventListener('click', e => this.click(e));
      root.addEventListener('change', async (e) => {
        const t = e.target.closest('[data-enable]');
        if (!t) return;
        const s = this.data.schedules.find(x => x.id === t.dataset.enable);
        await act('/api/maintenance/save', { ...s, enabled: t.checked }, { ok: t.checked ? 'Schedule enabled' : 'Schedule paused', onDone: () => this.reload() });
      });
    },
    async click(e) {
      const b = e.target.closest('[data-add],[data-edit],[data-del],[data-run],[data-now],[data-log]');
      if (!b) return;
      if (b.dataset.add !== undefined) this.edit(null);
      if (b.dataset.edit) this.edit(this.data.schedules.find(s => s.id === b.dataset.edit));
      if (b.dataset.del && await confirmDialog({ title: 'Delete schedule', text: 'Delete this schedule?', ok: 'Delete' })) {
        act('/api/maintenance/delete', { id: b.dataset.del }, { onDone: () => this.reload() });
      }
      if (b.dataset.run) {
        const s = this.data.schedules.find(x => x.id === b.dataset.run);
        if (await confirmDialog({ title: `${ACTIONS[s.action]} now`, warning: s.warnMinutes ? null : ['Players are disconnected immediately (no warning time set).'],
          text: `Run "${s.label}" now?${s.warnMinutes ? ` Players get a ${s.warnMinutes} minute warning.` : ''}`, ok: 'Run now' })) {
          act('/api/maintenance/run', { id: s.id }, { onDone: () => this.reload() });
        }
      }
      if (b.dataset.now) this.runOnce(b.dataset.now);
      if (b.dataset.log) this.showLog(b.dataset.log);
    },
    async reload() {
      const box = $('#mt');
      if (!box) return;
      try {
        const d = this.data = await api('/api/maintenance');
        const busy = S.status && S.status.job && S.status.job.status === 'running';
        box.innerHTML = `
          <div class="notice small">Times use the server computer's clock: <b>${new Date(d.now).toLocaleString()}</b> (${esc(d.timezone)}). The launcher must be running for schedules to fire.</div>
          <div class="subheader">Schedules</div>
          ${d.schedules.length ? `<div class="scroll-x"><table class="list"><tr><th>On</th><th>When</th><th>Action</th><th>Warning</th><th>Next run</th><th>Last run</th><th></th></tr>
            ${d.schedules.map(s => `<tr>
              <td><input type="checkbox" data-enable="${s.id}" ${s.enabled ? 'checked' : ''} aria-label="Enabled"></td>
              <td><b>${esc(s.label)}</b></td>
              <td>${ACTIONS[s.action]}${s.action === 'update' ? `<div class="small muted">${[s.gitPull && 'repack files', 'databases & core', s.updateWebsite && 'website', s.updateBeta && 'beta'].filter(Boolean).join(', ')}</div>` : ''}</td>
              <td>${s.warnMinutes ? `${s.warnMinutes} min` : 'none'}</td>
              <td class="small">${s.enabled && s.nextRunAt ? fmtDate(s.nextRunAt) : '<span class="muted">paused</span>'}</td>
              <td class="small">${s.lastRunAt ? `${fmtDate(s.lastRunAt)}<br><span class="${RESULT_CLASS[s.lastResult] || ''}">${esc(s.lastResult || '')}</span>` : '-'}</td>
              <td class="actions"><button class="btn" data-run="${s.id}" ${busy ? 'disabled' : ''}>Run now</button><button class="btn" data-edit="${s.id}">Edit</button><button class="btn danger" data-del="${s.id}">Delete</button></td>
            </tr>`).join('')}</table></div>` : '<p class="empty">No scheduled maintenance yet.</p>'}
          <button class="btn" data-add>Add schedule</button>
          <div class="subheader">Run once now</div>
          <div class="row">
            <button class="btn" data-now="restart" ${busy ? 'disabled' : ''}>Restart server now</button>
            <button class="btn" data-now="update" ${busy ? 'disabled' : ''}>Update &amp; restart now</button>
          </div>
          <div class="subheader">History</div>
          ${d.history.length ? `<table class="list"><tr><th>Time</th><th>Maintenance</th><th>Result</th><th></th></tr>
            ${d.history.map(h => `<tr><td class="small">${fmtDate(h.at)}</td><td>${esc(h.label)} &middot; ${ACTIONS[h.action] || ''}</td>
              <td><span class="${RESULT_CLASS[h.result] || ''}">${esc(h.result)}</span>${h.message ? ` <span class="small muted">${esc(h.message)}</span>` : ''}</td>
              <td class="actions">${h.hasLog ? `<button class="btn" data-log="${h.at}">Log</button>` : ''}</td></tr>`).join('')}</table>`
            : '<p class="empty">Nothing has run yet.</p>'}`;
      } catch (e) { box.innerHTML = `<span class="empty">${esc(e.message)}</span>`; }
    },
    edit(s) {
      const d = this.data;
      const o = s || { enabled: true, frequency: 'daily', weekday: 1, day: 1, time: '04:00', action: 'restart', warnMinutes: 5, gitPull: d.gitAvailable, updateWebsite: false, updateBeta: false };
      const dlg = dialog({
        title: s ? 'Edit schedule' : 'Add schedule',
        body: `<form id="sch-form" autocomplete="off">
          <div class="row">
            <label class="field">Repeat<select name="frequency">
              ${['daily', 'weekly', 'monthly'].map(f => `<option value="${f}" ${o.frequency === f ? 'selected' : ''}>${f[0].toUpperCase() + f.slice(1)}</option>`).join('')}</select></label>
            <label class="field" data-for="weekly">Day of week<select name="weekday">${WEEKDAYS.map(([v, l]) => `<option value="${v}" ${+o.weekday === v ? 'selected' : ''}>${l}</option>`).join('')}</select></label>
            <label class="field" data-for="monthly">Day of month<select name="day">${Array.from({ length: 31 }, (_, i) => i + 1).map(n => `<option value="${n}" ${+o.day === n ? 'selected' : ''}>${n === 31 ? 'Last day' : n}</option>`).join('')}</select></label>
            <label class="field">Time<input type="time" name="time" value="${esc(o.time)}" required></label>
          </div>
          <div class="subheader">What to do</div>
          <label class="check"><input type="radio" name="action" value="restart" ${o.action === 'restart' ? 'checked' : ''}> <b>Restart</b> &mdash; <code>.server restart</code>, then start the world server again</label><br>
          <label class="check"><input type="radio" name="action" value="update" ${o.action === 'update' ? 'checked' : ''}> <b>Update &amp; restart</b> &mdash; <code>.server shutdown</code>, install updates, then start again</label>
          <fieldset class="opts" data-for-action="update">${updateOptionsHtml(o, d.isWindows, d.gitAvailable)}
            <p class="small muted" style="margin:4px 0 0">Database, maps and core updates are always applied, the same checks as when you choose an expansion.</p></fieldset>
          <div class="row" style="margin-top:10px">
            <label class="field">Warn players before shutdown<select name="warnMinutes">${[0, 1, 2, 5, 10, 15, 30, 60].map(m => `<option value="${m}" ${+o.warnMinutes === m ? 'selected' : ''}>${m ? `${m} minute${m > 1 ? 's' : ''}` : 'No warning'}</option>`).join('')}</select></label>
            <label class="check" style="margin-bottom:10px"><input type="checkbox" name="enabled" ${o.enabled ? 'checked' : ''}> Enabled</label>
          </div>
        </form>`,
        foot: '<button class="btn" data-close>Cancel</button><button class="btn" data-ok>Save schedule</button>',
      });
      const form = $('#sch-form', dlg.el);
      const sync = () => {
        const freq = $('[name=frequency]', form).value;
        const action = $('[name=action]:checked', form).value;
        $$('[data-for]', form).forEach(el => { el.style.display = el.dataset.for === freq ? '' : 'none'; });
        $('[data-for-action]', form).disabled = action !== 'update';
      };
      form.addEventListener('change', sync);
      sync();
      $('[data-ok]', dlg.el).addEventListener('click', async () => {
        if (!form.reportValidity()) return;
        const f = new FormData(form);
        const body = { id: s && s.id, frequency: f.get('frequency'), weekday: f.get('weekday'), day: f.get('day'), time: f.get('time'), action: f.get('action'),
          warnMinutes: f.get('warnMinutes'), enabled: f.has('enabled'), gitPull: f.has('gitPull'), updateWebsite: f.has('updateWebsite'), updateBeta: f.has('updateBeta') };
        try { await api('/api/maintenance/save', body); dlg.close(); toast('Schedule saved'); this.reload(); refreshStatus(); }
        catch (err) { toast(err.message, true); }
      });
    },
    runOnce(action) {
      const d = this.data;
      const dlg = dialog({
        title: action === 'update' ? 'Update & restart now' : 'Restart server now',
        body: `<form id="once-form">
          <p>${action === 'update' ? 'The world server is shut down with <code>.server shutdown</code>, updates are installed and the server is started again.'
            : 'The world server is restarted with <code>.server restart</code> and started again when it is down.'}</p>
          <label class="field">Warn players before shutdown<select name="warnMinutes">${[0, 1, 2, 5, 10, 15].map(m => `<option value="${m}" ${m === 1 ? 'selected' : ''}>${m ? `${m} minute${m > 1 ? 's' : ''}` : 'No warning'}</option>`).join('')}</select></label>
          ${action === 'update' ? `<div>${updateOptionsHtml({ gitPull: d.gitAvailable }, d.isWindows, d.gitAvailable)}</div>` : ''}
        </form>`,
        foot: `<button class="btn" data-close>Cancel</button><button class="btn danger" data-ok>${action === 'update' ? 'Update & restart' : 'Restart'}</button>`,
      });
      $('[data-ok]', dlg.el).addEventListener('click', () => {
        const f = new FormData($('#once-form', dlg.el));
        dlg.close();
        act('/api/maintenance/now', { action, warnMinutes: f.get('warnMinutes'), gitPull: f.has('gitPull'), updateWebsite: f.has('updateWebsite'), updateBeta: f.has('updateBeta') }, { onDone: () => this.reload() });
      });
    },
    async showLog(at) {
      try {
        const r = await api(`/api/maintenance/log?at=${encodeURIComponent(at)}`);
        const d = dialog({ title: 'Maintenance log', wide: true, body: '<div class="joblog" style="height:100%"></div>', foot: '<button class="btn" data-close>Close</button>' });
        const box = $('.joblog', d.el);
        r.log.forEach((l) => { const div = document.createElement('div'); div.className = l.level; div.textContent = l.text; box.appendChild(div); });
      } catch (e) { toast(e.message, true); }
    },
    onStatus: rerenderWhenChanged(st => [st.maintenance, st.job && st.job.status]),
  };

  // -- launcher settings (admin login)
  const viewAdmin = {
    render() {
      const s = S.session;
      return `${banner('Launcher Settings')}
        ${s.isDefault ? '<div class="notice warning"><strong>You are using the default login (admin / admin).</strong> Choose a new password below. Until you do, the panel can only be used from this computer.</div>' : ''}
        <div class="subheader">Admin login</div>
        <form class="row" id="admin-form" autocomplete="off" style="max-width:640px">
          <label class="field">Username<input type="text" name="username" value="${esc(s.username)}" required maxlength="32" autocomplete="username"></label>
          <label class="field">Current password<input type="password" name="currentPassword" required autocomplete="current-password"></label>
          <label class="field">New password<input type="password" name="newPassword" minlength="6" ${s.isDefault ? 'required' : ''} autocomplete="new-password" placeholder="${s.isDefault ? '' : 'leave empty to keep'}"></label>
          <label class="field">Repeat new password<input type="password" name="confirm" autocomplete="new-password"></label>
          <button class="btn" type="submit" style="margin-bottom:9px">Save login</button>
        </form>
        <p class="small muted">Other browsers that are logged in will be logged out. Forgot the password? Stop the launcher and delete <code>WebLauncher/runtime/auth.json</code> to reset it to admin / admin.</p>
        ${s.isDefault ? '' : '<p><button class="btn" type="button" data-auth-reset>Reset login to admin / admin</button></p>'}
        <div class="subheader">Remote access</div>
        <div id="remote-box"><p class="muted">Loading...</p></div>`;
    },
    renderRemote(r) {
      const box = $('#remote-box');
      if (!box) return;
      const blocked = r.envLocked || (!r.enabled && r.defaultLogin);
      box.innerHTML = `
        <label class="check"><input type="checkbox" data-remote ${r.enabled ? 'checked' : ''} ${blocked ? 'disabled' : ''}> Allow access from other devices on the network</label>
        ${r.envLocked ? `<p class="small muted">Set by the <code>SPP_HOST</code> environment variable (<code>${esc(r.host)}</code>).</p>` : ''}
        ${!r.enabled && r.defaultLogin && !r.envLocked ? '<p class="small muted">Change the default password above first: the admin / admin login only works on this computer.</p>' : ''}
        ${r.enabled ? `<p>Open the panel from another device with ${r.urls.length ? r.urls.map(u => `<code>${esc(u)}</code>`).join(' or ') : 'this computer\'s IP address'}.
            If it does not load, allow Node.js (port ${r.port}) through this computer's firewall.</p>`
          : '<p class="small muted">The panel only answers on this computer. Changes apply right away; no restart needed.</p>'}`;
    },
    async loadRemote() {
      try { this.renderRemote(await api('/api/remote')); } catch (e) { const box = $('#remote-box'); if (box) box.innerHTML = `<p class="muted">${esc(e.message)}</p>`; }
    },
    resetLogin() {
      const d = dialog({
        title: 'Reset login',
        body: `<form id="reset-form">
          <p>The login goes back to <strong>admin / admin</strong> and other browsers are logged out.
            Until you choose a new password, logging in only works on this computer${S.session.loopback ? '' : ' (not from the device you are using now)'}.</p>
          <label class="field" style="width:100%">Current password<input type="password" name="currentPassword" required autocomplete="current-password"></label>
        </form>`,
        foot: '<button class="btn" data-close>Cancel</button><button class="btn danger" data-ok>Reset login</button>',
      });
      const form = $('#reset-form', d.el);
      form.currentPassword.focus();
      const submit = async () => {
        if (!form.currentPassword.value) { form.currentPassword.focus(); return; }
        try {
          await api('/api/auth/reset', { currentPassword: form.currentPassword.value });
          d.close();
          toast('Login reset to admin / admin');
          S.session = await api('/api/session');
          rerender();
        } catch (err) { toast(err.message, true); form.currentPassword.select(); }
      };
      form.addEventListener('submit', (e) => { e.preventDefault(); submit(); });
      $('[data-ok]', d.el).addEventListener('click', submit);
    },
    mount(root) {
      this.loadRemote();
      $('[data-auth-reset]', root)?.addEventListener('click', () => this.resetLogin());
      root.addEventListener('change', async (e) => {
        const t = e.target.closest('[data-remote]');
        if (!t) return;
        if (!t.checked && !S.session.loopback && !await confirmDialog({ title: 'Turn off remote access',
          text: 'You are using the panel from another device. After this it only works on the server computer itself.', ok: 'Turn off' })) {
          t.checked = true; return;
        }
        t.disabled = true;
        try { this.renderRemote(await api('/api/remote', { enabled: t.checked })); toast(t.checked ? 'Remote access enabled' : 'Remote access disabled'); }
        catch (err) { toast(err.message, true); this.loadRemote(); }
      });
      $('#admin-form', root).addEventListener('submit', async (e) => {
        e.preventDefault();
        const f = Object.fromEntries(new FormData(e.target).entries());
        if (f.newPassword !== f.confirm) { toast('The new passwords do not match', true); return; }
        try {
          await api('/api/auth/change', { username: f.username, currentPassword: f.currentPassword, newPassword: f.newPassword || null });
          toast('Login saved');
          S.session = await api('/api/session');
          rerender();
        } catch (err) { toast(err.message, true); }
      });
    },
  };

  // ---------------------------------------------------------------- router
  const ROUTES = {
    '': () => (S.status.selected ? viewDashboard : viewRealms),
    realms: () => viewRealms, accounts: () => viewAccounts, settings: () => viewSettings, logs: () => viewLogs,
    saves: () => viewSaves, bots: () => viewBots, database: () => viewDatabase, locales: () => viewLocales,
    beta: () => viewBeta, service: () => viewService, changelog: () => viewChangelog,
    maintenance: () => viewMaintenance, admin: () => viewAdmin,
  };
  const NEEDS_EXP = new Set(['maintenance', 'accounts', 'settings', 'logs', 'saves', 'bots', 'database', 'locales', 'beta']);
  const currentRoute = () => location.hash.replace(/^#\/?/, '').split('?')[0];

  function render() {
    if (S.view && S.view.unmount) S.view.unmount();
    const root = $('#view');
    const fresh = root.cloneNode(false);
    root.replaceWith(fresh);
    if (!S.session.authed) {
      $('#menu').innerHTML = '';
      $('#statusbox').textContent = 'Login required';
      S.view = viewLogin;
    } else {
      if (!S.status) { fresh.innerHTML = '<p class="empty" style="padding-top:20px">Loading...</p>'; return; }
      const route = currentRoute();
      if (NEEDS_EXP.has(route) && needExp()) return;
      S.view = (ROUTES[route] || ROUTES[''])();
      renderMenu();
    }
    fresh.innerHTML = S.view.render();
    if (S.view.mount) S.view.mount(fresh);
  }
  function rerender() {
    const y = window.scrollY;
    render();
    window.scrollTo(0, y);
  }
  window.addEventListener('hashchange', render);
  // Go to a page; also re-renders when already there ('' and '#/' are the same route,
  // so setting the hash alone may not fire hashchange, e.g. on the first page load).
  function navigate(hash) {
    if (currentRoute() === hash.replace(/^#\/?/, '')) render();
    else location.hash = hash;
  }

  async function start() {
    try { S.session = await api('/api/session'); } catch { /* server down */ }
    if (!S.session.authed) { render(); return; }
    connectEvents();
    await refreshStatus();
    render();
  }
  start();
})();
