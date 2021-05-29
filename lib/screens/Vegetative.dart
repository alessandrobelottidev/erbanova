import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';

class Vegetative extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ErbanovaAppBarText('Fase Vegetativa'),
      body: Container(
        color: Colors.lightGreen[200],
      ),
    );
  }
}
