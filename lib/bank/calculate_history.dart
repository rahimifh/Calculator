import 'package:hive_flutter/hive_flutter.dart';

part 'calculate_history.g.dart';

@HiveType(typeId: 1)
class Result {
  Result({required this.input, required this.result});
  @HiveField(0)
  String input;

  @HiveField(1)
  String result;
}
