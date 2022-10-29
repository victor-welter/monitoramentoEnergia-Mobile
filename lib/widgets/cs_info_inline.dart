import 'package:flutter/material.dart';

class CsInfoInline extends StatelessWidget {
  ///Retorna uma [Row], utilizado para mostrar as informações.
  const CsInfoInline({
    required this.label,
    this.info,
    this.icon,
    this.marginVertical = 3,
    this.isColumn = false,
    Key? key,
  }) : super(key: key);

  final String label;
  final String? info;
  final Widget? icon;
  final double marginVertical;
  final bool isColumn;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: marginVertical),
      child: !isColumn
          ? Row(
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primaryContainer,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    info!,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: theme.colorScheme.primaryContainer,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (icon != null) ...[
                      icon!,
                      const SizedBox(width: 10),
                    ],
                    Expanded(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primaryContainer,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
                if (info != null) ...[
                  const SizedBox(height: 5),
                  Text(
                    info!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: theme.colorScheme.primaryContainer,
                      fontSize: 16,
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}
