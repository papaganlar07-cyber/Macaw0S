# AAA Music

AAA Music, Macaw0S için eklenen hafif müzik uygulamasıdır. İlk sürüm CLI/TUI odaklıdır ve `mpv` ile müzik çalar. Amaç günlük kullanım için temel müzik tarama, listeleme ve oynatma akışını hemen kullanılabilir hale getirmektir.

## Kullanım

```bash
aaa-music scan ~/Music
aaa-music list
aaa-music play
aaa-music play "parça adı"
aaa-music status
```

## Desteklenen formatlar

- MP3
- FLAC
- OGG
- WAV
- M4A

## Masaüstü entegrasyonu

`aaa-music.desktop`, Aviary Shell ve diğer XDG uyumlu menülerde AAA Music uygulamasını göstermek için staging/install akışına eklenir.
