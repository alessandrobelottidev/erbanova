import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';

class Blossom extends StatelessWidget {
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
