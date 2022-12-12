import 'package:flutter/material.dart';

import '../../utils/functions_utils.dart';
import '../../utils/string_format_utils.dart';
import '../cs_icon.dart';

class CardPrecoTotal extends StatelessWidget {
  const CardPrecoTotal({
    required this.total,
    Key? key,
  }) : super(key: key);

  final String total;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.scaffoldBackgroundColor,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: theme.primaryColor),
      ),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            children: [
              const CsIcon.icon(
                icon: Icons.monetization_on_outlined,
                size: 26,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  valorNull(formatValoresMonetarios(double.parse(total))),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
