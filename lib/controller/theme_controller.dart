import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  //when open app theme is light
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme() {
    //change theme between light and dark
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
