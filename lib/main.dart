import 'package:flutter/material.dart';
import 'package:subscribtion_reminder/onboarding/view/second_splash_screen.dart';
import 'package:subscribtion_reminder/onboarding/view/splash_screen.dart';
import 'package:subscribtion_reminder/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const SplashScreen(),
    );
  }
}
