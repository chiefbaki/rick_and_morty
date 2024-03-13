import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/dark_theme.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/light_theme.dart';

class ThemeManager extends ChangeNotifier {
  bool isDarkTheme = true;


  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    print(getCurretnTheme);
    notifyListeners();
  }
  ThemeData get getCurretnTheme => isDarkTheme ? darkTheme : lightTheme;
}
