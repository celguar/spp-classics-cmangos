'use strict';
const EventEmitter = require('events');
const { httpError } = require('./util');

// Long operations (install, updates, wipes, saves...) run one at a time, like the
// batch launcher which could only do one thing at once. Progress and log lines are
// broadcast to every open browser.
class Jobs extends EventEmitter {
  constructor() {
    super();
    this.seq = 0;
    this.current = null;
  }

  get busy() { return !!(this.current && this.current.status === 'running'); }

  summary(job = this.current) {
    if (!job) return null;
    const { id, title, status, progress, error, startedAt, endedAt, result } = job;
    return { id, title, status, progress, error, startedAt, endedAt, result, log: job.log.slice(-400) };
  }

  run(title, fn) {
    if (this.busy) throw httpError(409, `Please wait, "${this.current.title}" is still running`);
    const job = { id: ++this.seq, title, status: 'running', log: [], progress: null, error: null, result: null, startedAt: Date.now(), endedAt: null };
    this.current = job;
    const ctx = {
      job,
      log: (text, level = 'info') => {
        const entry = { t: Date.now(), level, text: String(text) };
        job.log.push(entry);
        if (job.log.length > 2000) job.log.splice(0, job.log.length - 2000);
        this.emit('log', job.id, entry);
      },
      progress: (pct, text) => {
        job.progress = pct === null && !text ? null : { pct, text: text || '' };
        this.emit('progress', job.id, job.progress);
      },
    };
    this.emit('job', this.summary(job));
    job.promise = (async () => {
      try {
        job.result = (await fn(ctx)) || null;
        job.status = 'done';
        ctx.log('Done!', 'ok');
      } catch (e) {
        job.status = 'failed';
        job.error = e.message;
        ctx.log(e.message, 'error');
      } finally {
        job.progress = null;
        job.endedAt = Date.now();
        this.emit('job', this.summary(job));
      }
    })();
    return job;
  }
}

module.exports = { Jobs };
