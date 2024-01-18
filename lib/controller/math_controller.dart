import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:start/balance_parentheses.dart';

class MathController extends ChangeNotifier {
  // A string to store the user input
  String input = '';
  // A string to store tesult of calculation
  String result = '';

  // A function to _append a character to the input
  void append(String char) {
    input += char;
    notifyListeners();
  }

  // A function to clear the input and result
  void clear() {
    input = '';
    result = '';
    notifyListeners();
  }

  //remove single number or operation
  void remove() {
    input = input.substring(0, input.length - 1);
    notifyListeners();
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
      result = eval.toString();
      notifyListeners();
    } catch (e) {
      // If there is an error, show it in snackbar
      rethrow;
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
}