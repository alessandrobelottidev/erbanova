import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/Widgets/AppBar.dart';
import 'package:erbanova/Widgets/MenuButton.dart';

// Screens
import 'package:erbanova/Screens/Blossom.dart';
import 'package:erbanova/Screens/CultivationLot.dart';
import 'package:erbanova/Screens/Drying.dart';
import 'package:erbanova/Screens/EndOfHarvest.dart';
import 'package:erbanova/Screens/Germination.dart';
import 'package:erbanova/Screens/Vegetative.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ErbanovaAppBarImage('assets/images/logo.png'),
        body: Container(
          color: Colors.lightGreen[200],
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 24.0, right: 10.0, bottom: 0.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 6.0, top: 6.0, right: 6.0, bottom: 12.0),
                        child: Text(
                          'Lotto corrente: Esempio',
                          style: const TextStyle(
                            fontSize: 26,
                            fontFamily: 'Overlock',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MenuButton(
                        text: 'Cambia lotto di coltivazione',
                        nextTab: CultivationLot()),
                  ],
                ),
                Row(
                  children: [
                    MenuButton(
                        text: 'Fase di germinazione', nextTab: Germination()),
                    MenuButton(text: 'Fase Vegetativa', nextTab: Vegetative()),
                  ],
                ),
                Row(
                  children: [
                    MenuButton(text: 'Fase di fioritura', nextTab: Blossom()),
                    MenuButton(text: 'Fase di essicatura', nextTab: Drying()),
                  ],
                ),
                Row(
                  children: [
                    MenuButton(
                        text: 'Report di fine raccolto',
                        nextTab: EndOfHarvest()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
