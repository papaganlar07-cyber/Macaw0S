#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

wing_output="$($ROOT_DIR/build/wing-panel --once)"
[[ "$wing_output" == Macaw0S\ WingPanel* ]] || { echo "native WingPanel output invalid"; exit 1; }

status_output="$($ROOT_DIR/build/macawctl status)"
[[ "$status_output" == *'native: c'* ]] || { echo "native macawctl status invalid"; exit 1; }

route_output="$($ROOT_DIR/build/macawctl route legacy-dos-apps)"
[[ "$route_output" == 'dos-personality-core' ]] || { echo "native macawctl route invalid"; exit 1; }

echo "[Macaw0S] Native C component smoke tests passed."
