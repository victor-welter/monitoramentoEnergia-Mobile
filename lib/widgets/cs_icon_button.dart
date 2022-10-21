import 'package:flutter/material.dart';

class CsIconButton extends StatelessWidget {
  const CsIconButton({
    required this.child,
    this.onPressed,
    this.tooltip,
    this.size,
    Key? key,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget child;
  final String? tooltip;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashColor: Colors.blueGrey[100],
      hoverColor: Colors.blueGrey[50],
      highlightColor: Colors.blueGrey[50],
      icon: child,
      alignment: Alignment.center,
      tooltip: tooltip,
      padding: const EdgeInsets.all(0),
      iconSize: size,
    );
  }
}
