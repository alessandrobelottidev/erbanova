import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';

class Vegetative extends StatefulWidget {
  @override
  _VegetativeState createState() => _VegetativeState();
}

class _VegetativeState extends State<Vegetative> {
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
