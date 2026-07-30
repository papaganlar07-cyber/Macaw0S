#!/usr/bin/env bash
set -euo pipefail

PROFILE="${1:-workstation}"
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ISO_PROFILE_DIR="$ROOT_DIR/iso-profile"
OUT_DIR="$ROOT_DIR/artifacts"
WORK_DIR="$ROOT_DIR/.mkarchiso-work"

if ! command -v mkarchiso >/dev/null 2>&1; then
  echo "mkarchiso bulunamadı. Kurulum: sudo pacman -S --needed archiso"
  exit 1
fi

if [ ! -f "$ROOT_DIR/profiles/$PROFILE/packages.txt" ]; then
  echo "Profil bulunamadı: $PROFILE"
  exit 1
fi

cp "$ROOT_DIR/profiles/$PROFILE/packages.txt" "$ISO_PROFILE_DIR/packages.x86_64"

ISO_LABEL="MACAW0S_$(echo "$PROFILE" | tr '[:lower:]' '[:upper:]')"

echo "[Macaw0S] ISO build başlıyor..."
mkarchiso -v -w "$WORK_DIR" -o "$OUT_DIR" "$ISO_PROFILE_DIR"

echo "[Macaw0S] ISO build tamamlandı. Çıktılar: $OUT_DIR"
ls -1 "$OUT_DIR"/*.iso 2>/dev/null || true
