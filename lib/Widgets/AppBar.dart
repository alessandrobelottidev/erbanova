import 'package:flutter/material.dart';

class ErbanovaAppBarImage extends StatelessWidget
    implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  final String imageTitle;

  ErbanovaAppBarImage(this.imageTitle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image(
        image: AssetImage(imageTitle),
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
  final String titleAppBar;

  ErbanovaAppBarText(this.titleAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleAppBar),
      centerTitle: true,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
