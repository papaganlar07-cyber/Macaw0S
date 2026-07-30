# Macaw0S Mimari Tasarım

## Katmanlar

1. **Base Layer**: Arch temel paketleri, çekirdek ve firmware
2. **System Layer**: Servisler, ağ, ses, dosya sistemi politikaları
3. **Experience Layer**: Masaüstü ortamı, tema, marka
4. **Ops Layer**: Güncelleme, snapshot, rollback, telemetri (opsiyonel)

## Dosya Sistemi Önerisi

- UEFI + GPT
- Btrfs subvolume düzeni: `@`, `@home`, `@var`, `@snapshots`
- Snapper + grub-btrfs rollback desteği

## Güncelleme Stratejisi

- `testing` kanalında 7 gün soak test
- `stable` kanalında imzalı paket yayınlama
- Rollback için son 3 snapshot garantisi
