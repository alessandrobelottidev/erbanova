import 'dart:io';
import 'package:path/path.dart';
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

  static Future<File> generateFormVegetative(
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
                                Center(child: Text(title + ' - Vegetativa'))),
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
                    Text('Temp. Acqua: ' + params[5]),
                    Text('Livello Acqua regolare: ' + params[6]),
                    Text('Dosaggio Fertilizzante regolare: ' + params[7]),
                    SizedBox(height: 15),
                    Text('Controllo radici',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Crescita regolare delle radici: ' + params[8]),
                    Text('Segni di danni alle radici: ' + params[9]),
                    SizedBox(height: 15),
                    Text('Controllo illuminazione',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Ore di Luce/Buio Rispettate: ' + params[10]),
                    SizedBox(height: 15),
                    Text('Controlli Pianta',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Segni di Muffa: ' + params[14]),
                    Text('Clorosi e altri Problemi Fogliari: ' + params[12]),
                    Text('SCROG e topping regolari: ' + params[11]),
                    Text('Procedere alla Fioritura? ' + params[13]),
                    SizedBox(height: 15),
                    Text('Altri problemi',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(params[15]),
                  ],
                )),
              ),
              Image(_image),
            ]));

    return saveDocument(path: path, name: '$title - $date.pdf', pdf: pdf);
  }

  static Future<File> generateFormBlossom(
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
                            child: Center(child: Text(title + ' - Fioritura'))),
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
                    Text('Temp. Acqua: ' + params[5]),
                    Text('Livello Acqua regolare: ' + params[6]),
                    Text('Dosaggio Fertilizzante regolare: ' + params[7]),
                    SizedBox(height: 15),
                    Text('Controllo radici',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Crescita regolare delle radici: ' + params[8]),
                    Text('Segni di danni alle radici: ' + params[9]),
                    SizedBox(height: 15),
                    Text('Controllo illuminazione',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Ore di Luce/Buio Rispettate: ' + params[10]),
                    SizedBox(height: 15),
                    Text('Controlli Pianta',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Segni di Muffa: ' + params[14]),
                    Text('Clorosi e altri Problemi Fogliari: ' + params[12]),
                    Text('SCROG e topping regolari: ' + params[11]),
                    Text('Procedere alla Fioritura? ' + params[13]),
                    SizedBox(height: 15),
                    Text('Altri problemi',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(params[15]),
                    Text('Presenza di Fiori: ' + params[16]),
                    Text('Presenza di piante Maschili: ' + params[17]),
                    Text('Segni di Ermafroditismo: ' + params[18]),
                    SizedBox(height: 15),
                    Text('Se in fase avanzata di Fioritura',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Presenza di Pistilli ingialliti: ${params[19]}'),
                    Text(
                        'Presenza di Tricomi Ambrati (con microscopio tascabile): ${params[20]}'),
                    Text('Presenza di Pistilli ingialliti: ${params[21]}'),
                    Text(
                        'Presenza di Tricomi Ambrati (con microscopio tascabile): ${params[22]}'),
                    Text('Totale grammi raccolti: ${params[23]}')
                  ],
                )),
              ),
              Image(_image),
            ]));

    return saveDocument(path: path, name: '$title - $date.pdf', pdf: pdf);
  }

  /*
  _temperature,
  _humidity,
  checkRadio(_signsOfMold),
  checkRadio(_airRecycling),
  _flowerState,
  _branchesDryness,
  checkRadio(_completeDrying)
  */

  static Future<File> generateFormDrying(
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
                                Center(child: Text(title + ' - Essicatura'))),
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
                    Text('Controlli di routine',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Segni di Muffa: ${params[2]}'),
                    Text('Ricircolo di aria rispettato: ${params[3]}'),
                    Text('Stato del Fiore: ${params[4]}'),
                    Text('Controllo secchezza rami: ${params[5]}'),
                    Text('Essiccatura completa? ${params[6]}'),
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
