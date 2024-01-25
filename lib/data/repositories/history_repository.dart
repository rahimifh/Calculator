import 'package:calculator/data/data_sources/history_datasource.dart';
import 'package:calculator/models/history.dart';

abstract class IHistoryReqpository {
  Future<void> createHistory({required History history});
  void updateHistory({required History history});
  void deleteHistory({required History history});
  List<History> getHistory();
}

class HistoryRepositoryImpl implements IHistoryReqpository {
  final HistoryDataSource dataSource = HistoryDataSourceLocal();
  @override
  Future<void> createHistory({required History history}) async {
    await dataSource.createHistory(history: history);
  }

  @override
  void deleteHistory({required History history}) {}

  @override
  List<History> getHistory() {
    return dataSource.getHistory();
  }

  @override
  void updateHistory({required History history}) {}
}
