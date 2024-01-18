// A function that checks if the parentheses are balanced and returns the balanced input
String balanceParentheses(String input) {
  // A variable to store the number of opening parentheses
  int open = 0;
  // A variable to store the number of closing parentheses
  int close = 0;
  // A variable to store the output
  String output = "";

  // Loop through all the characters in the input
  for (int i = 0; i < input.length; i++) {
    // Get the current character
    String char = input[i];
    // If it is an opening parenthesis, increment the open count and append it to the output
    if (char == "(") {
      open++;
      output += char;
    }
    // If it is a closing parenthesis, increment the close count and append it to the output
    else if (char == ")") {
      close++;
      output += char;
    }
    // If it is any other character, append it to the output
    else {
      output += char;
    }
  }

  // If the open count is greater than the close count, append the missing closing parentheses to the output
  if (open > close) {
    for (int i = 0; i < open - close; i++) {
      output += ")";
    }
  }
  // If the close count is greater than the open count, append the missing opening parentheses to the output
  else if (close > open) {
    for (int i = 0; i < close - open; i++) {
      output = "(" + output;
    }
  } else if (close == open) {
    output = output + "(";
  }

  // Return the balanced output

  return output;
}
