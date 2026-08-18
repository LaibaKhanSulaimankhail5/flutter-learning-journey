import 'package:flutter/material.dart';

class ThemeDataDark {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF818CF8),
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor: const Color(0xFF101114),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF101114),
      foregroundColor: Color(0xFFF5F5F5),
      elevation: 0,
      centerTitle: false,
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF191A1F),
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF292A30)),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 2,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF191A1F),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF292A30)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF292A30)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF818CF8), width: 1.5),
      ),
    ),

    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: Color(0xFFF5F5F5),
      ),

      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Color(0xFFF5F5F5),
      ),

      bodyLarge: TextStyle(fontSize: 15, color: Color(0xFFD4D4D4)),

      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFFA3A3A3)),
    ),
  );
}
