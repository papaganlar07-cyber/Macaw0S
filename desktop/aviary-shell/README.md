# Aviary Shell

Aviary Shell, Macaw0S için tasarlanan özgün masaüstü deneyimidir. Amaç macOS kopyası yapmak değil; kuş/kanat metaforundan gelen, koyu zümrüt tonları ve üretkenlik odaklı kendi kimliğine sahip bir arayüz oluşturmaktır.

## Tasarım ilkeleri

- **Özgün kimlik**: Menü, panel ve dock isimleri Apple/macOS terimlerini kullanmaz.
- **Odaklı çalışma**: Sanal çalışma alanları, hızlı komut paleti ve sade bildirimler.
- **BSD native**: FreeBSD paketleri, Wayland/Wayfire ve hafif yardımcı servisler.
- **Erişilebilirlik**: Yüksek kontrast, net renk hiyerarşisi ve klavye odaklı akış.

## Bileşenler

- `WingPanel`: üst bilgi/pencere ve sistem durum çubuğu
- `NestLauncher`: uygulama ve komut başlatıcı
- `PerchDock`: sık kullanılan uygulama şeridi; macOS Dock davranışını kopyalamaz
- `FlightSwitcher`: çalışma alanı ve pencere değiştirme ekranı
