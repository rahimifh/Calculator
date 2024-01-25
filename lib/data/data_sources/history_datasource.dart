import 'package:hive_flutter/hive_flutter.dart';
import 'package:calculator/models/history.dart';

abstract class HistoryDataSource {
  Future<void> createHistory({required History history});
  void updateHistory({required History history});
  void deleteHistory({required History history});
  List<History> getHistory();
}

class HistoryDataSourceLocal implements HistoryDataSource {
  Box<History> historybox = Hive.box<History>('historyBox');
  @override
  Future<void> createHistory({required History history}) async {
    await historybox.add(history);
  }

  @override
  void deleteHistory({required History history}) {}

  @override
  List<History> getHistory() {
    return historybox.values.toList();
  }

  @override
  void updateHistory({required History history}) {}
}
