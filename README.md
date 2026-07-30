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



## TriCore Orchestrator

Macaw0S artık üçlü güç modeliyle tasarlanır: FreeBSD Core ana sistem, NetBSD Utility Core taşınabilir/az kaynaklı görevler, DOS Personality Core ise legacy DOS işleri için kullanılır. Bu yapı tek bir karışık kernel değil; işleri doğru çalışma katmanına yönlendiren güvenli bir orkestrasyon modelidir.

- TriCore detayları: `docs/TRICORE_ORCHESTRATOR.md`
- Kernel manifestleri: `kernels/`
- Orkestrasyon politikası: `orchestrator/tricore-policy.toml`

## Masaüstü deneyimi

Macaw0S'in özgün masaüstü deneyimi **Aviary Shell** olarak adlandırılır. Wayfire/Sway tabanlıdır, `WingPanel`, `NestLauncher`, `PerchDock` ve `FlightSwitcher` bileşenleriyle Mac kopyası olmayan, kendine has zümrüt-grafit görsel dil kullanır.

- Masaüstü belgesi: `docs/DESKTOP_EXPERIENCE.md`
- Tema ve oturum dosyaları: `desktop/aviary-shell/`
- FreeBSD XDG örnekleri: `freebsd-profile/usr/local/etc/xdg/`


## Kullanılabilirlik durumu

Macaw0S henüz günlük ana sistem olarak bitmiş değildir; ama artık FreeBSD profil, Aviary Shell placeholder bileşenleri, post-install staging ve doğrulama scriptleriyle gerçek kullanılabilirliğe yaklaşan test edilebilir bir temel sunar. Detay: `docs/USABILITY_STATUS.md`.





## Aviary Settings

Aviary Settings, tema ve favori yönetimi için eklenen hafif ayar aracıdır. İlk sürüm CLI tabanlıdır ve ileride grafik ayarlar merkezinin temelini oluşturur. Detay: `docs/AVIARY_SETTINGS.md`.

## AAA Music

Macaw0S artık günlük kullanım için hafif bir müzik uygulaması içerir: `apps/aaa-music/bin/aaa-music`. Müzik klasörünü tarar, playlist oluşturur ve `mpv` ile çalar. Detay: `docs/AAA_MUSIC.md`.

## macawctl kontrol aracı

`bin/macawctl`, TriCore yönlendirmesini, Aviary favorilerini ve sistem durumunu kontrol etmek için eklenen hafif CLI aracıdır. Detay: `docs/MACAWCTL.md`.

## Geliştirme komutları

- `make validate`: tüm repo smoke checklerini çalıştırır.
- `make stage-freebsd`: FreeBSD post-install ve Aviary Shell dosyalarını `.stage/macaw0s/` altına toplar.
- `make clean`: geçici build/stage dosyalarını temizler.

Detay: `docs/DEVELOPMENT_WORKFLOW.md` ve `docs/RELEASE_CHECKLIST.md`.

## Doğrulama

```bash
./scripts/validate-compatibility.sh
```

## Detaylar

- FreeBSD geçiş planı: `docs/FREEBSD_PIVOT.md`
- Uyumluluk katmanı: `compatibility/README.md`
