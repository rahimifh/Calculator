import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/controller/theme_controller.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          Colors.amber, //Theme.of(context).colorScheme.inversePrimary,
      foregroundColor: Colors.white,
      title: const Text('Calculator'),
      actions: [
        IconButton(
          onPressed: () => context.read<ThemeController>().changeTheme(),
          icon: Consumer<ThemeController>(
            builder: (context, value, child) => Icon(
              value.themeMode == ThemeMode.light
                  ? Icons.dark_mode_sharp
                  : Icons.light_mode_sharp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
