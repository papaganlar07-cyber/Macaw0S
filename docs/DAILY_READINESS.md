# Daily Readiness Gate

Bu dosya Macaw0S için günlük kullanım eşiğini tanımlar. Proje bu maddelerin hepsi tamamlanmadan günlük ana sistem olarak etiketlenmez.

## Zorunlu kapılar

- FreeBSD tabanlı gerçek boot/release image üretimi.
- Installer akışının gerçek disk hedefinde test edilmesi.
- Aviary Shell bileşenlerinin placeholder yerine gerçek UI sürecine dönüşmesi.
- Ağ, ses, ekran, uyku/uyanma ve dosya yöneticisi testlerinin en az bir VM ve bir fiziksel cihazda yapılması.
- AAA Music, Aviary Settings, Quick Notes ve macawctl için paketleme/kurulum doğrulaması.
- MS-DOS veya üçüncü taraf tescilli imajların repoya girmediğini doğrulayan release kontrolü.

## Durum çıktısı

`scripts/daily-readiness.sh`, yukarıdaki kapıların repo tarafında izlenebilir olanlarını kontrol eder ve eksikler varsa başarılı release durumuna geçmez.
