#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

required_files=(
  "kernels/README.md"
  "kernels/freebsd/manifest.toml"
  "kernels/netbsd/manifest.toml"
  "kernels/dos-personality/manifest.toml"
  "orchestrator/tricore-policy.toml"
  "docs/TRICORE_ORCHESTRATOR.md"
)

for file in "${required_files[@]}"; do
  if [ ! -f "$ROOT_DIR/$file" ]; then
    echo "Eksik TriCore dosyası: $file"
    exit 1
  fi
done

if find "$ROOT_DIR/kernels" -type f \( -iname '*.img' -o -iname '*.iso' -o -iname '*.bin' -o -iname '*.rom' \) | grep -q .; then
  echo "Kernel/DOS binary veya disk imajı repoda tutulmamalı."
  exit 1
fi

echo "[Macaw0S] TriCore Orchestrator yapısı geçerli."
