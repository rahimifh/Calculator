import 'package:flutter/material.dart';

extension StringExt on String {
  String balanceParentheses() {
    String input = this;
    // A variable to store the number of parentheses
    int parantheses = 0;
    // A variable to store the output
    String output = "";

    List<String> operations = ['÷', 'x', '-', '+'];

    // Loop through all the characters in the input
    for (int i = 0; i < input.length; i++) {
      // Get the current character
      String char = input[i];
      // If it is an opening parenthesis, increment the paranthese count and append it to the output
      if (char == "(") {
        parantheses++;
        output += char;
      }
      // If it is a closing parenthesis, decrease the paranthese count and append it to the output
      else if (char == ")") {
        parantheses--;
        output += char;
      }
      // If it is any other character, append it to the output
      else {
        output += char;
      }
    }

    // If the paranthese count is greater than the zero, append the missing closing parentheses to the output
    if (parantheses > 0 && !operations.contains(input.characters.last)) {
      for (int i = 0; i < parantheses; i++) {
        output += ")";
      }
    }
    //if paranthese count greater than zero and last char is operation opening the paranthese.
    else if (parantheses > 0 && operations.contains(input.characters.last)) {
      for (int i = 0; i < parantheses; i++) {
        output += "(";
      }
    }
    // If the paranthese count is smaller than the zero, append the missing opening parentheses to the output
    else if (parantheses < 0) {
      for (int i = 0; i < parantheses; i++) {
        output = "($output";
      }
    } else if (parantheses == 0) {
      output = "$output(";
    }

    // Return the balanced output
    return output;
  }
}
