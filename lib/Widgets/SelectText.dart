import 'package:flutter/material.dart';

class SelectText extends StatelessWidget {
  SelectText(this.value);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
