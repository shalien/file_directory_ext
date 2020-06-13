import 'dart:html';

/// Extends [File] to add commonly needed properties
extension FileHTMLExtension on File {
  /// Get the name of the [File] without the extension
  String get basename => name;

  /// Get the extension of the [File]
  String get extension => relativePath.split('/').last.split('.').last;
}
