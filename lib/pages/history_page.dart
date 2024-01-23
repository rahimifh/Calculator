import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start/models/history.dart';
import 'package:start/pages/simple_calculate_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Box<History> box = Hive.box<History>('historyBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) => ListTile(
              title: Text(box.values.toList()[index].operatios),
              subtitle: Text('${box.values.toList()[index].date}')),
        )));
  }
}
