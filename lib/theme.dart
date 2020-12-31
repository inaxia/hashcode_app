import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  bool isLightTheme = false;
  ThemeChanger(this._themeData);

  getTheme() => _themeData;
  setTheme(ThemeData theme) {
    if (theme == ThemeData.dark())
      isLightTheme = false;
    else
      isLightTheme = true;
    _themeData = theme;
    notifyListeners();
  }
}
