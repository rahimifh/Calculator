import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/config/theme.dart';
import 'package:start/controller/math_controller.dart';
import 'package:start/controller/theme_controller.dart';
import 'package:start/pages/simple_calculate_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MathController>(
            create: (context) => MathController(),
          ),
          ChangeNotifierProvider<ThemeController>(
            create: (context) => ThemeController(),
          ),
        ],
        child: Consumer<ThemeController>(
            builder: (context, value, child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: value.themeMode,
                  home: const SimpleCalculatorPage(),
                )));
  }
}
