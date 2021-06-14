import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/widgets/SelectText.dart';
import 'package:path/path.dart';

class RadioField extends StatelessWidget {
  RadioField(
      {required this.selectText,
      required this.paddingLeft,
      required this.radioTrue,
      required this.radioFalse,
      required this.screenWidth});

  double screenWidth;
  String selectText;
  bool paddingLeft;
  Widget radioTrue;
  Widget radioFalse;

  @override
  Widget build(BuildContext context) {
    if (screenWidth > 720.0) {
      if (!paddingLeft) {
        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  SelectText(selectText),
                  radioTrue,
                  SelectText('Sì'),
                  radioFalse,
                  SelectText('No'),
                ],
              )
            ],
          ),
        );
      } else {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SelectText(selectText),
                    radioTrue,
                    SelectText('Sì'),
                    radioFalse,
                    SelectText('No'),
                  ],
                )
              ],
            ),
          ),
        );
      }
    } else {
      return Column(
        children: [
          Row(
            children: [
              SelectText(selectText),
              radioTrue,
              SelectText('Sì'),
              radioFalse,
              SelectText('No'),
            ],
          )
        ],
      );
    }
  }
}

class RadioRow extends StatelessWidget {
  RadioRow({required this.rowChildren, required this.screenWidth});

  final List<Widget> rowChildren;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    if (screenWidth > 720.0) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: rowChildren),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: rowChildren),
      );
    }
  }
}
