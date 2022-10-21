import 'package:flutter/material.dart';

class CsTextButton extends StatelessWidget {
  const CsTextButton({
    required this.label,
    required this.onTap,
    this.color,
    Key? key,
  }) : super(key: key);

  final String label;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      splashColor: theme.colorScheme.onSecondaryContainer,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            fontSize: 15,
            color: color ?? theme.colorScheme.primaryContainer,
          ),
        ),
      ),
    );
  }
}
