# TriCore Orchestrator

Macaw0S için yeni hedef, üç ayrı yeteneği tek ürün deneyiminde yönetebilen **TriCore Orchestrator** modelidir.

## Üçlü güç modeli

| Core | Amaç | Neden seçildi? |
| --- | --- | --- |
| FreeBSD Core | Ana masaüstü, ZFS, jail, bhyve, ağ | BSD lisansı ve güçlü production özellikleri |
| NetBSD Utility Core | Taşınabilir/az kaynaklı servisler | BSD tarzı lisans, sade ve taşınabilir tasarım |
| DOS Personality Core | Legacy DOS uygulamaları | DOSBox-X veya kullanıcı lisanslı MS-DOS imajı |

## Önemli gerçeklik notu

Macaw0S aynı anda üç kerneli tek çekirdek gibi birleştirmez. Bunun yerine işleri uygun çekirdeğe veya kişilik katmanına yönlendiren bir orkestrasyon modeli kullanır. Bu daha güvenli, lisans açısından daha temiz ve uygulanabilir bir mimaridir.

## Kapalı kaynak uyumluluğu

FreeBSD ve NetBSD tarafı BSD tarzı lisans ailesine dayanır. Macaw0S özel bileşenleri kapalı kaynak tutulabilir. DOS tarafında MS-DOS imajı repoya konmaz; kullanıcı kendi lisanslı medyasını sağlar.

## Yaratıcı özellikler

- **Flight Mode Routing**: Uygulama türüne göre FreeBSD, NetBSD veya DOS kişiliğine yönlendirme.
- **Nest Capsules**: Ağır işlerin jail/bhyve/QEMU içinde izole çalışması.
- **Feather Profiles**: Pil, performans ve sessiz çalışma profilleri.
- **Legacy Nest**: DOS uygulamalarını modern masaüstünde kontrollü çalıştırma.
- **Aviary Guardrails**: Lisanslı olmayan DOS imajlarını ve bilinmeyen kernel bloblarını repodan uzak tutma.
