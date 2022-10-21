import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CsElevatedButton extends StatelessWidget {
  const CsElevatedButton({
    required this.onPressed,
    required this.label,
    this.icon,
    this.height = 45,
    this.color = Colors.red,
    this.textColor = Colors.white,
    Key? key,
  }) : super(key: key);

  const CsElevatedButton.outline({
    required this.onPressed,
    required this.label,
    this.icon,
    this.height = 45,
    this.color = Colors.white,
    this.textColor = Colors.red,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;
  final Widget? icon;
  final double height;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon ?? Container(),
        clipBehavior: Clip.none,
        label: AutoSizeText(
          label.toUpperCase(),
          style: theme.textTheme.button?.copyWith(
            color: textColor,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {}

            return color;
          }),
          textStyle: MaterialStateProperty.all(
            theme.textTheme.button?.copyWith(
              color: textColor,
            ),
          ),
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                color: theme.primaryColor,
                width: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
