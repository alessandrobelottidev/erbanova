import 'package:flutter/material.dart';

class FormField extends StatelessWidget {
  FormField({required this.label, required this.state});

  String label;
  String state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.green[700],
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          labelStyle: new TextStyle(color: Colors.black87),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green[700]!),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green[700]!),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green[700]!),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return '$label è obbligatorio';
          }
        },
        onSaved: (String? value) {
          if (value != null) {
            state = value;
          }
        },
      ),
    ));
  }
}
