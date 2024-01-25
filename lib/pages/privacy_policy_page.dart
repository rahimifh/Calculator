import 'package:flutter/material.dart';
import 'package:start/pages/simple_calculate_page.dart';

class PrivacyPalicy extends StatelessWidget {
  const PrivacyPalicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'privacy policy',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "When you use our services, you'r trusting us with your information. beside this app is completiely free and offline. Therefore, no imnormation from you is stored in any of our servers and will not be.Feel free to use it",
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.wavy,
                  fontSize: 20,
                ),
              ),
            ),
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
