import 'package:flutter/material.dart';

// Components
import '../components/appBar.dart';

class LottoColtivazione extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ErbanovaAppBarText('Cambia lotto di coltivazione'),
      body: Container(
        color: Colors.lightGreen[200],
      ),
    );
  }
}
