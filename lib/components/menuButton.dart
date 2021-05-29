import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  MenuButton(this.buttonText, this.nextTab);

  final buttonText;
  StatelessWidget nextTab;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 6.0, top: 6.0, right: 6.0, bottom: 6.0),
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => nextTab));
          },
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
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
