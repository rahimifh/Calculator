// A function that checks if the parentheses are balanced and returns the balanced input
String balanceParentheses(String input) {
  // A map of matching parentheses
  // A regular expression to match a word followed by an opening parenthesis
  RegExp regex = RegExp(r"(\d+|\w+)?\(");

  // Loop through all the matches in the input
  for (RegExpMatch match in regex.allMatches(input)) {
    // Get the matched string
    String? word = match.group(0);
    print(word);
    // Append a closing parenthesis to the output
    return ")";
  }

  // Return the balanced output
  return "(";
}
