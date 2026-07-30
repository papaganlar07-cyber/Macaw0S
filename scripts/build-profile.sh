#!/usr/bin/env bash
set -euo pipefail

PROFILE="${1:-workstation}"
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PROFILE_DIR="$ROOT_DIR/profiles/$PROFILE"

if [ ! -d "$PROFILE_DIR" ]; then
  echo "Geçersiz profil: $PROFILE"
  echo "Mevcut profiller:"
  ls -1 "$ROOT_DIR/profiles"
  exit 1
fi

echo "[Macaw0S] Profil hazırlanıyor: $PROFILE"
cp "$PROFILE_DIR/packages.txt" "$ROOT_DIR/.build-${PROFILE}-packages.txt"
cp "$PROFILE_DIR/services.txt" "$ROOT_DIR/.build-${PROFILE}-services.txt"
echo "[Macaw0S] Çıktılar üretildi:"
echo "  - .build-${PROFILE}-packages.txt"
echo "  - .build-${PROFILE}-services.txt"
