import 'package:flutter/material.dart';
// import 'screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'screens/prayer_home.dart';

void main() {
  runApp(
    const PrayerApp(),
  );
}

class PrayerApp extends StatelessWidget {
  const PrayerApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prayer Times',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const PrayerHome(),
    );
  }
}
// void main() {
//   runApp(const LabTrackApp());
// }

// class LabTrackApp extends StatelessWidget {
//   const LabTrackApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'LabTrack',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
//         useMaterial3: true,
//       ),
//       home: const Dashboard(),
//     );
//   }
// }
