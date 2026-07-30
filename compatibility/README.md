# Macaw0S Compatibility Layer

Macaw0S artık FreeBSD kernelini birincil hedef olarak ele alır. Uyumluluk katmanı üç alanı kapsar:

1. **BSD Native**: FreeBSD kernel + FreeBSD userland üzerinde çalışan ana sistem.
2. **DOS Workloads**: Günlük/retro DOS işleri için DOSBox-X veya kullanıcı tarafından sağlanan yasal MS-DOS imajı.
3. **Heavy Workloads**: Ağır işler için FreeBSD jail, bhyve/QEMU sanallaştırma ve container araçları.

## Lisans sınırı

- FreeBSD tabanı BSD lisanslıdır ve kapalı kaynak ürün geliştirmeye izin verir.
- MS-DOS tescilli bir üründür; bu repo MS-DOS binary veya disk imajı dağıtmaz.
- Dağıtılabilir açık alternatif gerektiğinde FreeDOS veya DOSBox-X kullanılmalıdır.
