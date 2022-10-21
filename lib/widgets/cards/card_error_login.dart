import 'package:flutter/material.dart';

import '../../utils/string_format_utils.dart';
import '../cs_icon.dart';

class CardErrorLogin extends StatelessWidget {
  ///[Card] customizado utilizado para exibir as informações na view `LoginView`
  const CardErrorLogin({
    required this.label,
    this.color,
    this.icon = Icons.warning_rounded,
    Key? key,
  }) : super(key: key);

  final Color? color;
  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final Color _color = color ?? Theme.of(context).errorColor;

    return Card(
      elevation: 0,
      color: theme.scaffoldBackgroundColor,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: _color),
      ),
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Row(
          children: [
            CsIcon.icon(
              icon: icon!,
              color: _color,
              size: 26,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                valorNull(label),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.secondary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
