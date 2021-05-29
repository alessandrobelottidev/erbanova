import 'package:flutter/material.dart';

// Components
import '../components/appBar.dart';

class Germinazione extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ErbanovaAppBarText('Fase di germinazione'),
      body: Container(
        color: Colors.lightGreen[200],
      ),
    );
  }
}
