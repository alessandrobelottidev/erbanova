import 'package:flutter/material.dart';

// Components
import '../components/appBar.dart';

class Vegetativa extends StatelessWidget {
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
