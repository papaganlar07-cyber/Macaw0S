#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT
mkdir -p "$TMP_DIR/music" "$TMP_DIR/state"
printf 'fake audio\n' > "$TMP_DIR/music/song.mp3"

export HOME="$TMP_DIR"
export AAA_MUSIC_DIR="$TMP_DIR/music"
export AAA_MUSIC_PLAYLIST="$TMP_DIR/state/playlist.m3u"

status_output="$($ROOT_DIR/apps/aaa-music/bin/aaa-music status)"
[[ "$status_output" == *'AAA Music status'* ]] || { echo "AAA Music status invalid"; exit 1; }

$ROOT_DIR/apps/aaa-music/bin/aaa-music scan "$TMP_DIR/music" >/dev/null
playlist_output="$($ROOT_DIR/apps/aaa-music/bin/aaa-music list)"
[[ "$playlist_output" == *song.mp3* ]] || { echo "AAA Music playlist missing song"; exit 1; }

echo "[Macaw0S] AAA Music smoke tests passed."
