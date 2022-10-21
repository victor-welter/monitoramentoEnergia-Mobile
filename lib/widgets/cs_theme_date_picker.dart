import 'package:flutter/material.dart';

class CsThemeDatePicker extends StatelessWidget {
  /// Utilizado para mudar o layout default do [DatePicker]
  const CsThemeDatePicker({
    required Widget child,
    Key? key,
  })  : _child = child,
        super(key: key);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Theme(
      child: _child,
      data: theme.copyWith(
        primaryColor: theme.primaryColor,
        colorScheme: ColorScheme.light(
          // Header background color
          primary: theme.primaryColor,
          // Header text color
          onPrimary: theme.scaffoldBackgroundColor,
          // Body text color
          onSurface: theme.colorScheme.primaryContainer,
        ),

        // Button text theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: theme.colorScheme.primaryContainer,
          ),
        ),
      ),
    );
  }
}
