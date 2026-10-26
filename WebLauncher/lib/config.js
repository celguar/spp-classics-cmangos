'use strict';
const path = require('path');
const fs = require('fs');
const { IS_WIN, ROOT, EXE, rootPath, readText, exists } = require('./util');

const CONFIG_FILE = path.join(__dirname, '..', 'config.json');
const RUNTIME_DIR = path.join(__dirname, '..', 'runtime');

const DEFAULTS = {
  host: '127.0.0.1',
  port: 8090,
  password: '',
  allowedHosts: [],
  openBrowser: true,
  database: {
    host: '127.0.0.1',
    port: 3310,
    user: 'root',
    password: '123456',
    // auto: on Windows run the bundled MySQL from Server/Database; on Linux expect an
    // already running MySQL/MariaDB unless startCommand is set.
    manage: 'auto',
    binDir: '',
    startCommand: '',
    stopCommand: '',
  },
  website: {
    // auto: on Windows run the bundled Apache from Server/Tools/Apache24.
    manage: 'auto',
    url: '',
  },
  // Folder holding mangosd/realmd per expansion. Empty = Server/Binaries/<exp>/Bin64
  binaries: { vanilla: '', tbc: '', wotlk: '' },
  // HermesProxy folder with HermesProxy.exe (Windows) and HermesProxy (Linux)
  hermes: { dir: '' },
  sevenZip: '',
  shutdownTimeoutSec: 0, // 0 = wait as long as mangosd needs to save and exit
  autosaveIntervalMin: 15,
  maxAutosaves: 100,
  restartDelaySec: 10,
  perfHistory: false, // Performance page: record in the background, keep 24 hours
};

// Fallbacks for when Launcher.bat cannot be parsed. Launcher.bat stays the single
// source of truth for versions so both launchers agree on what is installed.
const FALLBACK = {
  repackVersion: '2.4.0',
  websiteVersion: 15,
  expansions: {
    vanilla: { sppUpdate: 'vanilla_base', db: { characters: 'classiccharacters', playerbot: 'classicplayerbots', world: 'classicmangos', login: 'classicrealmd', logs: 'classiclogs' },
      versions: { maps: 2, world: 29, chars: 14, realm: 4, logs: 1, bots: 27, website: 7, core: 49 } },
    tbc: { sppUpdate: 'tbc_base', db: { characters: 'tbccharacters', playerbot: 'tbcplayerbots', world: 'tbcmangos', login: 'tbcrealmd', logs: 'tbclogs' },
      versions: { maps: 2, world: 22, chars: 14, realm: 4, logs: 1, bots: 26, website: 5, core: 43 } },
    wotlk: { sppUpdate: 'wotlk_base', db: { characters: 'wotlkcharacters', playerbot: 'wotlkplayerbots', world: 'wotlkmangos', login: 'wotlkrealmd', logs: 'wotlklogs' },
      versions: { maps: 2, world: 18, chars: 7, realm: 4, logs: 1, bots: 17, website: 6, core: 25 } },
  },
};

const META = {
  vanilla: { label: 'World of Warcraft', short: 'Vanilla', patch: '1.12.1', betaZip: 'cmangos-classic.zip', transfer: false, transferFrom: null },
  tbc: { label: 'The Burning Crusade', short: 'TBC', patch: '2.4.3', betaZip: 'cmangos-tbc.zip', transfer: true, transferFrom: 'Vanilla' },
  wotlk: { label: 'Wrath of the Lich King', short: 'WotLK', patch: '3.3.5a', betaZip: 'cmangos-wotlk.zip', transfer: true, transferFrom: 'TBC' },
};

const BAT_VERSION_KEYS = { maps_version: 'maps', world_version: 'world', chars_version: 'chars', realm_version: 'realm',
  logs_version: 'logs', bots_version: 'bots', website_db_version: 'website', core_version: 'core' };
const BAT_DB_KEYS = { characters: 'characters', playerbot: 'playerbot', world: 'world', login: 'login', logsdb: 'logs' };

function parseLauncherBat() {
  const out = JSON.parse(JSON.stringify(FALLBACK));
  const txt = readText(path.join(ROOT, 'Launcher.bat'), '');
  if (!txt) return out;
  const m1 = txt.match(/^set repack_version=(.+?)\s*$/m);
  if (m1) out.repackVersion = m1[1];
  const m2 = txt.match(/^set \/a website_version=(\d+)/m);
  if (m2) out.websiteVersion = +m2[1];
  for (const exp of Object.keys(out.expansions)) {
    const start = txt.indexOf(`:setup_${exp}\r\n`) >= 0 ? txt.indexOf(`:setup_${exp}\r\n`) : txt.indexOf(`:setup_${exp}\n`);
    if (start < 0) continue;
    const end = txt.indexOf('goto settings', start);
    const block = txt.slice(start, end < 0 ? undefined : end);
    const e = out.expansions[exp];
    for (const [, key, val] of block.matchAll(/^set \/a (\w+)=(\d+)/gm)) {
      if (BAT_VERSION_KEYS[key]) e.versions[BAT_VERSION_KEYS[key]] = +val;
    }
    for (const [, key, val] of block.matchAll(/^set (\w+)=(\S+)\s*$/gm)) {
      if (BAT_DB_KEYS[key]) e.db[BAT_DB_KEYS[key]] = val;
      if (key === 'spp_update') e.sppUpdate = val;
    }
  }
  return out;
}

