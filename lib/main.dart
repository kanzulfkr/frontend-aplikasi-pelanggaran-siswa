import 'package:flutter/material.dart';
import 'package:frontend_aps/pages/splash/splash_screen.dart';
import 'package:frontend_aps/utils/aps_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = SiakadTheme.themeData();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const SplashScreen(),
    );
  }
}
