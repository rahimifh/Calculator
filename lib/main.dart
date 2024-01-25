import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/config/theme.dart';
import 'package:calculator/controller/history_controller.dart';
import 'package:calculator/controller/math_controller.dart';
import 'package:calculator/controller/theme_controller.dart';
import 'package:calculator/init_db.dart';
import 'package:calculator/pages/simple_calculate_page.dart';

Future<void> main() async {
  await initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HistoryController>(
          create: (context) => HistoryController(),
        ),
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
        ),
      ),
    );
  }
}
