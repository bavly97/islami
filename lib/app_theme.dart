import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xffE2BE7F);
  static const Color black = Color(0xff202020);
  static const Color white = Color(0xffffffff);
  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    appBarTheme: AppBarTheme(
      foregroundColor: primary,
      backgroundColor: const Color(0xFF202020),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headlineSmall:
          TextStyle(color: white, fontWeight: FontWeight.w700, fontSize: 24),
      titleMedium:
          TextStyle(color: white, fontWeight: FontWeight.w700, fontSize: 16),
      titleSmall:
          TextStyle(color: white, fontWeight: FontWeight.w700, fontSize: 14),
      titleLarge:
          TextStyle(color: white, fontWeight: FontWeight.w700, fontSize: 20),
    ),
    tabBarTheme: TabBarThemeData(
      dividerHeight: 0,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: AppTheme.black,
      unselectedLabelColor: AppTheme.white,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
      ),
      indicator: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
    ),
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
