# GitHub Actions + mkarchiso (GRUB + Syslinux)

Bu profil **systemd-boot kullanmaz**. Sadece şu boot modları kullanılır:
- `bios.syslinux.mbr`
- `uefi-x64.grub.esp`

## Zorunlu dosya ağacı

```text
iso-profile/
├── airootfs/
│   └── etc/
├── grub/
│   └── grub.cfg
├── syslinux/
│   └── syslinux.cfg
├── packages.x86_64
├── pacman.conf
└── profiledef.sh
```

## Runner tarafı

Arch tabanlı runner/container içinde:

```bash
pacman -Syu --noconfirm archiso
mkarchiso -v -w .mkarchiso-work -o artifacts iso-profile
```
