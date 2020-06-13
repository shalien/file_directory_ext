import 'dart:io';

/// Extends [Link] to add commonly needed properties
extension LinkIOExtension on Link {
  ///  Get the name of the [Link] including the extension
  String get name => path.split(Platform.pathSeparator)?.last;

  /// Get the name of the [Link] without the extension
  String get basename =>
      path.split(Platform.pathSeparator).last.split('.')?.first;

  /// Get the extension of the [Link]
  String get extension =>
      path.split(Platform.pathSeparator).last.split('.')?.last;
}
