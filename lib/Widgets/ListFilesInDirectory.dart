import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class ListFilesInDirectory extends StatefulWidget {
  final String basePath;
  final String directory;
  const ListFilesInDirectory({required this.basePath, required this.directory});

  @override
  _ListFilesInDirectoryState createState() => _ListFilesInDirectoryState();
}

class _ListFilesInDirectoryState extends State<ListFilesInDirectory> {
  Future<List<File>> listOfFiles() async {
    var files = [File("text.txt")];

    final Directory? _appDocDir =
        Directory('${widget.basePath}/${widget.directory}');

    if (_appDocDir != null) {
      List<FileSystemEntity> entities = _appDocDir.listSync();

      files.clear();

      for (FileSystemEntity entity in entities) {
        if (entity is File) {
          files.add(entity);
        }
      }
    }
    return files;
  }

  var fileList = [File("")];

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
            onTap: () {
              OpenFile.open(fileList[i].path, type: "application/pdf");
            },
            title: Text(
              basename(fileList[i].path),
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            trailing: Icon(
              Icons.picture_as_pdf,
              color: Colors.black87,
              size: 28.0,
            ),
          ),
        );
      },
    );
  }
}
