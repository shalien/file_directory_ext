import 'dart:io';

// Must be imported to allow the use of the extended properties
import 'package:file_directory_ext/file_directory_ext.dart';

void main() {
  final tempDirectory = Directory.systemTemp.createTempSync();

  // You can also use tempDirectory.basename
  print(tempDirectory.name);

  /*
  Since we also extends [FileSystemEntity] every [Directory] [Link] and [File]
  can use the .name and .basename getter

  But only a [File] or a [Link] can use the .extension getter
   */

  // Create a [File] with the system folder
  final tempFile = File(
      '${tempDirectory.path}${Platform.pathSeparator}${DateTime.now().millisecondsSinceEpoch.toString()}.tmp');

  // Display the [File] name and extension
  print(tempFile.name);
  print(tempFile.basename);
  print(tempFile.extension);

  // Same for a [Link]
  final tempLink = Link('${tempDirectory}');
  tempLink.createSync('${tempDirectory}${Platform.pathSeparator}tempLink');

  print(tempLink.name);
  print(tempLink.basename);
  print(tempLink.extension);
}
