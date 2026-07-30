# Macaw0S Development Workflow

## Hızlı doğrulama

```bash
make validate
```

Bu komut uyumluluk, TriCore ve kullanılabilirlik kontrollerini çalıştırır.

## FreeBSD dosya ağacını stage etme

```bash
make stage-freebsd
```

Varsayılan çıktı:

```text
.stage/macaw0s/
```

Bu hedef post-install dosyalarını ve Aviary Shell assetlerini geçici bir root altında toplar.

## Temizlik

```bash
make clean
```

## CI

GitHub Actions, pull request ve push olaylarında `make validate` ve `make stage-freebsd` çalıştırır.
