# Macaw0S FreeBSD Pivot Planı

Macaw0S, Arch Linux tabanlı ISO denemesinden FreeBSD kernel odaklı bir tasarıma geçer.

## Neden FreeBSD?

- BSD lisansı kapalı kaynak ürün geliştirmeye izin verir.
- FreeBSD kernel, userland ve ports/pkg ekosistemi tek parça işletim sistemi deneyimi sağlar.
- Jail, ZFS, bhyve ve güçlü ağ yığını profesyonel işler için uygundur.

## Kernel stratejisi

1. **Base Kernel**: FreeBSD GENERIC veya MINIMAL tabanlı ana kernel.
2. **Macaw Kernel Layer**: Macaw0S’e özel sysctl, modül ve sürücü ayarları.
3. **Heavy Work Mode**: Jail/bhyve/QEMU ile izole ağır iş çalıştırma.
4. **DOS Assist Mode**: DOSBox-X veya kullanıcı lisanslı MS-DOS imajı ile DOS uyumluluğu.

## Kapalı kaynak politikası

FreeBSD kodu BSD lisansı gerekliliklerine uyularak kullanılabilir. Macaw0S’e özel kapalı kaynak bileşenler ayrı lisans altında tutulabilir. Büyük ticari dağıtım veya üçüncü taraf lisanslı bileşen kullanımı için ayrıca izin ve lisans incelemesi gerekir.
