# SPP Classics Web Launcher

A browser based admin panel that does everything `Launcher.bat` does, on Windows and Linux.
It is styled after the repack's website (the classic World of Warcraft site theme) and
switches artwork with the selected expansion.

`Launcher.bat` keeps working. Both launchers read and write the same state files in
`Server/Versions`, so you can switch between them, just don't run both at once.

## Starting it

| Platform | Command |
| --- | --- |
| Windows 10/11 | double-click **`Launcher-Web.bat`** |
| Linux | `./launcher-web.sh` |
| Any | `node WebLauncher/server.js` |

The panel opens at **http://127.0.0.1:8090**. Log in with **admin** / **admin** the first time;
you are asked to choose a new password (Launcher > Launcher Settings). Keep the launcher window open while you play:
it owns the server processes. Use **Shutdown Repack** in the panel to stop everything.

`Launcher-Web.bat` uses Node.js from your PATH, or downloads a portable Node.js (about
30 MB) into `Server/Tools/node` on first start. Windows 7/8 users should keep using
`Launcher.bat`.

## What's in the panel

| Launcher.bat menu | Web panel |
| --- | --- |
| Expansion selection, website/music toggles | **Choose Expansion** |
| Start / Stop server, Restarter mode (T), Open website (M) | **Overview**, with a live server console you can type commands into |
| Help (create account, set GM) | **Accounts**: create accounts, set GM levels, list accounts |
| Server Settings (configs, address, realm name, logs, crash logs) | **Server Settings**, **Logs & Crashes** (configs are edited in the browser, a `.bak` copy is kept) |
| Saves Menu (9 slots, old/transfer saves, autosaves, autosave toggles) | **Saves** |
| Reset RandomBots (R) | **Random Bots** |
| Wipe Database (6), Modify DB (D) | **Wipe & Modify DB** |
| Install Translations (7) | **Translations** |
| Beta Build (8) | **Beta Build** (Windows) |
| Service Menu, Changelog, SPP Extras (E) | **Service**, **Changelog** |
| - | **Maintenance**: scheduled restarts and updates (see below) |
| - | **Launcher Settings**: admin username and password |
| - | **Server Settings > HermesProxy**: start HermesProxy with the server for modern Classic clients |

Install and update steps (maps download, world/characters/accounts/logs/bots/website
database updates, core extraction) run in the same order as in `Launcher.bat`, and the
target versions are read from `Launcher.bat` itself, so updating the version numbers there
updates both launchers.

## Scheduled maintenance

On the **Maintenance** page you can add any number of schedules: daily, weekly (pick the day)
or monthly (pick the day of the month, or "last day"), at a time of day in the server
computer's clock. Each schedule does one of two things:

- **Restart**: sends `.server restart N` to the world server, waits until mangosd has exited,
  then starts it again.
- **Update & restart**: sends `.server shutdown N`, waits until mangosd has exited, stops the
  realm server, installs updates and starts both again. Updates are the same checks as when
  you choose an expansion (databases, maps, core binaries). Optionally it first runs
  `git pull` to fetch the latest repack files like Server_Update.bat, updates the website files
  and downloads the latest Beta Build.

`N` is the warning time: players see the in-game countdown. If autosave is on, an autosave is
made while the server is down. If an update fails the server is still started again and the
failure shows in the history, with the full log. The launcher has to be running for a schedule
to fire; a slot missed by more than 30 minutes is recorded as "missed" instead of running late.
"Run once now" does the same without a schedule.

## HermesProxy (modern Classic clients)

