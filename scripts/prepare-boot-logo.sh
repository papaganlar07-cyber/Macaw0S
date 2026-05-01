#!/usr/bin/env bash
set -e
mkdir -p branding/assets
cat <<'EOF'
Macaw0S boot logo source should be placed here as: branding/assets/macaw-boot.ico
Detected uploaded file format in chat: ICO 256x140 RGBA.
Use this asset for GRUB, Plymouth or systemd-boot splash.
EOF
