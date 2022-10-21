import 'package:flutter/material.dart';

import 'cs_icon.dart';

class CsSliderItem extends StatelessWidget {
  const CsSliderItem({
    required this.icon,
    required this.title,
    required this.onChanged,
    required this.value,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final double value;
  final void Function(double)? onChanged;
  final double min;
  final double max;
  final int? divisions;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.primaryContainer,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          Slider(
            value: value,
            onChanged: onChanged,
            min: min,
            max: max,
            divisions: divisions,
            thumbColor: theme.primaryColor,
            activeColor: Colors.red[200],
          ),
        ],
      ),
    );
  }
}
