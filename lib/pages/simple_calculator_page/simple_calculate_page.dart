import 'package:flutter/material.dart';
import 'package:start/pages/simple_calculator_page/widgets/landscape_mode.dart';
import 'package:start/pages/simple_calculator_page/widgets/portrait_mode.dart';
import 'package:start/widgets/app_drawer.dart';
import 'package:start/widgets/main_appbar.dart';

class SimpleCalculatorPage extends StatefulWidget {
  const SimpleCalculatorPage({super.key});

  @override
  State<SimpleCalculatorPage> createState() => _SimpleCalculatorPageState();
}

class _SimpleCalculatorPageState extends State<SimpleCalculatorPage> {
  // list all of btns text
  final List<List<String>> expressionLists = const [
    ['√', '^', 'π', '!'],
    ['C', '()', '%', '÷'],
    ['7', '8', '9', 'x'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['0', '.', 'remove', '='],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: SafeArea(
        child: Center(
          child: OrientationBuilder(
            builder: (context, orientation) =>
                orientation == Orientation.portrait
                    ? PortraitMode(expressionLists: expressionLists)
                    : LandscapeMode(expressionLists: expressionLists),
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
