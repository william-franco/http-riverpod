// Flutter imports:
import 'package:flutter/material.dart';

class AppBarMolecule extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget title;
  final List<Widget>? actions;

  const AppBarMolecule({
    Key? key,
    this.leading,
    required this.title,
    this.actions,
  }) : super(key: key);

  static const double appBarHeight = 56.0;

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: title,
      elevation: 0,
      toolbarHeight: appBarHeight,
      actions: actions,
    );
  }
}
