import 'package:flutter/material.dart';

class ThemeApp {
  static final themeApp = ThemeData.light().copyWith(
    primaryColor: Colors.red,
    splashColor: Colors.red[700],
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: Colors.white,
    secondaryHeaderColor: Colors.black,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      elevation: 8,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.grey[400],
      onPrimary: Colors.grey[200]!,
      secondary: Colors.grey[600]!,
      primaryContainer: Colors.black,
      onSecondaryContainer: Colors.grey[600],
      brightness: Brightness.light,
      error: Colors.red,
    ),

    /// [TextSelectionThemeData] utilizada para alteração da color do cursor
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),

    /// [IconThemeData] utilizada no [Icon]
    iconTheme: const IconThemeData(
      color: Colors.red,
      size: 24,
    ),

    dividerTheme: DividerThemeData(
      thickness: 2,
      color: Colors.grey[400],
    ),

    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: _textFieldBorder,
      errorBorder: _textFieldBorder,
      enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,
      disabledBorder: _textFieldBorder,
      focusedErrorBorder: _textFieldBorder,
      fillColor: Colors.grey.shade300,
      errorStyle: const TextStyle(
        color: Colors.orange,
        fontSize: 14,
      ),
      hintStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    ),

    textTheme: const TextTheme(
      labelMedium: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      button: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  /// [OutlineInputBorder] utilizada na [CustomTextFormField]
  static final OutlineInputBorder _textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 2,
    ),
    gapPadding: 4,
  );
}
