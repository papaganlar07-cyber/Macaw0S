#!/usr/bin/env bash
set -euo pipefail

QEMU_BIN="${QEMU:-qemu-system-i386}"
KERNEL="${1:-kernel.elf}"

if [ ! -f "$KERNEL" ]; then
  echo "Kernel not found: $KERNEL"
  echo "Run: make kernel"
  exit 1
fi

exec "$QEMU_BIN" -kernel "$KERNEL" -m 128M -serial stdio
