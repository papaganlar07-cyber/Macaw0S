#!/usr/bin/env bash
set -euo pipefail

echo "[Macaw0S] Geliştirme bağımlılıkları kontrol ediliyor..."

REQUIRED=(git bash curl rsync tar xz)
MISSING=()
for dep in "${REQUIRED[@]}"; do
  command -v "$dep" >/dev/null 2>&1 || MISSING+=("$dep")
done

if [ ${#MISSING[@]} -gt 0 ]; then
  echo "Eksik bağımlılıklar: ${MISSING[*]}"
  echo "Arch üzerinde kurulum: sudo pacman -S --needed ${MISSING[*]}"
  exit 1
fi

echo "[Macaw0S] Tamamlandı."
