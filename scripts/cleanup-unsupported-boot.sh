#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
EFIBOOT_DIR="$ROOT_DIR/iso-profile/efiboot"

if [ -d "$EFIBOOT_DIR" ]; then
  rm -rf "$EFIBOOT_DIR"
  echo "[Macaw0S] Kaldırıldı: $EFIBOOT_DIR"
else
  echo "[Macaw0S] efiboot dizini zaten yok."
fi
