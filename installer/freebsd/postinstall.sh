#!/usr/bin/env sh
set -eu

PREFIX="${1:-/}"
REPO_ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"

install_file() {
  src="$1"
  dst="$2"
  mode="${3:-0644}"
  install -Dm "$mode" "$src" "$PREFIX/$dst"
}

install_file "$REPO_ROOT/freebsd-profile/boot/loader.conf" "boot/loader.conf"
install_file "$REPO_ROOT/freebsd-profile/etc/rc.conf" "etc/rc.conf"
install_file "$REPO_ROOT/freebsd-profile/usr/local/etc/xdg/wayfire/wayfire.ini" "usr/local/etc/xdg/wayfire/wayfire.ini"
install_file "$REPO_ROOT/freebsd-profile/usr/local/etc/xdg/sway/config" "usr/local/etc/xdg/sway/config"
install_file "$REPO_ROOT/desktop/aviary-shell/config/aviary-session.conf" "usr/local/share/macaw0s/aviary-session.conf"
install_file "$REPO_ROOT/desktop/aviary-shell/themes/macaw-dark/colors.conf" "usr/local/share/macaw0s/themes/macaw-dark/colors.conf"
install_file "$REPO_ROOT/desktop/aviary-shell/themes/macaw-dark/style.css" "usr/local/share/macaw0s/themes/macaw-dark/style.css"
install_file "$REPO_ROOT/desktop/aviary-shell/bin/wing-panel" "usr/local/bin/wing-panel" 0755
install_file "$REPO_ROOT/desktop/aviary-shell/bin/nest-launcher" "usr/local/bin/nest-launcher" 0755
install_file "$REPO_ROOT/desktop/aviary-shell/bin/perch-dock" "usr/local/bin/perch-dock" 0755

printf '[Macaw0S] FreeBSD post-install files staged under %s\n' "$PREFIX"
