# DOS Compatibility

Macaw0S, DOS uyumluluğu için iki mod önerir:

## 1. Redistributable Mode

Varsayılan ve CI/CD için güvenli moddur. `dosbox-x` kullanır; tescilli MS-DOS dosyası içermez.

## 2. User-Supplied MS-DOS Mode

Kullanıcı kendi lisanslı MS-DOS disk imajını sağlar. Önerilen konum:

```text
/opt/macaw0s/dos/msdos.img
```

Bu repo bu imajı üretmez, indirmez veya dağıtmaz.
