import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'themes/theme_data_dark.dart';
import 'themes/theme_data_light.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Notes',

      theme: ThemeDataLight.theme,
      darkTheme: ThemeDataDark.theme,

      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: HomeScreen(isDarkMode: isDarkMode, onThemeToggle: toggleTheme),
    );
  }
}
