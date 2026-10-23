#!/bin/sh
# SPP Classics web launcher (admin panel) for Linux.
# Needs Node.js 18+, 7-Zip (p7zip), a MySQL/MariaDB server and client tools,
# and Linux builds of mangosd/realmd. See WebLauncher/README.md.
cd "$(dirname "$0")" || exit 1

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js 18 or newer is required (for example: sudo apt install nodejs)." >&2
  exit 1
fi
major=$(node -p 'process.versions.node.split(".")[0]')
if [ "$major" -lt 18 ]; then
  echo "Node.js 18 or newer is required, found $(node --version)." >&2
  exit 1
fi

exec node WebLauncher/server.js "$@"
