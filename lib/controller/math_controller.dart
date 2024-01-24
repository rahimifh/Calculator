import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:start/models/history.dart';
import 'package:start/utils/extensions/double_ext.dart';
import 'package:start/utils/extensions/string_ext.dart';

class MathController extends ChangeNotifier {
  Box<History> historybox = Hive.box<History>('historyBox');
  // A string to store the user input
  String input = '';

  // A string to store tesult of calculation
  String result = '';

  // A function to _append a character to the input
  void append(String char) {
    if (input != "" && result != "") {
      input = result;
      input += char;
      result = "";
    } else {
      input += char;
    }
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
    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
      notifyListeners();
    }
  }

  // A function to evaluate the input and show the result
  Future<void> evaluate() async {
    try {
      String newInput = input
          .replaceAll("x", "*")
          .replaceAll("÷", "/")
          .replaceAll("π", "3.14159");
      // Parse the input into an expression
      Parser p = Parser();
      Expression exp = p.parse(newInput);
      // Evaluate the expression using a context model
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Show the result as a string
      result = eval.roundToInt();
      notifyListeners();

      // Add operations to history
      await historybox.add(History('$input = $result', DateTime.now()));
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
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
        input = input.balanceParentheses();
        notifyListeners();
        break;
      case '√':
        append("sqrt(");
      default:
        append(char);
    }
  }
}
