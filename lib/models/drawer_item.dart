import 'package:flutter/material.dart';

class ItemDrawer {
  final String _title;
  final IconData _icon;
  final Widget _page;
  ItemDrawer(this._title, this._icon, this._page);

  String get title => _title;
  IconData get icon => _icon;
  Widget get page => _page;
}
