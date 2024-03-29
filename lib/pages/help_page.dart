import 'package:flutter/material.dart';
import 'package:calculator/pages/simple_calculate_page.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Help"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SimpleCalculatorPage()),
                );
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
