import 'package:flutter/material.dart';

import 'main/usescases/splash/splash_screen.widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
