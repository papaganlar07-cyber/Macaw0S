#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT
export HOME="$TMP_DIR"
export MACAW0S_NOTES_DIR="$TMP_DIR/Notes/Macaw0S"

note="$($ROOT_DIR/apps/quick-notes/bin/quick-notes new 'Test Note')"
[[ -f "$note" ]] || { echo "note was not created"; exit 1; }
list="$($ROOT_DIR/apps/quick-notes/bin/quick-notes list)"
[[ "$list" == *Test* || "$list" == *test-note* ]] || { echo "note not listed"; exit 1; }
content="$($ROOT_DIR/apps/quick-notes/bin/quick-notes show "$(basename "$note")")"
[[ "$content" == *'# Test Note'* ]] || { echo "note content invalid"; exit 1; }

echo "[Macaw0S] Quick Notes smoke tests passed."
