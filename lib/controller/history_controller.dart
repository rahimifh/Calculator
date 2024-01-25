import 'package:flutter/widgets.dart';
import 'package:calculator/data/repositories/history_repository.dart';
import 'package:calculator/models/history.dart';

class HistoryController extends ChangeNotifier {
  final IHistoryReqpository repository = HistoryRepositoryImpl();

  Future<void> createHistory(History history) async {
    await repository.createHistory(history: history);
  }

  List<History> getHistory() {
    return repository.getHistory();
  }
}
