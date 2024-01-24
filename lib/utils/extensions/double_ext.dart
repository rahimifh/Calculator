extension DoubleExt on double {
  String roundToInt() {
    double input = this;

    //25 == 25.0 => 25 || 25.4 != 25 => 25.4
    return input == input.toInt() ? '${input.toInt()}' : '$input';
  }
}
