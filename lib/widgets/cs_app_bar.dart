import 'package:flutter/material.dart';

class CsAppBar extends StatelessWidget with PreferredSizeWidget {
  const CsAppBar({
    required this.title,
    this.leading,
    this.actions,
    this.size = const Size.fromHeight(70),
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Size size;

  @override
  Size get preferredSize => size;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
      elevation: 8,
      backgroundColor: theme.primaryColor,
      toolbarHeight: 70,
      centerTitle: true,
      title: FittedBox(
        child: Text(
          '$title',
          style: TextStyle(
            color: theme.backgroundColor,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: theme.backgroundColor,
      ),
      actions: actions,
      leading: leading,
    );
  }
}
