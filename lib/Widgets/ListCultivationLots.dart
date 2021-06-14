import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ListCultivationLots extends StatefulWidget {
  @override
  _ListCultivationLotsState createState() => _ListCultivationLotsState();
}

class _ListCultivationLotsState extends State<ListCultivationLots> {
  Future<List<Directory>> listOfDirectories() async {
    List<Directory> files = [];
    final Directory? _appDocDir = await getExternalStorageDirectory();

    if (_appDocDir != null) {
      List<FileSystemEntity> entities = _appDocDir.listSync();
      for (FileSystemEntity entity in entities) {
        if (entity is Directory) {
          files.add(entity);
        }
      }
    }
    return files;
  }

  Future<int> deleteDirectory(Directory directory) async {
    try {
      await directory.delete(recursive: true);
    } catch (e) {
      print(e);
    }
    directoryList = await listOfDirectories();
    return 0;
  }

  List<Directory> directoryList = [];

  @override
  void initState() {
    super.initState();

    listOfDirectories().then((List<Directory> value) {
      setState(() {
        directoryList.clear();
        directoryList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: directoryList.length,
      itemBuilder: (context, i) {
        return Card(
          child: ListTile(
            onTap: () => Navigator.pop(context, directoryList[i].path),
            leading: Icon(
              Icons.folder,
              color: Colors.black54,
              size: 28.0,
            ),
            title: Text(
              basename(directoryList[i].path),
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                deleteDirectory(directoryList[i]).then((int i) {
                  setState(() {});
                });
              },
              icon: Icon(
                Icons.cancel,
                size: 28.0,
                color: Colors.red[400],
              ),
            ),
          ),
        );
      },
    );
  }
}
