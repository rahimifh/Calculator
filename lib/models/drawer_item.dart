import 'package:flutter/material.dart';

class ItemDrawer {
  final String _title;
  final IconData _icon;

  ItemDrawer(this._title, this._icon);

  String get title => _title;
  IconData get icon => _icon;
}
