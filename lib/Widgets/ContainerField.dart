import 'package:flutter/material.dart';

class ContainerField extends StatelessWidget {
  ContainerField({required this.textFormField});

  final TextFormField textFormField;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: textFormField,
    ));
  }
}