function merge(base, over) {
  if (!over || typeof over !== 'object') return base;
  const out = Array.isArray(base) ? base.slice() : { ...base };
  for (const [k, v] of Object.entries(over)) {
    out[k] = v && typeof v === 'object' && !Array.isArray(v) && base[k] && typeof base[k] === 'object' ? merge(base[k], v) : v;
  }
  return out;
}

// Change top-level keys of config.json, keeping everything else the user wrote there.
function saveUserConfig(changes) {
  let user = {};
  if (exists(CONFIG_FILE)) user = JSON.parse(fs.readFileSync(CONFIG_FILE, 'utf8'));
  Object.assign(user, changes);
  fs.writeFileSync(CONFIG_FILE, `${JSON.stringify(user, null, 2)}\n`);
}

function loadConfig() {
  let user = {};
  if (exists(CONFIG_FILE)) {
    try { user = JSON.parse(fs.readFileSync(CONFIG_FILE, 'utf8')); }
    catch (e) { throw new Error(`Cannot parse ${CONFIG_FILE}: ${e.message}`); }
  }
  const cfg = merge(DEFAULTS, user);
  const env = process.env;
  if (env.SPP_HOST) cfg.host = env.SPP_HOST;
  if (env.SPP_PORT) cfg.port = +env.SPP_PORT;
  if (env.SPP_PASSWORD) cfg.password = env.SPP_PASSWORD;

  const bat = parseLauncherBat();
  cfg.repackVersion = bat.repackVersion;
  cfg.websiteVersion = bat.websiteVersion;
  cfg.expansions = {};
  for (const [id, e] of Object.entries(bat.expansions)) cfg.expansions[id] = { id, ...META[id], ...e };

  const dbBundled = exists(rootPath('Server/Database/bin/mysqld.exe')) || exists(rootPath('Server/Database.7z'));
  cfg.database.managed = cfg.database.manage === 'auto' ? (IS_WIN && dbBundled) || !!cfg.database.startCommand : !!cfg.database.manage;
  const apacheBundled = exists(rootPath('Server/Tools/Apache24')) || exists(rootPath('Server/Tools/Apache.7z'));
  cfg.website.managed = cfg.website.manage === 'auto' ? IS_WIN && apacheBundled : !!cfg.website.manage;
  return cfg;
}

// All on-disk locations the launcher touches, mirroring Launcher.bat.
function makePaths(cfg) {
  const P = {
    root: ROOT,
    runtime: RUNTIME_DIR,
    versions: rootPath('Server/Versions'),
    modules: rootPath('Server/Modules'),
    legacyModules: rootPath('Modules'),
    tools: rootPath('Server/Tools'),
    music: rootPath('Server/Tools/music'),
    database: rootPath('Server/Database'),
    apache: rootPath('Server/Tools/Apache24'),
    website: rootPath('Server/website'),
    changelog: rootPath('Changelog'),
    addons: rootPath('Addons'),
    sql: exp => rootPath('Server/Sql', exp),
    settings: exp => rootPath('Settings', exp),
    saves: exp => rootPath('Saves', exp),
    // Windows binaries ship in Bin64/Bin64.7z, Linux ones in Linux64/Linux64.7z (built by GitHub Actions)
    bin: exp => (cfg.binaries && cfg.binaries[exp]) ? path.resolve(ROOT, cfg.binaries[exp]) : rootPath('Server/Binaries', exp, IS_WIN ? 'Bin64' : 'Linux64'),
    customBin: exp => !!(cfg.binaries && cfg.binaries[exp]),
    binArchive: exp => rootPath('Server/Binaries', exp, IS_WIN ? 'Bin64' : 'Linux64', IS_WIN ? 'Bin64.7z' : 'Linux64.7z'),
    mangosd: exp => path.join(P.bin(exp), 'mangosd' + EXE),
    realmd: exp => path.join(P.bin(exp), 'realmd' + EXE),
  };
  return P;
}

module.exports = { loadConfig, saveUserConfig, makePaths, CONFIG_FILE, RUNTIME_DIR, DEFAULTS };
