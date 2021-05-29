import 'package:flutter/material.dart';

// Components
import '../components/appBar.dart';

class Fioritura extends StatelessWidget {
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
