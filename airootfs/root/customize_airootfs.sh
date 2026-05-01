#!/usr/bin/env bash
set -e
systemctl enable ufw
ufw default deny incoming
ufw default allow outgoing
ufw --force enable
systemctl disable bluetooth.service || true
systemctl disable cups.service || true
systemctl disable avahi-daemon.service || true
echo 'vm.swappiness=10' > /etc/sysctl.d/99-macaw.conf
