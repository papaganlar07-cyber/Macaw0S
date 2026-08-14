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
install_file "$REPO_ROOT/desktop/aviary-shell/share/favorites.conf" "usr/local/share/macaw0s/favorites.conf"
install_file "$REPO_ROOT/desktop/aviary-shell/bin/wing-panel" "usr/local/bin/wing-panel" 0755
install_file "$REPO_ROOT/desktop/aviary-shell/bin/nest-launcher" "usr/local/bin/nest-launcher" 0755
install_file "$REPO_ROOT/desktop/aviary-shell/bin/perch-dock" "usr/local/bin/perch-dock" 0755
install_file "$REPO_ROOT/bin/macawctl" "usr/local/bin/macawctl" 0755
install_file "$REPO_ROOT/apps/aaa-music/bin/aaa-music" "usr/local/bin/aaa-music" 0755
install_file "$REPO_ROOT/apps/aaa-music/config/aaa-music.conf" "usr/local/share/macaw0s/aaa-music.conf"
install_file "$REPO_ROOT/apps/aaa-music/share/applications/aaa-music.desktop" "usr/local/share/applications/aaa-music.desktop"
install_file "$REPO_ROOT/apps/aviary-settings/bin/aviary-settings" "usr/local/bin/aviary-settings" 0755
install_file "$REPO_ROOT/apps/aviary-settings/share/applications/aviary-settings.desktop" "usr/local/share/applications/aviary-settings.desktop"
install_file "$REPO_ROOT/apps/quick-notes/bin/quick-notes" "usr/local/bin/quick-notes" 0755
install_file "$REPO_ROOT/apps/quick-notes/share/applications/quick-notes.desktop" "usr/local/share/applications/quick-notes.desktop"
if [ -x "$REPO_ROOT/build/wing-panel" ]; then
  install_file "$REPO_ROOT/build/wing-panel" "usr/local/bin/wing-panel" 0755
fi
if [ -x "$REPO_ROOT/build/macawctl" ]; then
  install_file "$REPO_ROOT/build/macawctl" "usr/local/bin/macawctl" 0755
fi

printf '[Macaw0S] FreeBSD post-install files staged under %s\n' "$PREFIX"
