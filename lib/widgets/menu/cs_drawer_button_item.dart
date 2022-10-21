import 'package:flutter/material.dart';

import '../cs_icon.dart';

class CsDrawerButtonItem extends StatelessWidget {
  const CsDrawerButtonItem({
    required this.onPressed,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.transparent,
    Key? key,
  }) : super(key: key);

  final void Function() onPressed;
  final String title;
  final IconData icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: onPressed,
        splashColor: theme.colorScheme.onPrimary,
        focusColor: theme.colorScheme.onPrimary,
        hoverColor: theme.colorScheme.onPrimary,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              CsIcon(
                icon: icon,
                color: theme.splashColor,
                size: 26,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: theme.colorScheme.primaryContainer,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
