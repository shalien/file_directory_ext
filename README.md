A simple library that extend the Directory and File classes to add easy access to name and extensions
## Usage

A simple usage example:

```dart
import 'package:file_directory_ext/file_directory_ext.dart';

final myFile = File('./folder/myFile.ext');

print(myFile.name); // myFile.ext
print(myFile.extension); //ext

```
