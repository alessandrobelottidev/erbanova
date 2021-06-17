import 'package:flutter/material.dart';

class ErbanovaAppBarImage extends StatelessWidget
    implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  final String imageTitle;

  ErbanovaAppBarImage(this.imageTitle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.0,
      title: Image(
        image: AssetImage(imageTitle),
        height: 100.0,
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
      title: Text(
        titleAppBar,
        style: const TextStyle(
          fontSize: 22,
          fontFamily: 'Overlock',
          fontWeight: FontWeight.w900,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

class ErbanovaAppBarAct extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  final String titleAppBar;
  var actions;

  ErbanovaAppBarAct({required this.titleAppBar, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleAppBar,
        style: const TextStyle(
          fontSize: 22,
          fontFamily: 'Overlock',
          fontWeight: FontWeight.w900,
        ),
      ),
      actions: [this.actions],
      centerTitle: true,
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
