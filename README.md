# Macaw0S

Macaw0S, Arch Linux tabanlı, modern, profesyonel bir dağıtım **oluşturma iskeleti**dir.
Bu depo doğrudan sıfırdan çekirdek yazmaz; bunun yerine üretim kalitesinde bir Linux dağıtımı inşa etmek için otomasyon, marka, paket profili ve sürümleme altyapısı sunar.

## Özellikler

- Arch tabanlı paket yönetimi (`pacman` + `paru`)
- Otomatik kurulum akışı (UEFI + Btrfs + snapshot düzeni)
- GNOME/KDE/Hyprland profilleri
- Güvenlik sertleştirme profilleri (firewall, fail2ban, auditd)
- Geliştirici araç profili (Docker, Podman, k8s araçları)
- Medya/profesyonel üretkenlik profili
- Kurumsal ayarlar şablonu (SSH hardening, policy kit varsayılanları)
- Markalama ve tema altyapısı (logo, boot splash, GRUB)

## Hızlı Başlangıç

> Dikkat: Bu scriptler **gerçek sistemde root yetkisi** gerektirir.

```bash
chmod +x scripts/*.sh
./scripts/bootstrap-dev-env.sh
./scripts/build-profile.sh workstation
```

## Dizin Yapısı

- `profiles/`: Kurulum profilleri ve paket listeleri
- `branding/`: Logo, splash ve tema varlıkları
- `scripts/`: Kurulum ve yapı otomasyon scriptleri
- `docs/`: Mimari, yol haritası, güvenlik ve sürüm planı

## Yol Haritası

Ayrıntılar için: `docs/ROADMAP.md`

