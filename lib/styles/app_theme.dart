import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Colors.white,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      appBarTheme: _appBarTheme());

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        toolbarTextStyle: TextStyle(color: Colors.black));
  }
}
