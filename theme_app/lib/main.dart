import 'package:flutter/material.dart';

import 'screens/theme_studio_screen.dart';
import 'themes/theme_data_dark.dart';
import 'themes/theme_data_light.dart';

void main() {
  runApp(const ThemeStudioApp());
}

class ThemeStudioApp extends StatefulWidget {
  const ThemeStudioApp({super.key});

  @override
  State<ThemeStudioApp> createState() => _ThemeStudioAppState();
}

class _ThemeStudioAppState extends State<ThemeStudioApp> {
  ThemeMode themeMode = ThemeMode.system;

  void changeTheme(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Studio',
      theme: ThemeDataLight.theme,
      darkTheme: ThemeDataDark.theme,
      themeMode: themeMode,
      home: ThemeStudioScreen(
        themeMode: themeMode,
        onThemeChanged: changeTheme,
      ),
    );
  }
}
