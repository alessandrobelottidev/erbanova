import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generateCenteredText(String path, String text) async {
    final pdf = Document();

    pdf.addPage(Page(
      build: (context) => Center(
        child: Text(text, style: TextStyle(fontSize: 18)),
      ),
    ));

    return saveDocument(path: path, name: 'test.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String path,
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('$path/$name');

    await file.writeAsBytes(bytes);

    return file;
  }
}
