#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

export HOME="$TMP_DIR"
export AVIARY_CONFIG_DIR="$TMP_DIR/.config/macaw0s"
export MACAW0S_FAVORITES="$TMP_DIR/.config/macaw0s/favorites.conf"

$ROOT_DIR/apps/aviary-settings/bin/aviary-settings init >/dev/null
[[ "$($ROOT_DIR/apps/aviary-settings/bin/aviary-settings get theme)" == 'macaw-dark' ]] || { echo "default theme invalid"; exit 1; }
$ROOT_DIR/apps/aviary-settings/bin/aviary-settings set theme macaw-test
[[ "$($ROOT_DIR/apps/aviary-settings/bin/aviary-settings get theme)" == 'macaw-test' ]] || { echo "theme set invalid"; exit 1; }
$ROOT_DIR/apps/aviary-settings/bin/aviary-settings favorites add Music 'aaa-music play'
favorites="$($ROOT_DIR/apps/aviary-settings/bin/aviary-settings favorites list)"
[[ "$favorites" == *Music* ]] || { echo "favorite add invalid"; exit 1; }

echo "[Macaw0S] Aviary Settings smoke tests passed."
