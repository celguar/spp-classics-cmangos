'use strict';
// Scheduled maintenance: daily / weekly / monthly restarts, optionally with updates.
// Schedules use the server machine's local time.
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { writeText, httpError } = require('./util');
const { runMaintenance } = require('./ops/maintenance');

const DAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
const GRACE_MS = 30 * 60 * 1000; // run a late slot (launcher busy/asleep) only within 30 minutes
const MAX_HISTORY = 30;

function ordinal(n) {
  const s = ['th', 'st', 'nd', 'rd'];
  const v = n % 100;
  return n + (s[(v - 20) % 10] || s[v] || s[0]);
}

function describe(s) {
  const when = s.frequency === 'daily' ? 'Every day'
    : s.frequency === 'weekly' ? `Every ${DAYS[s.weekday]}`
      : `Monthly on the ${s.day >= 31 ? 'last day' : ordinal(s.day)}`;
  return `${when} at ${s.time}`;
}

// First occurrence strictly after `after` (ms). Monthly days past the end of a
// month run on its last day.
function nextOccurrence(s, after) {
  const [hh, mm] = s.time.split(':').map(Number);
  const base = new Date(after);
  for (let i = 0; i < 400; i++) {
    const c = new Date(base.getFullYear(), base.getMonth(), base.getDate() + i, hh, mm, 0, 0);
    if (c.getTime() <= after) continue;
    if (s.frequency === 'daily') return c.getTime();
    if (s.frequency === 'weekly' && c.getDay() === s.weekday) return c.getTime();
    if (s.frequency === 'monthly') {
      const last = new Date(c.getFullYear(), c.getMonth() + 1, 0).getDate();
      if (c.getDate() === Math.min(s.day, last)) return c.getTime();
    }
  }
  return null;
}

function normalize(input, existing = {}) {
  const s = { ...existing };
  s.id = existing.id || crypto.randomBytes(6).toString('hex');
  s.enabled = input.enabled !== false;
  if (!['daily', 'weekly', 'monthly'].includes(input.frequency)) throw httpError(400, 'Choose daily, weekly or monthly');
  s.frequency = input.frequency;
  s.weekday = Math.min(6, Math.max(0, parseInt(input.weekday, 10) || 0));
  s.day = Math.min(31, Math.max(1, parseInt(input.day, 10) || 1));
  if (!/^([01]\d|2[0-3]):[0-5]\d$/.test(String(input.time))) throw httpError(400, 'Enter a time as HH:MM');
  s.time = input.time;
  if (!['restart', 'update'].includes(input.action)) throw httpError(400, 'Choose restart or update');
  s.action = input.action;
  s.warnMinutes = Math.min(60, Math.max(0, parseInt(input.warnMinutes, 10) || 0));
  s.gitPull = !!input.gitPull;
  s.updateWebsite = !!input.updateWebsite;
  s.updateBeta = !!input.updateBeta;
  return s;
}

class Scheduler {
  constructor(L) {
    this.L = L;
    this.file = path.join(L.P.runtime, 'schedule.json');
    this.data = { schedules: [], history: [] };
    try { Object.assign(this.data, JSON.parse(fs.readFileSync(this.file, 'utf8'))); } catch { /* first start */ }
    const now = Date.now();
    for (const s of this.data.schedules) if (!s.nextRunAt) s.nextRunAt = nextOccurrence(s, now);
    this.running = null;
    this.timer = setInterval(() => this.tick(), 20000);
    setTimeout(() => this.tick(), 3000);
  }

  save() { writeText(this.file, JSON.stringify(this.data, null, 2)); }

  list() {
    return {
      now: Date.now(),
      timezone: Intl.DateTimeFormat().resolvedOptions().timeZone,
      schedules: this.data.schedules.map(s => ({ ...s, label: describe(s) })),
      history: this.data.history.map(({ log, ...h }) => ({ ...h, hasLog: !!(log && log.length) })),
    };
  }

  historyLog(at) {
    const h = this.data.history.find(x => String(x.at) === String(at));
    if (!h) throw httpError(404, 'Not found');
    return h.log || [];
  }

  summary() {
    const next = this.data.schedules.filter(s => s.enabled && s.nextRunAt).sort((a, b) => a.nextRunAt - b.nextRunAt)[0];
    return {
      next: next ? { at: next.nextRunAt, label: describe(next), action: next.action } : null,
      running: this.running,
    };
  }

  upsert(input) {
    const existing = input.id ? this.data.schedules.find(s => s.id === input.id) : null;
    if (input.id && !existing) throw httpError(404, 'Schedule not found');
    const s = normalize(input, existing || {});
    s.nextRunAt = nextOccurrence(s, Date.now());
    if (existing) Object.assign(existing, s); else this.data.schedules.push(s);
    this.save();
    this.L.emit('changed');
    return s;
  }

  remove(id) {
    this.data.schedules = this.data.schedules.filter(s => s.id !== id);
    this.save();
    this.L.emit('changed');
  }

  record(entry) {
    this.data.history.unshift(entry);
    this.data.history.length = Math.min(this.data.history.length, MAX_HISTORY);
    this.save();
  }

  // Start a maintenance task now (scheduled, "run now", or one-off from the page).
  start(opts, { schedule = null, label }) {
    const title = `${opts.action === 'update' ? 'Update & restart' : 'Restart'}${schedule ? ' (scheduled)' : ''}`;
    const job = this.L.jobs.run(title, ctx => runMaintenance(this.L, ctx, opts));
    this.running = { title, since: Date.now() };
    this.L.emit('changed');
    job.promise.then(() => {
      this.running = null;
      const result = job.status === 'failed' ? 'failed' : job.result && job.result.skipped ? 'skipped' : 'done';
      const message = job.error || (job.result && job.result.message) || '';
      if (schedule) { schedule.lastRunAt = job.startedAt; schedule.lastResult = result; }
      this.record({ at: job.startedAt, label, action: opts.action, result, message, log: job.log.slice(-300).map(l => ({ level: l.level, text: l.text })) });
      this.L.emit('changed');
    });
    return job;
  }

  runNow(id) {
    const s = this.data.schedules.find(x => x.id === id);
    if (!s) throw httpError(404, 'Schedule not found');
    return this.start(s, { schedule: s, label: `${describe(s)} (run manually)` });
  }

  tick() {
    const now = Date.now();
    let dirty = false;
    for (const s of this.data.schedules) {
      if (!s.enabled || !s.nextRunAt || now < s.nextRunAt) continue;
      if (now - s.nextRunAt > GRACE_MS) {
        this.record({ at: s.nextRunAt, label: describe(s), action: s.action, result: 'missed', message: 'The launcher was not running or was busy at that time' });
        s.lastResult = 'missed';
        s.nextRunAt = nextOccurrence(s, now);
        dirty = true;
        continue;
      }
      if (this.L.jobs.busy) continue; // try again on the next tick
      s.nextRunAt = nextOccurrence(s, now);
      dirty = true;
      try { this.start(s, { schedule: s, label: describe(s) }); }
      catch (e) { this.record({ at: now, label: describe(s), action: s.action, result: 'failed', message: e.message }); }
    }
    if (dirty) { this.save(); this.L.emit('changed'); }
  }
}

module.exports = { Scheduler, describe, nextOccurrence };
