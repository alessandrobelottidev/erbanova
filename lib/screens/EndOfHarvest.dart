import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';
import 'package:erbanova/Widgets/ListFilesInDirectory.dart';

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
      //floatingActionButton: AddButton(),
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
