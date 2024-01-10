import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
// Import the dart:math library
import 'dart:math';

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

  // A function to _append a character to the input
  void _append(String char) {
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
      // If there is an error, show it as the result
      setState(() {
        result = e.toString();
      });
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              //color: Colors.lightBlue,
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightGreen, width: 1),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(children: [
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
              ]),
            ),
            // A container to display the input

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              TextButton(
                  onPressed: () => _append('pow('), child: const Text('√')),
              TextButton(
                  onPressed: () => _append('pow('), child: const Text('pow')),
              TextButton(
                  onPressed: () => _append('pow('), child: const Text('π')),
              TextButton(
                  onPressed: () => _append('pow('), child: const Text('!')),
            ]),
            const Divider(
              height: 5,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(onPressed: clear, child: const Text("C")),
                TextButton(
                    onPressed: () => _append('pow('), child: const Text('()')),
                TextButton(
                    onPressed: () => _append('pow('), child: const Text('%')),
                TextButton(
                    onPressed: () => _append('/'), child: const Text('/')),
              ],
            ),
            const SizedBox(height: 10),
            // A row of buttons for numbers and operators
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                    onPressed: () => _append('7'), child: const Text('7')),
                TextButton(
                    onPressed: () => _append('8'), child: const Text('8')),
                TextButton(
                    onPressed: () => _append('9'), child: const Text('9')),
                TextButton(
                    onPressed: () => _append('*'), child: const Text('*')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                    onPressed: () => _append('4'), child: const Text('4')),
                TextButton(
                    onPressed: () => _append('5'), child: const Text('5')),
                TextButton(
                    onPressed: () => _append('6'), child: const Text('6')),
                TextButton(
                    onPressed: () => _append('-'), child: const Text('-')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                    onPressed: () => _append('1'), child: const Text('1')),
                TextButton(
                    onPressed: () => _append('2'), child: const Text('2')),
                TextButton(
                    onPressed: () => _append('3'), child: const Text('3')),
                TextButton(
                    onPressed: () => _append('+'), child: const Text('+')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                    onPressed: () => _append('0'), child: const Text('0')),
                TextButton(
                    onPressed: () => _append('.'), child: const Text('.')),
                TextButton(
                    onPressed: () {
                      // Remove the last character from the input
                      setState(() {
                        input = input.substring(0, input.length - 1);
                      });
                    },
                    child: const Icon(
                      Icons.backspace,
                      size: 28,
                      color: Colors.red,
                    )),
                TextButton(onPressed: evaluate, child: const Text('=')),
              ],
            ),
            const SizedBox(height: 10),
            // A button to append the pow() symbol
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.amber),
              child: Text(
                "Oorosi Calculator",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book_outlined),
              title: Text('History'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.color_lens_outlined),
              title: Text('Choose theme'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.security_outlined),
              title: Text('Pricacy policy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              title: Text('Send feedback'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help_center_outlined),
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
