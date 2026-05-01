# Macaw0S

Macaw0S, Arch Linux tabanlı, modern, profesyonel bir dağıtım oluşturma projesidir.
Bu repo artık sadece iskelet değil, **ISO build pipeline** da içerir.

## Öne Çıkanlar

- Profil tabanlı paket/servis sistemi (`workstation`, `professional`, `security`)
- ArchISO ile gerçek `.iso` üretimi
- Markalama (logo) uygulama scripti
- Kurumsal ve güvenlik odaklı mimari dokümantasyonu

## Hızlı Başlangıç

```bash
chmod +x scripts/*.sh
./scripts/bootstrap-dev-env.sh
./scripts/build-profile.sh workstation
./scripts/build-iso.sh workstation
```

ISO çıktısı `artifacts/` altına düşer.

Detaylar:
- Mimari: `docs/ARCHITECTURE.md`
- Yol haritası: `docs/ROADMAP.md`
- ISO build: `docs/BUILD_ISO.md`
