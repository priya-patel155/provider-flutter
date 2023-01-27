import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  var _thememode = ThemeMode.light;
  ThemeMode get themeMode => _thememode;

  void setTheme(themeMode) {
    _thememode = themeMode;
    notifyListeners();
  }
}
