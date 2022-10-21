import 'package:flutter/material.dart';

import 'cs_icon.dart';

class CsButtonItem extends StatelessWidget {
  const CsButtonItem({
    required this.icon,
    required this.title,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: onPressed,
      splashColor: theme.colorScheme.onPrimary,
      focusColor: theme.colorScheme.onPrimary,
      hoverColor: theme.colorScheme.onPrimary,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.colorScheme.primaryContainer,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            CsIcon(
              icon: icon,
              color: theme.splashColor,
              size: 26,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
