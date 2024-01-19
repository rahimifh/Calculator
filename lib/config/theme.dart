import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 183, 58, 152),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 183, 58, 152),
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
