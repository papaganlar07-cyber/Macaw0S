#!/usr/bin/env bash
# shellcheck disable=SC2034
iso_name="macawos_hypr_ultra"
iso_label="MACAW_HYPR"
iso_publisher="MacawOS Project <https://macawos.example.com>"
iso_application="MacawOS Hyprland Ultra Secure Workstation"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="macaw"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi-x64.grub.esp')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
["/etc/shadow"]="0:0:0400"
["/etc/gshadow"]="0:0:0400"
["/root"]="0:0:0750"
["/root/.gnupg"]="0:0:0700"
["/usr/local/bin/choose-mirror"]="0:0:0755"
["/usr/local/bin/Installation_guide"]="0:0:0755"
)
