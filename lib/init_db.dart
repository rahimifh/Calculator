import 'package:hive_flutter/hive_flutter.dart';
import 'package:calculator/models/history.dart';

Future<void> initDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryAdapter());
  await Hive.openBox<History>('historyBox');
}
