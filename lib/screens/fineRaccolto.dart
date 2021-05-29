import 'package:flutter/material.dart';

// Components
import '../components/appBar.dart';

class FineRaccolto extends StatelessWidget {
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
