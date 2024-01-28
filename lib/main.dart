import 'package:flutter/material.dart';
import 'package:profile/screens/home_screen.dart';
import 'package:profile/screens/navigation.dart';
import 'package:profile/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        routes: {
      '/': (context) => const SplashScreen(),
      'navigation': (context) => const NavigationScreen(),
    });
  }
}
