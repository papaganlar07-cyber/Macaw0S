#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

status_output="$($ROOT_DIR/bin/macawctl status)"
[[ "$status_output" == *'Macaw0S status'* ]] || { echo "status output invalid"; exit 1; }

[[ "$($ROOT_DIR/bin/macawctl route daily-desktop)" == 'freebsd-core' ]] || { echo "daily route invalid"; exit 1; }
[[ "$($ROOT_DIR/bin/macawctl route portable-low-resource)" == 'netbsd-utility-core' ]] || { echo "portable route invalid"; exit 1; }
[[ "$($ROOT_DIR/bin/macawctl route legacy-dos-apps)" == 'dos-personality-core' ]] || { echo "DOS route invalid"; exit 1; }

favorites_output="$($ROOT_DIR/bin/macawctl favorites)"
[[ "$favorites_output" == *Terminal* ]] || { echo "favorites output invalid"; exit 1; }

echo "[Macaw0S] macawctl smoke tests passed."
