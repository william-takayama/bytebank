import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
