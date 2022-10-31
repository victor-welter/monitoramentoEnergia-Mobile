import 'package:flutter/material.dart';

import 'cs_icon.dart';

class CsSwitchItem extends StatelessWidget {
  const CsSwitchItem({
    required this.icon,
    required this.title,
    required this.onChanged,
    required this.value,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final void Function(bool)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () => onChanged!(!value),
      splashColor: theme.colorScheme.onPrimary,
      focusColor: theme.colorScheme.onPrimary,
      hoverColor: theme.colorScheme.onPrimary,
      highlightColor: theme.colorScheme.onPrimary,
      child: Container(
        padding: const EdgeInsets.all(15),
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
            Switch(
              onChanged: onChanged,
              value: value,
              activeColor: theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
