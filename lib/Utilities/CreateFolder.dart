import 'dart:io';

// Path provider
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void createFolder(String fileName) async {
  final Directory? _baseDir = await getExternalStorageDirectory();

  if (_baseDir != null) {
    List<FileSystemEntity> entities = _baseDir.listSync();

    bool seen = false;

    for (FileSystemEntity entity in entities) {
      if (entity is Directory) {
        if (basename(entity.path) == fileName) {
          seen = true;
          break;
        }
      }
    }

    if (!seen) {
      Directory('${_baseDir.path}/$fileName/').create(recursive: true);
      Directory('${_baseDir.path}/$fileName/Report Germinazione')
          .create(recursive: true);
      Directory('${_baseDir.path}/$fileName/Report Vegetativa')
          .create(recursive: true);
      Directory('${_baseDir.path}/$fileName/Report Fine Raccolto')
          .create(recursive: true);
      Directory('${_baseDir.path}/$fileName/Report Essicatura')
          .create(recursive: true);
      Directory('${_baseDir.path}/$fileName/Report Fioritura')
          .create(recursive: true);
    }
  }
}
