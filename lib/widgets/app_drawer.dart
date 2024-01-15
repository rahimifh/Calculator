import 'package:flutter/material.dart';
import 'package:start/models/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  static List<ItemDrawer> items = [
    ItemDrawer('History', Icons.book_outlined),
    ItemDrawer('Theme', Icons.color_lens_outlined),
    ItemDrawer('Pricacy Policy', Icons.security_outlined),
    ItemDrawer('Feedback', Icons.feedback_outlined),
    ItemDrawer('Help', Icons.help_center_outlined),
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
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
