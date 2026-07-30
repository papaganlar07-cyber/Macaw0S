# Macaw0S ISO Üretimi

## Gereksinimler

```bash
sudo pacman -S --needed archiso
```

## ISO Build

```bash
./scripts/build-iso.sh workstation
```

Çıktı konumu:
- `artifacts/*.iso`

## İndirme Linki Nasıl Verilir?

Bu depo kendi içinde internet barındırma yapmaz. ISO dosyasını oluşturduktan sonra:
1. GitHub Release'e yükle
2. veya bir obje depolamaya (S3, Cloudflare R2 vb.) koy
3. oluşan URL'yi paylaş
