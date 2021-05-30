import 'dart:io';
import 'dart:async';

// Path provider
import 'package:path_provider/path_provider.dart';

Future<String> setupFiles() async {
  //Get App Document Directory
  final Directory? _appDocDir = await getExternalStorageDirectory();
  //App Document Directory + folder name
  if (_appDocDir != null) {
    final Directory _appDocDirFolder = Directory('${_appDocDir.path}/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }

  return "Error: D1";
}
