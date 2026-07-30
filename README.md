# Macaw0S

Macaw0S, FreeBSD kernelini birincil hedef alan, profesyonel ve kapalı kaynak ürün geliştirmeye uygun şekilde tasarlanan bir işletim sistemi projesidir.

## Yeni yön

- Birincil kernel hedefi: **FreeBSD**
- Lisans hedefi: BSD lisans ekosistemiyle uyumlu, kapalı kaynak bileşenlere izin veren ürün mimarisi
- Uyumluluk: FreeBSD native paketler, jail/bhyve/QEMU ve DOSBox-X tabanlı DOS modu
- MS-DOS: Sadece kullanıcı tarafından sağlanan lisanslı imajla; repo içinde MS-DOS binary/imaj dağıtılmaz

## Ana dizinler

- `freebsd-profile/`: FreeBSD boot, servis ve paket varsayılanları
- `compatibility/`: BSD native, DOS ve ağır iş uyumluluk planı
- `iso-profile/`: Önceki ArchISO denemeleri için korunmuş profil
- `scripts/`: Build, doğrulama ve yardımcı scriptler
- `docs/`: Mimari, yol haritası ve FreeBSD geçiş planı

## Doğrulama

```bash
./scripts/validate-compatibility.sh
```

## Detaylar

- FreeBSD geçiş planı: `docs/FREEBSD_PIVOT.md`
- Uyumluluk katmanı: `compatibility/README.md`
