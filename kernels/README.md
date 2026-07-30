# Macaw0S TriCore Kernel Strategy

Macaw0S tek bir monolitik "üç kernel aynı anda" sistemi değildir. Güvenli ve gerçekçi model **TriCore Orchestrator** yaklaşımıdır:

1. **FreeBSD Core**: Günlük kullanım, ZFS, jail, ağ ve ana masaüstü.
2. **NetBSD Utility Core**: Taşınabilirlik, düşük kaynaklı hedefler ve deneysel servis profilleri.
3. **DOS Personality Core**: DOS uygulamaları için DOSBox-X veya kullanıcının kendi lisanslı MS-DOS imajı.

Bu model kapalı kaynak ürün geliştirmeye zorunlu açık kaynak koşulu getirmeyen BSD tarzı kernel ekosistemini temel alır. DOS tarafında tescilli dosya dağıtılmaz.
