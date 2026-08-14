# Native Code Plan

GitHub dil istatistiklerinde projenin tamamen shell görünmesi doğru bir uyarıdır. Macaw0S gerçek işletim sistemi hedefine giderken yalnızca shell scriptlerden oluşmamalıdır.

## Bu adımda yapılan değişiklik

- `src/aviary/wing-panel.c`: WingPanel için C tabanlı native prototip.
- `src/macawctl/macawctl.c`: TriCore route/status komutları için C tabanlı native prototip.
- `make native`: C binarylerini `build/` altında derler.
- `make test-native`: derlenen native binaryleri smoke test eder.

## Dürüst durum

Bu repo tek başına bitmiş ve doğrudan günlük ana sistem olarak kurulacak bir OS değildir. Günlük kullanım etiketi için `docs/DAILY_READINESS.md` kapıları tamamlanmalıdır. Bu değişiklik shell ağırlığını azaltır ve gerçek native bileşen yönünü başlatır.
