#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

required_files=(
  "freebsd-profile/boot/loader.conf"
  "freebsd-profile/etc/rc.conf"
  "freebsd-profile/packages.txt"
  "compatibility/README.md"
  "compatibility/dos/README.md"
  "compatibility/dos/dosbox-x.conf"
  "compatibility/bsd/README.md"
)

for file in "${required_files[@]}"; do
  if [ ! -f "$ROOT_DIR/$file" ]; then
    echo "Eksik dosya: $file"
    exit 1
  fi
done

if find "$ROOT_DIR" -path '*/compatibility/dos/*' -type f \( -iname '*.img' -o -iname '*.iso' -o -iname '*.bin' \) | grep -q .; then
  echo "Tescilli DOS imajı repoya eklenmemeli. Lütfen dışarıda tutun."
  exit 1
fi

echo "[Macaw0S] FreeBSD/DOS uyumluluk yapısı geçerli."
