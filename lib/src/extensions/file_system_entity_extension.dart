import 'dart:io';

extension FileSystemEntityExtension on FileSystemEntity {
  ///  Get the name of the [FileSystemEntity]
  String get name => path.split(Platform.pathSeparator)?.last;

  /// Get the name of the [FileSystemEntity]
  String get basename =>
      path.split(Platform.pathSeparator).last.split('.')?.first;

  /// Move a [FileSystemEntity] into it's parent location
  Future<FileSystemEntity> moveToParent() {
    return rename(parent.path + Platform.pathSeparator + name);
  }

  /// Move a [FileSystemEntity] into it's parent location
  FileSystemEntity moveToParentSync() {
    return renameSync(parent.path + Platform.pathSeparator + name);
  }
}
