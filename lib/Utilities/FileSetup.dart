import 'dart:io';
import 'dart:async';

// Path provider
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<String> firstLotName() async {
  //Get External Storage Directory
  final Directory? _appDocDir = await getExternalStorageDirectory();

  if (_appDocDir != null) {
    List<FileSystemEntity> entities = _appDocDir.listSync();

    bool seen = false;

    for (FileSystemEntity entity in entities) {
      if (entity is Directory) {
        if (basename(entity.path) == 'LO-BASE') {
          return basename(entity.path);
        }
      }
    }

    if (!seen) {
      Directory('${_appDocDir.path}/LO-BASE/').create(recursive: true);
      Directory('${_appDocDir.path}/LO-BASE/Report Germinazione')
          .create(recursive: true);
      Directory('${_appDocDir.path}/LO-BASE/Report Vegetativa')
          .create(recursive: true);
      Directory('${_appDocDir.path}/LO-BASE/Report Fine Raccolto')
          .create(recursive: true);
      Directory('${_appDocDir.path}/LO-BASE/Report Essicatura')
          .create(recursive: true);
      Directory('${_appDocDir.path}/LO-BASE/Report Fioritura')
          .create(recursive: true);
      return 'LO-BASE';
    }
  }

  return 'Error: D1';
}

Future<String> firstLotPath() async {
  //Get External Storage Directory
  final Directory? _appDocDir = await getExternalStorageDirectory();

  if (_appDocDir != null) {
    List<FileSystemEntity> entities = _appDocDir.listSync();

    bool seen = false;

    for (FileSystemEntity entity in entities) {
      if (entity is Directory) {
        if (basename(entity.path) == 'LO-BASE') {
          return entity.path;
        }
      }
    }

    if (!seen) {
      Directory('${_appDocDir.path}/LO-BASE/').create(recursive: true);
      Directory('${_appDocDir.path}/LO-BASE/Report Germinazione')
          .create(recursive: true);
      Directory('${_appDocDir.path}/LO-BASE/Report Vegetativa')
          .create(recursive: true);
      Directory('${_appDocDir.path}/LO-BASE/Report Fine Raccolto')
          .create(recursive: true);
      Directory('${_appDocDir.path}/LO-BASE/Report Essicatura')
          .create(recursive: true);
      Directory('${_appDocDir.path}/LO-BASE/Report Fioritura')
          .create(recursive: true);
      return '${_appDocDir.path}/LO-BASE/';
    }
  }

  return 'Error: D1';
}
