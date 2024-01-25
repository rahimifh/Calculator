import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/controller/history_controller.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: SafeArea(
        child: Consumer<HistoryController>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.getHistory().length,
            itemBuilder: (context, index) => ListTile(
              title: Text(value.getHistory()[index].operatios),
              subtitle: Text('${value.getHistory()[index].date}'),
            ),
          ),
        ),
      ),
    );
  }
}
