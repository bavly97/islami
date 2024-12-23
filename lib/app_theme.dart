import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xffE2BE7F);
  static const Color black = Color(0xff202020);
  static const Color white = Color(0xffffffff);
  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primary,
      selectedItemColor: white,
      unselectedItemColor: black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );
}
