import 'package:flutter/material.dart';

// Components
import '../components/menuButton.dart';
import '../components/appBar.dart';

// Screens
import './lottoColtivazione.dart';
import './germinazione.dart';
import './vegetativa.dart';
import './fioritura.dart';
import './essicatura.dart';
import './fineRaccolto.dart';

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
                    MenuButton(
                        'Cambia lotto di coltivazione', LottoColtivazione()),
                  ],
                ),
                Row(
                  children: [
                    MenuButton('Fase di germinazione', Germinazione()),
                    MenuButton('Fase Vegetativa', Vegetativa()),
                  ],
                ),
                Row(
                  children: [
                    MenuButton('Fase di fioritura', Fioritura()),
                    MenuButton('Fase di essicatura', Essicatura()),
                  ],
                ),
                Row(
                  children: [
                    MenuButton('Report di fine raccolto', FineRaccolto()),
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
