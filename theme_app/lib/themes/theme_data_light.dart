import 'package:flutter/material.dart';

class ThemeDataLight {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4F46E5),
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: const Color(0xFFF8F9FC),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF8F9FC),
      foregroundColor: Color(0xFF171717),
      elevation: 0,
      centerTitle: false,
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 2,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF4F46E5), width: 1.5),
      ),
    ),

    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: Color(0xFF171717),
      ),

      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Color(0xFF171717),
      ),

      bodyLarge: TextStyle(fontSize: 15, color: Color(0xFF525252)),

      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF737373)),
    ),
  );
}
