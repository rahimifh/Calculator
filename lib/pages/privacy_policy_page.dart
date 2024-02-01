import 'package:flutter/material.dart';
import 'package:start/pages/simple_calculator_page/simple_calculate_page.dart';

class PrivacyPalicy extends StatelessWidget {
  const PrivacyPalicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('privacy policy'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("privacy policy"),
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
