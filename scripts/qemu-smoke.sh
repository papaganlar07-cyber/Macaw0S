#!/usr/bin/env bash
set -euo pipefail

QEMU_BIN="${QEMU:-qemu-system-i386}"
LOG="${1:-artifacts/qemu-serial.log}"
mkdir -p "$(dirname "$LOG")"

if [ ! -f kernel.elf ]; then
  make kernel
fi

"$QEMU_BIN" -kernel kernel.elf -m 128M -serial "file:$LOG" -display none -no-reboot -no-shutdown &
pid=$!
sleep 5
kill "$pid" >/dev/null 2>&1 || true
wait "$pid" >/dev/null 2>&1 || true

if ! grep -q 'ParrotOS Macaw0S kernel booted' "$LOG"; then
  echo "QEMU smoke string not found in $LOG"
  cat "$LOG" || true
  exit 1
fi

echo "[Macaw0S] QEMU smoke test passed."
