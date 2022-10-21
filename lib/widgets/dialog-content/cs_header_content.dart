import 'package:flutter/material.dart';

class CsHeaderContent extends StatelessWidget {
  const CsHeaderContent({
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: theme.colorScheme.primaryContainer,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Divider(
            color: theme.colorScheme.primaryContainer.withOpacity(0.6),
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
