import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';

class Drying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ErbanovaAppBarText('Fase di essicatura'),
      body: Container(
        color: Colors.lightGreen[200],
      ),
    );
  }
}
