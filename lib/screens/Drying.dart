import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/widgets/AppBar.dart';
import 'package:erbanova/widgets/ListFilesInDirectory.dart';

class Drying extends StatefulWidget {
  final basePath;
  const Drying({@required this.basePath});

  @override
  _DryingState createState() => _DryingState();
}

class _DryingState extends State<Drying> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ErbanovaAppBarText('Fase di essicatura'),
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
                  directory: 'Report Essicatura',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
