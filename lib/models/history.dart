import 'package:hive_flutter/hive_flutter.dart';

part 'history.g.dart';

@HiveType(typeId: 1)
class History {
  @HiveField(0)
  final String _operations;

  @HiveField(1)
  final DateTime _date;

  History(this._operations, this._date);

  String get operatios => _operations;
  DateTime get date => _date;
}
