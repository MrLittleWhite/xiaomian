import 'dart:io';
import 'package:path_provider/path_provider.dart';

class XMDirectory {
  static Future<Directory> get documents {
    return getApplicationDocumentsDirectory();
  }

  static Future<String> createIfPathNotExists(String path) {
    return createIfDirectoryNotExists(Directory(path)).then((value) => value.path);
  }
  
  static Future<Directory> createIfDirectoryNotExists(Directory directory) {
    return directory.exists().then((value) {
      return value ? Future.value(directory) : directory.create(recursive: true).then((value) => directory);
    });
  }
}