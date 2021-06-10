import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:intl/intl.dart';

class PdfApi {
  static String pdfName(String path) {
    final Directory _dir = Directory(path);
    var day = 0;

    List<FileSystemEntity> entities = _dir.listSync();

    for (FileSystemEntity entity in entities) {
      if (entity is File) {
        if (basename(entity.path).length >= 10) {
          final int fileDay = int.parse(basename(entity.path).substring(7, 10));
          if (fileDay > day) day = fileDay;
        }
      }
    }

    return 'Giorno ' + (day + 1).toString().padLeft(3, '0');
  }

  static Future<File> generateFormGermination(
      {required String path,
      required String lot,
      required File image,
      required List<String> params}) async {
    final pdf = Document();
    final String title = pdfName(path);
    DateTime now = new DateTime.now();
    String date = DateFormat('dd-MM-yyyy').format(now);

    final _image = MemoryImage(image.readAsBytesSync());

    pdf.addPage(MultiPage(
        build: (context) => [
              Center(
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Lotto: ' + lot),
                        Expanded(
                            child:
                                Center(child: Text(title + ' - Germinazione'))),
                        Text('Data: ' + date),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text('Valori ambientali',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Temperatura: ' + params[0]),
                    Text('Umidità: ' + params[1]),
                    SizedBox(height: 15),
                    Text('Valori Acqua',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('PH: ' + params[2]),
                    Text('EC: ' + params[3]),
                    Text('TDS: ' + params[4]),
                    Text('Temp. Acqua' + params[5]),
                    SizedBox(height: 15),
                    Text('Controllo radici',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Radici Visibili sul fondo: ' + params[6]),
                    Text('Segni di danni alle radici: ' + params[7]),
                    SizedBox(height: 15),
                    Text('Controlli Pianta',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Seme Germogliato: ' + params[8]),
                    Text('Problemi di Germogliazione: ' + params[9]),
                    Text('Segni di Muffa: ' + params[10]),
                    Text('Clorosi e altri Problemi Fogliari: ' + params[11]),
                    SizedBox(height: 15),
                    Text('Altri problemi',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(params[12]),
                  ],
                )),
              ),
              Image(_image),
            ]));

    return saveDocument(path: path, name: '$title - $date.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String path,
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final file = File('$path/$name');

    await file.writeAsBytes(bytes);

    return file;
  }
}
