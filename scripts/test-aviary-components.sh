#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
export MACAW0S_FAVORITES="$ROOT_DIR/desktop/aviary-shell/share/favorites.conf"

wing_output="$($ROOT_DIR/desktop/aviary-shell/bin/wing-panel --once)"
[[ "$wing_output" == Macaw0S\ WingPanel* ]] || { echo "WingPanel output invalid"; exit 1; }

launcher_output="$($ROOT_DIR/desktop/aviary-shell/bin/nest-launcher --list)"
[[ "$launcher_output" == *Terminal* ]] || { echo "NestLauncher favorites missing Terminal"; exit 1; }

dock_output="$($ROOT_DIR/desktop/aviary-shell/bin/perch-dock --once)"
[[ "$dock_output" == *'[Terminal]'* ]] || { echo "PerchDock render missing Terminal"; exit 1; }

echo "[Macaw0S] Aviary component smoke tests passed."
