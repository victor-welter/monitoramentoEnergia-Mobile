import 'package:flutter/material.dart';

class CsFloatingActionButton extends StatelessWidget {
  const CsFloatingActionButton({
    required this.onPressed,
    this.child,
    this.tooltip,
    this.heroTag,
    Key? key,
  }) : super(key: key);

  final void Function() onPressed;
  final Widget? child;
  final String? tooltip;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(10),
      child: FloatingActionButton(
        heroTag: heroTag,
        tooltip: tooltip,
        onPressed: onPressed,
        child: child,
        elevation: 3,
        backgroundColor: theme.primaryColor,
        splashColor: theme.splashColor,
        hoverColor: theme.splashColor,
      ),
    );
  }
}
