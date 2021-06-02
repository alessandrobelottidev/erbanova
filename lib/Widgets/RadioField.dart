import 'package:flutter/material.dart';

// Widgets
import 'package:erbanova/widgets/SelectText.dart';

class RadioField extends StatelessWidget {
  RadioField(
      {required this.selectText,
      required this.paddingLeft,
      required this.radioTrue,
      required this.radioFalse});

  String selectText;
  bool paddingLeft;
  Widget radioTrue;
  Widget radioFalse;

  @override
  Widget build(BuildContext context) {
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
  }
}

class RadioRow extends StatelessWidget {
  RadioRow({required this.rowChildren});

  final List<Widget> rowChildren;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: rowChildren),
    );
  }
}
