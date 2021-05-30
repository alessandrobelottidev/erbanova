import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';

class Blossom extends StatefulWidget {
  @override
  _BlossomState createState() => _BlossomState();
}

class _BlossomState extends State<Blossom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ErbanovaAppBarText('Fase di fioritura'),
      body: Container(
        color: Colors.lightGreen[200],
      ),
    );
  }
}
