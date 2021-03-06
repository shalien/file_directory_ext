/// Contains extensions for [File] [Directory] and [FileSystemEntity]
library file_directory_ext;

export 'src/extensions/file_system_entity_extension.dart';
export 'src/extensions/directory_extension.dart';

export 'src/extensions/link_io_extension.dart';

export 'src/extensions/file_none_extension.dart'
    if (dart.library.io) 'src/extensions/file_io_extension.dart'
    if (dart.library.html) 'src/extensions/file_html_extension.dart';
