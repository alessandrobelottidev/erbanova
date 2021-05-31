import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class ListFilesInDirectory extends StatefulWidget {
  final String basePath;
  final String directory;
  const ListFilesInDirectory({required this.basePath, required this.directory});

  @override
  _ListFilesInDirectoryState createState() => _ListFilesInDirectoryState();
}

class _ListFilesInDirectoryState extends State<ListFilesInDirectory> {
  Future<List<File>> listOfFiles() async {
    List<File> files = [];
    final Directory? _appDocDir =
        Directory('${widget.basePath}/${widget.directory}');

    if (_appDocDir != null) {
      List<FileSystemEntity> entities = _appDocDir.listSync();
      for (FileSystemEntity entity in entities) {
        if (entity is File) {
          files.add(entity);
        }
      }
    }
    return files;
  }

  Future<int> deleteFile(File file) async {
    try {
      await file.delete();
    } catch (e) {
      print(e);
    }
    return 0;
  }

  List<File> fileList = [];

  @override
  void initState() {
    super.initState();

    listOfFiles().then((List<File> value) {
      setState(() {
        fileList.clear();
        fileList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fileList.length,
      itemBuilder: (context, i) {
        return Card(
          child: ListTile(
            onTap: () =>
                OpenFile.open(fileList[i].path, type: "application/pdf"),
            leading: Icon(
              Icons.picture_as_pdf,
              color: Colors.black87,
              size: 28.0,
            ),
            title: Text(
              basename(fileList[i].path),
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            trailing: IconButton(
              onPressed: () async {
                await deleteFile(fileList[i]);
                fileList = await listOfFiles();
                setState(() {});
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
