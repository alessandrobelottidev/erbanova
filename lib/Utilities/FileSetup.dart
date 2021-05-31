import 'dart:io';
import 'dart:async';

// Path provider
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<String> firstLot() async {
  //Get App Document Directory
  final Directory? _appDocDir = await getExternalStorageDirectory();
  //App Document Directory + folder name
  if (_appDocDir != null) {
    List<FileSystemEntity> entities = _appDocDir.listSync();

    for (FileSystemEntity entity in entities) {
      if (entity is Directory) {
        return basename(entity.path);
      }
    }
  }

  return "Error: D1";
}

Future<String> firstLotPath() async {
  //Get App Document Directory
  final Directory? _appDocDir = await getExternalStorageDirectory();
  //App Document Directory + folder name
  if (_appDocDir != null) {
    List<FileSystemEntity> entities = _appDocDir.listSync();

    for (FileSystemEntity entity in entities) {
      if (entity is Directory) {
        return entity.path;
      }
    }
  }

  return "Error: D1";
}
