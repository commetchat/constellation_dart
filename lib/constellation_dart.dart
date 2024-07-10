// You have generated a new plugin project without specifying the `--platforms`
// flag. An FFI plugin project that supports no platforms is generated.
// To add platforms, run `flutter create -t plugin_ffi --platforms <platforms> .`
// in this directory. You can also find a detailed instruction on how to
// add platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

import 'constellation_dart_bindings_generated.dart';

void setCursorPosition(String id, double x, double y) =>
    _bindings.setCursorPosition(id, x, y);

void setCursorColor(String id, Color color) =>
    _bindings.setCursorColor(id, color);

void setWindow(int id) => _bindings.setWindow(id);

void createCursor(String key, String displayName) =>
    _bindings.createCursor(key, displayName);

int main() => _bindings.main();

const String _libName = 'constellation';

/// The dynamic library in which the symbols for [ConstellationDartBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final ConstellationDartBindings _bindings = ConstellationDartBindings(_dylib);
