import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/controller/math_controller.dart';
import 'package:start/widgets/app_drawer.dart';
import 'package:start/widgets/main_appbar.dart';
import 'package:start/widgets/row_btns.dart';

class SimpleCalculatorPage extends StatefulWidget {
  const SimpleCalculatorPage({super.key});

  @override
  State<SimpleCalculatorPage> createState() => _SimpleCalculatorPageState();
}

class _SimpleCalculatorPageState extends State<SimpleCalculatorPage> {
  // list all of btns text
  final List<List<String>> expressionLists = const [
    ['√', 'pow', 'π', '!'],
    ['C', '()', '%', '/'],
    ['7', '8', '9', '*'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['0', '.', 'remove', '='],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 35,
              child: Container(
                //color: Colors.lightBlue,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightGreen, width: 1),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(20),
                      child: Consumer<MathController>(
                        //watch input value in math controller class
                        builder: (context, value, child) => Text(
                          value.input,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    // A divider to separate the input and output
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(20),
                      child: Consumer<MathController>(
                        // watch result value in math controller class
                        builder: (context, value, child) => Text(
                          value.result,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // A divider to separate the output and the keypad
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 65,
              child: Column(
                children: expressionLists
                    .map(
                      (e) => Expanded(
                        child: RowBtns(context: context, btns: e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
