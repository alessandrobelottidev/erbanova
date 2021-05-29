import 'package:flutter/material.dart';

// Components
import '../components/appBar.dart';

class Essicatura extends StatelessWidget {
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
