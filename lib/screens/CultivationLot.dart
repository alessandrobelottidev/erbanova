import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/widgets/ListCultivationLots.dart';

// Utilities
import 'package:erbanova/utilities/CreateFolder.dart';

class CultivationLot extends StatefulWidget {
  final basePath;
  const CultivationLot({@required this.basePath});

  @override
  _CultivationLotState createState() => _CultivationLotState();
}

class _CultivationLotState extends State<CultivationLot> {
  Future<void> _inputLot() async {
    var folderName = 'LO-';

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aggiungi lotto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  controller: TextEditingController(text: folderName),
                  decoration: inputDecoration('Nome lotto'),
                  onChanged: (value) => folderName = value,
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Annulla',
                style: TextStyle(
                  color: Colors.green[700],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Crea',
                style: TextStyle(
                  color: Colors.green[700],
                ),
              ),
              onPressed: () {
                createFolder(folderName);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      labelStyle: new TextStyle(color: Colors.black87),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green[700]!),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green[700]!),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green[700]!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cambia lotto di coltivazione',
          style: const TextStyle(
            fontSize: 22,
            fontFamily: 'Overlock',
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, widget.basePath),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _inputLot().then((value) => Navigator.pop(context, widget.basePath));
        },
        child: Icon(
          Icons.add_outlined,
          size: 30.0,
        ),
      ),
      body: Container(
        color: Colors.lightGreen[200],
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, top: 24.0, right: 10.0, bottom: 0.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 128.0,
                child: ListCultivationLots(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
