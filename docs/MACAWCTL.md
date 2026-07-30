# macawctl

`macawctl` Macaw0S için küçük bir kontrol aracıdır. Şimdilik shell tabanlıdır; amaç geliştiricinin TriCore yönlendirmesini, Aviary favorilerini ve proje durumunu hızlı kontrol etmesidir.

## Komutlar

```bash
./bin/macawctl status
./bin/macawctl cores
./bin/macawctl route daily-desktop
./bin/macawctl route legacy-dos-apps
./bin/macawctl favorites
```

## İş yükü yönlendirme

- `daily-desktop` -> `freebsd-core`
- `network-storage` -> `freebsd-core`
- `portable-low-resource` -> `netbsd-utility-core`
- `legacy-dos-apps` -> `dos-personality-core`
- `heavy-workloads` -> `freebsd-core:bhyve,qemu,jail`
