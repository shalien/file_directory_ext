import 'dart:io';

/// Extends [File] to add commonly needed properties
extension FileExtension on File {
  ///  Get the name of the [File] including the extension
  String get name => path.split(Platform.pathSeparator)?.last;

  /// Get the name of the [File] without the extension
  String get basename =>
      path.split(Platform.pathSeparator).last.split('.')?.first;

  /// Get the extension of the [File]
  String get extension =>
      path.split(Platform.pathSeparator).last.split('.')?.last;
}
