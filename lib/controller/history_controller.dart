import 'package:flutter/widgets.dart';
import 'package:start/data/repositories/history_repository.dart';
import 'package:start/models/history.dart';

class HistoryController extends ChangeNotifier {
  final IHistoryReqpository repository = HistoryRepositoryImpl();

  Future<void> createHistory(History history) async {
    await repository.createHistory(history: history);
  }

  List<History> getHistory() {
    return repository.getHistory();
  }
}
