#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
missing=0

require_file() {
  if [ ! -e "$ROOT_DIR/$1" ]; then
    echo "missing: $1"
    missing=1
  fi
}

require_file "apps/aaa-music/bin/aaa-music"
require_file "apps/aviary-settings/bin/aviary-settings"
require_file "apps/quick-notes/bin/quick-notes"
require_file "bin/macawctl"
require_file "installer/freebsd/postinstall.sh"
require_file "docs/DAILY_READINESS.md"

if [ ! -d "$ROOT_DIR/.stage/macaw0s" ]; then
  echo "missing: .stage/macaw0s (run make stage-freebsd)"
  missing=1
fi

if [ "$missing" -eq 0 ]; then
  echo "[Macaw0S] Repo-level daily readiness checks are present. Hardware/boot gates still require manual validation."
else
  echo "[Macaw0S] Daily readiness gates are not complete."
  exit 1
fi
