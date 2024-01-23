import 'package:flutter/material.dart';
import 'package:start/models/drawer_item.dart';
import 'package:start/pages/feedback_page.dart';
import 'package:start/pages/help_page.dart';
import 'package:start/pages/history_page.dart';
import 'package:start/pages/privacy_policy_page.dart';
import 'package:start/pages/theme_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  static List<ItemDrawer> items = [
    ItemDrawer('History', Icons.book_outlined, const HistoryPage()),
    ItemDrawer('Theme', Icons.color_lens_outlined, const ThemeSetting()),
    ItemDrawer(
        'privacy Policy', Icons.security_outlined, const PrivacyPalicy()),
    ItemDrawer('Feedback', Icons.feedback_outlined, const FeedBack()),
    ItemDrawer('Help', Icons.help_center_outlined, const Help()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.amber),
            child: Text(
              "Oorosi Calculator",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ...items.map(
            (e) => ListTile(
              leading: Icon(e.icon),
              title: Text(e.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => e.page),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
