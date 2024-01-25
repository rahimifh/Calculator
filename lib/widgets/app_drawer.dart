import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/controller/theme_controller.dart';
import 'package:calculator/models/drawer_item.dart';
import 'package:calculator/pages/feedback_page.dart';
import 'package:calculator/pages/help_page.dart';
import 'package:calculator/pages/history_page.dart';
import 'package:calculator/pages/privacy_policy_page.dart';
import 'package:calculator/pages/theme_page.dart';

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
              trailing: e.title == "Theme"
                  ? IconButton(
                      onPressed: () =>
                          context.read<ThemeController>().changeTheme(),
                      icon: Consumer<ThemeController>(
                        builder: (context, value, child) => Icon(
                          value.themeMode == ThemeMode.light
                              ? Icons.dark_mode_sharp
                              : Icons.light_mode_sharp,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  : null,
              onTap: () {
                if (e.title != "Theme") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => e.page),
                  );
                } else {
                  context.read<ThemeController>().changeTheme();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
