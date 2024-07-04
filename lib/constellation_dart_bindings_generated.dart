import 'dart:ffi' as ffi;

class ConstellationDartBindings {
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  ConstellationDartBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  ConstellationDartBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  int sum(
    int a,
    int b,
  ) {
    return _sum(
      a,
      b,
    );
  }

  int main() {
    return _main();
  }

  late final _sumPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.Int, ffi.Int)>>(
          '_constellation_add');
  late final _sum = _sumPtr.asFunction<int Function(int, int)>();

  late final _mainPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function()>>('_constellation_main');
  late final _main = _mainPtr.asFunction<int Function()>();
}
