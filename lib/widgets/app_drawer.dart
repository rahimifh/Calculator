import 'package:flutter/material.dart';
import 'package:start/models/drawer_item.dart';
import 'package:start/pages/feedback.dart';
import 'package:start/pages/help.dart';
import 'package:start/pages/history.dart';
import 'package:start/pages/privacy_policy.dart';
import 'package:start/pages/theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  static List<ItemDrawer> items = [
    ItemDrawer('History', Icons.book_outlined, History()),
    ItemDrawer('Theme', Icons.color_lens_outlined, ThemeSetting()),
    ItemDrawer('privacy Policy', Icons.security_outlined, PrivacyPalicy()),
    ItemDrawer('Feedback', Icons.feedback_outlined, FeedBack()),
    ItemDrawer('Help', Icons.help_center_outlined, Help()),
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