[HermesProxy](https://github.com/WowLegacyCore/HermesProxy) lets the 1.14.x (Classic Era) and
2.5.x (TBC Classic) game clients play on the Vanilla and TBC servers. It does not support WotLK.

HermesProxy lives in `Server/Tools/HermesProxy` (or set `hermes.dir` in the config): `HermesProxy.exe`
for Windows and `HermesProxy` for Linux, sharing one `HermesProxy.config`, the `CSV` folder and the
`AccountData` folder (per-account client data, not tracked by git). In **Server Settings** you choose, per expansion:

- whether HermesProxy starts together with the server (it also stops with it, restarts after maintenance and, with **Restarter mode** on, is started again if it crashes; after 5 crashes in 10 minutes the Restarter gives up),
- which executable to use,
- the game client version (`ClientBuild`); only builds of the matching expansion are offered, read from the HermesProxy source when present,
- the external address clients connect to.

`ServerBuild` is set automatically (5875 for Vanilla, 8606 for TBC). Saving, and every start, writes
`ClientBuild`, `ServerBuild`, `ServerAddress`, `ServerPort` and `ExternalAddress` into the
`HermesProxy.config` next to the executable; other settings are left alone and can be edited from the
same page. HermesProxy's output is in the **HermesProxy** console tab.

## Linux

Tested on Ubuntu 26.04 (WSL2) with Vanilla: database install, server start/stop, console,
accounts, saves/autosaves, scheduled maintenance (restart, update & restart, git pull) and
HermesProxy.

The server binaries come from `Server/Binaries/<expansion>/Linux64/Linux64.7z`, built by the
**Linux Binaries** GitHub workflow (see *Releasing an update* below). The launcher extracts and
updates them like `Bin64.7z` on Windows. You can also build CMaNGOS yourself (step 3).

**1. Packages**

```sh
sudo apt install nodejs 7zip mariadb-server mariadb-client git build-essential cmake   libboost-dev libboost-program-options-dev libboost-thread-dev libboost-regex-dev   libboost-serialization-dev libboost-filesystem-dev libboost-system-dev   libmariadb-dev libmariadb-dev-compat libssl-dev zlib1g-dev libbz2-dev libicu-dev
```

(`libicu-dev` is only needed for HermesProxy. Older Ubuntu releases call 7-Zip `p7zip-full`.)

**2. MariaDB**, set up like the bundled Windows MySQL so the repack's configs work unchanged
(port 3310, root / 123456, no strict SQL mode):

```sh
sudo tee /etc/mysql/mariadb.conf.d/99-spp.cnf <<'EOF2'
[mysqld]
port = 3310
bind-address = 127.0.0.1
sql_mode = ""
explicit_defaults_for_timestamp = 1
max_allowed_packet = 256M
innodb_buffer_pool_size = 512M
EOF2
sudo systemctl restart mariadb
sudo mariadb -e "ALTER USER root@localhost IDENTIFIED VIA unix_socket OR mysql_native_password USING PASSWORD('123456');
  CREATE USER IF NOT EXISTS root@'127.0.0.1' IDENTIFIED BY '123456';
  GRANT ALL PRIVILEGES ON *.* TO root@'127.0.0.1' WITH GRANT OPTION; FLUSH PRIVILEGES;"
```

To use other credentials, change `database` in `WebLauncher/config.json` and the `*DatabaseInfo`
lines in `Settings/<expansion>/mangosd.conf` and `realmd.conf`.

**3. Optional: build mangosd and realmd yourself** (only needed without `Linux64.7z`, or for
your own changes; Vanilla shown, use `mangos-tbc` / `mangos-wotlk` for the others). About 10 minutes on 12 cores:

```sh
git clone --branch ike3-bots https://github.com/celguar/mangos-classic.git
cd mangos-classic
# Boost 1.87+ removed io_service (Ubuntu 25.04+ ship newer Boost)
sed -i 's/io_service svc;/io_context svc;/' src/mangosd/Master.cpp
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=$HOME/cmangos-vanilla   -DBUILD_PLAYERBOTS=ON -DBUILD_AHBOT=ON -DBUILD_MODULES=ON   -DBUILD_MODULE_ACHIEVEMENTS=ON -DBUILD_MODULE_DUALSPEC=ON -DBUILD_MODULE_HARDCORE=ON   -DBUILD_MODULE_IMMERSIVE=ON -DBUILD_MODULE_TRANSMOG=ON -DBUILD_MODULE_BOOST=ON   -DBUILD_MODULE_BARBER=ON -DBUILD_MODULE_TRAININGDUMMIES=ON
make -j$(nproc) && make install
```

Then point the launcher at the binaries in `WebLauncher/config.json`:

```json
{ "binaries": { "vanilla": "/home/you/cmangos-vanilla/bin" } }
```

Use the repack's configs in
`Settings/<expansion>`, not the `.conf.dist` files from the build. Linux builds read their
configs from `../etc/`; the launcher handles this by pointing `Settings/etc` at the running
expansion's folder.

**Server binary safety check.** The launcher refuses to start a server binary that is older
than the databases, because Launcher.bat's `core_version` and the database versions are updated
together. It knows a binary's version from `build_info.txt` (shipped in `Linux64.7z`), from the
`Bin64.7z` it extracted (Windows), or, for your own builds, from the version current when the launcher
first saw that exact file; rebuilding counts as up to date. When it blocks, the Overview page explains why
and offers **Start anyway** for a binary you know is current. Scheduled maintenance leaves the server
stopped in that case and records why in its history.

**4. Start** with `./launcher-web.sh` and open http://127.0.0.1:8090. Choosing an expansion
downloads its game data (maps, vmaps, mmaps, dbc) and installs the databases like on Windows.
Game data from a Windows install can be copied to `Server/Modules/<expansion>` to skip the download.

**Website:** the bundled Apache is Windows only. To host the website, serve `Server/website` with
your own web server and PHP; the launcher still installs and updates its database tables.

**WSL:** use WSL2 (`wsl --set-version Ubuntu 2`). WSL1 cannot run current Ubuntu releases.
Ports opened inside WSL2 are reachable from Windows on 127.0.0.1.

## Releasing an update (maintainers)

1. Update the Windows binaries (`Server/Binaries/<exp>/Bin64/Bin64.7z`), SQL files and the version
   numbers in `Launcher.bat` as before.
2. Run **Actions > Linux Binaries > Run workflow** on the same branch. It builds the same CMaNGOS
   branch on Ubuntu 22.04 (runs on Ubuntu 22.04+ / Debian 12+), bundles `libmariadb`, writes
   `build_info.txt` with the `core_version` from `Launcher.bat` and the CMaNGOS commit, and commits
   `Server/Binaries/<exp>/Linux64/Linux64.7z`. Debug symbols are attached to the run as artifacts.
   Use the `core_ref` input to build the exact commit the Windows binaries came from.
3. Linux installs pick the new binaries up on their next update (Maintenance > Update & restart
   with git pull, or Server_Update + choosing the expansion).

If step 2 is skipped, Linux servers stop at the safety check instead of running an outdated binary.

## Configuration

Copy `config.example.json` to `config.json` and change what you need. Every key is optional.

| Key | Default | Meaning |
| --- | --- | --- |
| `host`, `port` | `127.0.0.1`, `8090` | Where the panel listens |
| `allowedHosts` | `[]` | Extra host names the panel answers to (IP addresses, `localhost` and this computer's name always work) |
| `database.*` | bundled MySQL settings | Connection used by the launcher. `manage: "auto"` runs the bundled MySQL on Windows; on Linux set `startCommand`/`stopCommand` (e.g. `systemctl start mariadb`) if you want the launcher to start it |
| `website.manage` | `auto` | Run the bundled Apache on Windows |
| `website.url` | empty | Link shown for the website (default `http://<this host>/`) |
| `binaries.<expansion>` | empty | Folder with your own `mangosd`/`realmd` build (default `Server/Binaries/<expansion>/Bin64` on Windows, `Linux64` on Linux) |
| `sevenZip` | empty | Path to a 7-Zip executable |
| `shutdownTimeoutSec` | `120` | How long to wait for a clean server shutdown before killing it |
| `autosaveIntervalMin` | `15` | Interval for "autosave while running" |
| `maxAutosaves` | `100` | Older autosaves are deleted |

Environment variables `SPP_HOST` and `SPP_PORT` override the file.
Pass `--no-browser` to skip opening a browser.

### Login and remote access

The panel always asks for a login. Credentials are stored hashed in
`WebLauncher/runtime/auth.json`; delete that file (with the launcher stopped) to reset to
admin / admin. While the default password is in use, logins are only accepted from the
server computer itself.

To manage the server from another device set `"host": "0.0.0.0"` and restart the launcher.

## How it works

`server.js` is a dependency-free Node.js server. It starts `mangosd`, `realmd`, MySQL and
Apache as child processes, keeps `mangosd`'s stdin open for console commands, and streams
console output, task progress and status changes to the browser with Server-Sent Events.
Long operations (installs, wipes, saves) run one at a time as tasks with a live log.
