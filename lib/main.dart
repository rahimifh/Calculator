import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:start/balance_parentheses.dart';
import 'package:start/widgets/app_drawer.dart';

void main() {
  runApp(const MyApp(start: "I'm start and nobody can stay against me"));
}

class MyApp extends StatelessWidget {
  final String start;
  const MyApp({super.key, required this.start});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: start,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 58, 152)),
        useMaterial3: true,
      ),
      home: const Calculator(title: 'Calculator'),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;
  final String myname = "siavash calculator";

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // A string to store the user input
  String input = '';
  // A string to store tesult of calculation
  String result = '';
  // list all of btns text
  final List<List<String>> expressionLists = const [
    ['√', 'pow', 'π', '!'],
    ['C', '()', '%', '/'],
    ['7', '8', '9', '*'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['0', '.', 'remove', '='],
  ];

  // A function to _append a character to the input
  void append(String char) {
    setState(() {
      input += char;
    });
  }

  // A function to clear the input and result
  void clear() {
    setState(() {
      input = '';
      result = '';
    });
  }

  //remove single number or operation
  void remove() {
    setState(() {
      input = input.substring(0, input.length - 1);
    });
  }

  // A function to evaluate the input and show the result
  void evaluate() {
    try {
      // Parse the input into an expression
      Parser p = Parser();
      Expression exp = p.parse(input);
      // Evaluate the expression using a context model
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Show the result as a string
      setState(() {
        result = eval.toString();
      });
    } catch (e) {
      // If there is an error, show it in snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  //ontap func for every btn
  void onTap(String char) {
    switch (char) {
      case 'C':
        clear();
        break;
      case 'remove':
        remove();
        break;
      case '=':
        evaluate();
        break;
      case '()':
        append(balanceParentheses(input));
        break;
      default:
        append(char);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.amber, //Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
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
                      child: Text(
                        input,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    // A divider to separate the input and output
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        result,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
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
                        child: rowBtns(btns: e),
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

  //1 row = 4 button
  Widget rowBtns({required List<String> btns}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: btns
          .map(
            (e) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () => onTap(e),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: e == 'remove'
                      ? const Icon(
                          Icons.backspace,
                          size: 28,
                          color: Colors.red,
                        )
                      : Text(e),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
