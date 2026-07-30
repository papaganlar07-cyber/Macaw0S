#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PREFIX="${1:-/usr/local}"

install -Dm644 "$ROOT_DIR/desktop/aviary-shell/config/aviary-session.conf" "$PREFIX/share/macaw0s/aviary-session.conf"
install -Dm644 "$ROOT_DIR/desktop/aviary-shell/themes/macaw-dark/colors.conf" "$PREFIX/share/macaw0s/themes/macaw-dark/colors.conf"
install -Dm644 "$ROOT_DIR/desktop/aviary-shell/themes/macaw-dark/style.css" "$PREFIX/share/macaw0s/themes/macaw-dark/style.css"
install -Dm644 "$ROOT_DIR/desktop/aviary-shell/share/favorites.conf" "$PREFIX/share/macaw0s/favorites.conf"
install -Dm644 "$ROOT_DIR/freebsd-profile/usr/local/etc/xdg/wayfire/wayfire.ini" "$PREFIX/etc/xdg/wayfire/wayfire.ini"
install -Dm644 "$ROOT_DIR/freebsd-profile/usr/local/etc/xdg/sway/config" "$PREFIX/etc/xdg/sway/config"
install -Dm755 "$ROOT_DIR/desktop/aviary-shell/bin/wing-panel" "$PREFIX/bin/wing-panel"
install -Dm755 "$ROOT_DIR/desktop/aviary-shell/bin/nest-launcher" "$PREFIX/bin/nest-launcher"
install -Dm755 "$ROOT_DIR/desktop/aviary-shell/bin/perch-dock" "$PREFIX/bin/perch-dock"
install -Dm755 "$ROOT_DIR/bin/macawctl" "$PREFIX/bin/macawctl"

echo "[Macaw0S] Aviary Shell dosyaları kuruldu: $PREFIX"
