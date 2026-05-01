#!/usr/bin/env bash

iso_name="macaw0s"
iso_label="MACAW0S"
iso_publisher="Macaw0S <https://macaw0s.local>"
iso_application="Macaw0S Live ISO"
iso_version="0.3.0"
install_dir="arch"
arch="x86_64"

# Only GRUB(UEFI) + Syslinux(BIOS)
bootmodes=(
  'bios.syslinux.mbr'
  'uefi-x64.grub.esp'
)

buildmodes=('iso')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)
