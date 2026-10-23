'use strict';
// Admin login for the panel. Credentials live in runtime/auth.json as a scrypt
// hash; the first start creates admin / admin.
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { writeText, httpError } = require('./util');

const DEFAULT_USER = 'admin';
const DEFAULT_PASS = 'admin';
const SESSION_IDLE_MS = 12 * 60 * 60 * 1000;

function hash(password, salt) {
  return crypto.scryptSync(String(password), salt, 64).toString('hex');
}

class Auth {
  constructor(runtimeDir, legacyPassword) {
    this.file = path.join(runtimeDir, 'auth.json');
    this.sessions = new Map(); // token -> { user, seen }
    try {
      this.data = JSON.parse(fs.readFileSync(this.file, 'utf8'));
    } catch {
      // config.json "password" from earlier versions becomes the admin password
      this.set(DEFAULT_USER, legacyPassword || DEFAULT_PASS, !legacyPassword);
    }
  }

  get username() { return this.data.username; }
  get isDefault() { return !!this.data.isDefault; }

  set(username, password, isDefault = false) {
    const salt = crypto.randomBytes(16).toString('hex');
    this.data = { username, salt, hash: hash(password, salt), isDefault };
    writeText(this.file, JSON.stringify(this.data, null, 2));
  }

  verify(username, password) {
    const a = Buffer.from(hash(password, this.data.salt), 'hex');
    const b = Buffer.from(this.data.hash, 'hex');
    const userOk = String(username || '').toLowerCase() === this.data.username.toLowerCase();
    return crypto.timingSafeEqual(a, b) && userOk;
  }

  login(username, password) {
    if (!this.verify(username, password)) return null;
    const token = crypto.randomBytes(24).toString('hex');
    this.sessions.set(token, { user: this.data.username, seen: Date.now() });
    return token;
  }

  check(token) {
    const s = token && this.sessions.get(token);
    if (!s) return false;
    if (Date.now() - s.seen > SESSION_IDLE_MS) { this.sessions.delete(token); return false; }
    s.seen = Date.now();
    return true;
  }

  logout(token) { this.sessions.delete(token); }

  // Change login; other browsers are logged out.
  change(token, { currentPassword, username, newPassword }) {
    if (!this.verify(this.data.username, currentPassword)) throw httpError(403, 'Current password is wrong');
    const user = String(username || this.data.username).trim();
    if (!/^[A-Za-z0-9_.-]{3,32}$/.test(user)) throw httpError(400, 'Username: 3-32 letters, digits, _ . -');
    const pass = newPassword ? String(newPassword) : null;
    if (pass !== null && pass.length < 6) throw httpError(400, 'New password must be at least 6 characters');
    if (pass === null && this.isDefault) throw httpError(400, 'Choose a new password to replace the default one');
    if (pass !== null) this.set(user, pass, false);
    else { this.data.username = user; writeText(this.file, JSON.stringify(this.data, null, 2)); }
    for (const t of [...this.sessions.keys()]) if (t !== token) this.sessions.delete(t);
    const s = this.sessions.get(token);
    if (s) s.user = user;
  }
}

module.exports = { Auth };
