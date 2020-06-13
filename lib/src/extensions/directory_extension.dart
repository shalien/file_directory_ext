import 'dart:io';

import 'file_extension.dart';

extension DirectoryExtension on Directory {
  /// Get the name of the [Directory]
  String get name => path.split(Platform.pathSeparator)?.last;

  /// Move a [Directory] into it's parent location by copying everything inside it
  Future<FileSystemEntity> moveToParent() async {
    if (parent.name == name) {
      Directory newDirectory;

      await list().forEach((element) async {
        switch (element.statSync().type) {
          case FileSystemEntityType.directory:
            newDirectory = await _copyDirectory(element, parent);

            break;
          case FileSystemEntityType.file:
          case FileSystemEntityType.link:
            await (element as File).rename(
                parent.path + Platform.pathSeparator + (element as File).name);
            break;
        }
      });

      await delete(recursive: true)
          .then((value) => null)
          .catchError((error) => {error.toString()});
      return newDirectory;
    } else {
      return rename(parent.path);
    }
  }

  /// Move a [Directory] into it's parent location by copying everything inside it
  FileSystemEntity moveToParentSync() {
    return renameSync(parent.path);
  }

  /// Helper method for copying a [Directory]
  Future<Directory> _copyDirectory(Directory current, Directory root) async {
    final newDirectory =
        await Directory(root.path + Platform.pathSeparator + current.name)
            .create();

    await current.list().forEach((element) async {
      switch (element.statSync().type) {
        case FileSystemEntityType.directory:
          await _copyDirectory(element, newDirectory);

          break;
        case FileSystemEntityType.file:
        case FileSystemEntityType.link:
          await (element as File).rename(
              root.path + Platform.pathSeparator + (element as File).name);
          break;
      }
    });
    return newDirectory;
  }
}
