# Macaw0S Usability Status

## Kısa cevap

Macaw0S şu anda günlük ana bilgisayar olarak kullanılacak tam bir işletim sistemi değildir. Ancak artık kullanılabilirliğe giden somut bir iskelet içerir: FreeBSD profil dosyaları, masaüstü oturum dosyaları, TriCore politikası, DOS uyumluluk yapılandırması, post-install staging scripti ve doğrulama scriptleri.

## Şu anda hazır olanlar

- FreeBSD boot ve servis varsayılanları.
- FreeBSD paket listesi.
- Aviary Shell oturum, tema ve placeholder bileşenleri.
- Wayfire/Sway örnek oturum yapılandırmaları.
- DOSBox-X uyumluluk profili.
- TriCore Orchestrator manifest ve policy dosyaları.
- Post-install dosya staging akışı.

## Kullanılabilirlik için eksik kalan kritik işler

1. Gerçek FreeBSD release image üretim pipeline'ı.
2. Native `WingPanel`, `NestLauncher`, `PerchDock` uygulamaları.
3. Grafik installer veya bsdinstall otomasyon entegrasyonu.
4. Paket deposu ve imzalı release altyapısı.
5. Donanım test matrisi: Intel/AMD GPU, Wi-Fi, ses, suspend/resume.
