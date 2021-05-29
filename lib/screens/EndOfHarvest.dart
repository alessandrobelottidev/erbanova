import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';

class EndOfHarvest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ErbanovaAppBarText('Report di fine raccolto'),
      body: Container(
        color: Colors.lightGreen[200],
      ),
    );
  }
}
