import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:start/bank/calculate_history.dart';
import 'package:start/config/theme.dart';
import 'package:start/controller/math_controller.dart';
import 'package:start/controller/theme_controller.dart';
import 'package:start/pages/simple_calculate_page.dart';

late Box box;
Future<void> main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('box');
  Hive.registerAdapter(ResultAdapter());
  box.put('Result', Result(input: "8*8", result: "64"));
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
