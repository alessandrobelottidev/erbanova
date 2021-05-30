import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';

class CultivationLot extends StatefulWidget {
  @override
  _CultivationLotState createState() => _CultivationLotState();
}

class _CultivationLotState extends State<CultivationLot> {
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
