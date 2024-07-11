import 'dart:ffi' as ffi;
import 'dart:ffi';
import 'dart:ui';

import 'package:ffi/ffi.dart';

class ConstellationDartBindings {
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  ConstellationDartBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  ConstellationDartBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  late final _setWindowPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Uint8>)>>(
          '_constellation_set_window');
  late final _setWindow =
      _setWindowPtr.asFunction<void Function(ffi.Pointer<ffi.Uint8>)>();

  late final _setDisplayPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Uint8>)>>(
          '_constellation_set_display');
  late final _setDisplay =
      _setDisplayPtr.asFunction<void Function(ffi.Pointer<ffi.Uint8>)>();

  late final _mainPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function()>>('_constellation_start');
  late final _main = _mainPtr.asFunction<int Function()>();

  late final _createCursorPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Uint8>,
              ffi.Pointer<ffi.Uint8>)>>('_constellation_create_cursor');

  late final _createCursor = _createCursorPtr.asFunction<
      void Function(ffi.Pointer<ffi.Uint8>, ffi.Pointer<ffi.Uint8>)>();

  late final _setCursorPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Uint8>, ffi.Float,
              ffi.Float)>>('_constellation_set_cursor_position');
  late final _setCursor = _setCursorPtr
      .asFunction<void Function(ffi.Pointer<ffi.Uint8>, double, double)>();

  late final _setCursorColorPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Uint8>, ffi.Uint8, ffi.Uint8,
              ffi.Uint8, ffi.Uint8)>>('_constellation_set_cursor_color');

  late final _setCursorColor = _setCursorColorPtr
      .asFunction<void Function(ffi.Pointer<ffi.Uint8>, int, int, int, int)>();

  void setCursorPosition(
    String id,
    double x,
    double y,
  ) {
    var keyPtr = id.toNativeUtf8();
    _setCursor(
      keyPtr.cast(),
      x,
      y,
    );

    malloc.free(keyPtr);
  }

  void createCursor(String key, String displayName) {
    var keyPtr = key.toNativeUtf8();
    var namePtr = displayName.toNativeUtf8();

    _createCursor(keyPtr.cast(), namePtr.cast());

    malloc.free(keyPtr);
    malloc.free(namePtr);
  }

  void setCursorColor(String key, Color color) {
    var keyPtr = key.toNativeUtf8();

    _setCursorColor(
        keyPtr.cast(), color.red, color.green, color.blue, color.alpha);

    malloc.free(keyPtr);
  }

  void setWindow(String id) {
    var idPtr = id.toNativeUtf8();
    _setWindow(idPtr.cast());
    malloc.free(idPtr);
  }

  void setDisplay(String id) {
    var idPtr = id.toNativeUtf8();
    _setDisplay(idPtr.cast());
    malloc.free(idPtr);
  }

  int main() {
    return _main();
  }
}
