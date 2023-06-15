import 'package:flutter/material.dart';
import 'package:flutter_seed/config/themes/colors/dark_theme.dart';
import 'package:flutter_seed/config/themes/colors/light_theme.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: LightThemeColors.background,
    cardTheme: const CardTheme(
      color: LightThemeColors.card,
    ),
    textTheme: Typography().black,
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: DarkThemeColors.background,
    cardTheme: const CardTheme(
      color: DarkThemeColors.card,
    ),
    textTheme: Typography().white,
    useMaterial3: true,
  );
}
