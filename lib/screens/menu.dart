import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/widgets/AppBar.dart';
import 'package:erbanova/widgets/MenuButton.dart';

// Utilities
import 'package:erbanova/utilities/FileSetup.dart';

// Screens
import 'package:erbanova/screens/Blossom.dart';
import 'package:erbanova/screens/CultivationLot.dart';
import 'package:erbanova/screens/Drying.dart';
import 'package:erbanova/screens/EndOfHarvest.dart';
import 'package:erbanova/screens/Germination.dart';
import 'package:erbanova/screens/Vegetative.dart';
import 'package:path/path.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var _currentLot;
  var _currentPath;

  @override
  void initState() {
    super.initState();

    firstLotName().then((String value) {
      setState(() => _currentLot = value);
    });

    firstLotPath().then((String value) {
      setState(() => _currentPath = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: ErbanovaAppBarImage('assets/images/logo.png')),
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
                        'Lotto corrente: $_currentLot',
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 6.0, top: 6.0, right: 6.0, bottom: 6.0),
                      child: TextButton(
                        onPressed: () async {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CultivationLot(
                                          basePath: _currentPath)))
                              .then((value) => setState(() {
                                    this._currentPath = value;
                                    this._currentLot = basename(value);
                                  }));
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 14.0, bottom: 14.0),
                          child: Text(
                            'Cambia lotto di coltivazione',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.black,
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontFamily: 'Overlock',
                              fontWeight: FontWeight.w900,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0))),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  MenuButton(
                      text: 'Fase di germinazione',
                      nextTab: Germination(basePath: _currentPath)),
                  MenuButton(
                      text: 'Fase vegetativa',
                      nextTab: Vegetative(basePath: _currentPath)),
                ],
              ),
              Row(
                children: [
                  MenuButton(
                      text: 'Fase di fioritura',
                      nextTab: Blossom(basePath: _currentPath)),
                  MenuButton(
                      text: 'Fase di essicatura',
                      nextTab: Drying(basePath: _currentPath)),
                ],
              ),
              Row(
                children: [
                  MenuButton(
                      text: 'Report di fine raccolto',
                      nextTab: EndOfHarvest(basePath: _currentPath)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
