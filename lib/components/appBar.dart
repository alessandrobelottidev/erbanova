import 'package:flutter/material.dart';

class ErbanovaAppBarImage extends StatelessWidget
    implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  final String titleWidget;

  ErbanovaAppBarImage(this.titleWidget);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image(
        image: AssetImage(titleWidget),
        height: 74.0,
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

class ErbanovaAppBarText extends StatelessWidget
    implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  final String titleWidget;

  ErbanovaAppBarText(this.titleWidget);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleWidget),
      centerTitle: true,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
