import 'dart:io';

import 'package:file_directory_ext/file_directory_ext.dart';

import 'package:test/test.dart';

void main() {
  Directory tempChild;
  Directory tempRoot;
  File tempFile;

  setUp(() async {
    final name = 'FDE_${DateTime.now().millisecondsSinceEpoch.toString()}';
    tempRoot = await Directory.systemTemp.createTemp('FDE_');
    tempChild =
        Directory('${tempRoot.path}${Platform.pathSeparator}${tempRoot.name}');

    await tempChild.create();

    tempFile = File('${tempChild.path}${Platform.pathSeparator}${name}');
    await tempFile.writeAsString('test');
    await tempChild.moveToParent();
  });

  test('Move a folder and it\'s content into his parent with the same name',
      () async {
    expect(true,
        tempRoot.listSync().length == 1 && tempRoot.listSync().first is File);
  });

  tearDown(() {
    //tempRoot.deleteSync(recursive: true);
  });
}
