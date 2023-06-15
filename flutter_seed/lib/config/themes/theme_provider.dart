import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  //-----Mention default theme theme here for application
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); //---notify material app to update UI----
  }
}
