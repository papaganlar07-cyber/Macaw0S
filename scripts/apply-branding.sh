#!/usr/bin/env bash
set -euo pipefail

ASSET_SRC="${1:-branding/logo/macaw0s-logo.png}"
TARGET_DIR="${2:-/usr/share/pixmaps}"

if [ ! -f "$ASSET_SRC" ]; then
  echo "Logo bulunamadı: $ASSET_SRC"
  exit 1
fi

sudo install -Dm644 "$ASSET_SRC" "$TARGET_DIR/macaw0s-logo.png"
echo "Logo kopyalandı: $TARGET_DIR/macaw0s-logo.png"
