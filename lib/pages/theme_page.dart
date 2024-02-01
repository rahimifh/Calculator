import 'package:flutter/material.dart';
import 'package:start/pages/simple_calculator_page/simple_calculate_page.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('theme'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("theme"),
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
