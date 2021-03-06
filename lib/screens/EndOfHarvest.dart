import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/widgets/AppBar.dart';
import 'package:erbanova/widgets/ListFilesInDirectory.dart';

// Screens
import 'package:erbanova/screens/forms/FormEndOfHarvest.dart';

class EndOfHarvest extends StatefulWidget {
  final basePath;
  const EndOfHarvest({@required this.basePath});

  @override
  _EndOfHarvestState createState() => _EndOfHarvestState();
}

class _EndOfHarvestState extends State<EndOfHarvest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ErbanovaAppBarText('Report di fine raccolto'),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final form = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FormEndOfHarvest(basePath: widget.basePath)));

          if (form) {
            Navigator.pop(context);
          }
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
                child: ListFilesInDirectory(
                  basePath: widget.basePath,
                  directory: 'Report Fine Raccolto',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
