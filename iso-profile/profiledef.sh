#!/usr/bin/env bash

iso_name="macaw0s"
iso_label="MACAW0S_$(date +%Y%m)"
iso_publisher="Macaw0S <https://macaw0s.local>"
iso_application="Macaw0S Live/Rescue ISO"
iso_version="0.2.0"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'uefi-ia32.grub.esp' 'uefi-x64.grub.esp' 'uefi-x64.systemd-boot.esp')
arch='x86_64'
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
