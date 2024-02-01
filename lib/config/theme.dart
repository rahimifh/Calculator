import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    // scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 183, 58, 152),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    // scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 183, 58, 152),
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
