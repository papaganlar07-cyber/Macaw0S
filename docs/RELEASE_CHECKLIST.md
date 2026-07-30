# Macaw0S Release Checklist

## Kod ve dosya düzeni

- [ ] `make validate` başarılı.
- [ ] `make stage-freebsd` başarılı.
- [ ] Tescilli MS-DOS imajı, ROM, kernel blob veya lisanssız binary yok.
- [ ] Aviary Shell assetleri stage root altında kuruluyor.

## Lisans

- [ ] FreeBSD/NetBSD BSD lisans gereklilikleri gözden geçirildi.
- [ ] Üçüncü taraf paketlerin lisansları release notlarına eklendi.
- [ ] MS-DOS kullanıcı tarafından sağlanıyor; repoda dağıtılmıyor.

## Ürün kalitesi

- [ ] En az bir VM boot testi yapıldı.
- [ ] Ağ, ses, ekran, suspend/resume manuel kontrol edildi.
- [ ] Installer veya post-install logları arşivlendi.
