import 'package:flutter/material.dart';
import 'package:erbanova/Screens/Menu.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.green[700],
        ),
        home: Menu()),
  );
}
