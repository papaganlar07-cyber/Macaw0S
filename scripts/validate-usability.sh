#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

required_executables=(
  "desktop/aviary-shell/bin/wing-panel"
  "desktop/aviary-shell/bin/nest-launcher"
  "desktop/aviary-shell/bin/perch-dock"
  "installer/freebsd/postinstall.sh"
  "apps/aaa-music/bin/aaa-music"
  "apps/aviary-settings/bin/aviary-settings"
  "apps/quick-notes/bin/quick-notes"
)

required_files=(
  "installer/freebsd/install.conf"
  "docs/USABILITY_STATUS.md"
  "freebsd-profile/packages.txt"
  "desktop/aviary-shell/share/favorites.conf"
  "apps/aaa-music/config/aaa-music.conf"
  "apps/aaa-music/share/applications/aaa-music.desktop"
  "docs/AAA_MUSIC.md"
  "apps/aviary-settings/share/applications/aviary-settings.desktop"
  "docs/AVIARY_SETTINGS.md"
  "apps/quick-notes/share/applications/quick-notes.desktop"
  "docs/QUICK_NOTES.md"
  "docs/DAILY_READINESS.md"
)

for file in "${required_files[@]}"; do
  test -f "$ROOT_DIR/$file" || { echo "Eksik kullanılabilirlik dosyası: $file"; exit 1; }
done

for file in "${required_executables[@]}"; do
  test -x "$ROOT_DIR/$file" || { echo "Çalıştırılabilir değil: $file"; exit 1; }
done

echo "[Macaw0S] Kullanılabilirlik iskeleti geçerli."
