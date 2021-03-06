import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  MenuButton({required this.text, required this.nextTab});

  final String text;
  final StatefulWidget nextTab;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 6.0, top: 6.0, right: 6.0, bottom: 6.0),
        child: TextButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextTab)),
          child: Padding(
            padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
            child: Text(
              text,
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
    );
  }
}
