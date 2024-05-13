import 'package:agro_ai/screens/home/home_screen.dart';
import 'package:agro_ai/screens/splash/splash.dart';
import 'package:agro_ai/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    injectControllers();
    return GetMaterialApp(
      title: 'Flutter Demo',
      // theme: lightTheme,
      home: const HomeScreen(),
    );
  }

  injectControllers() {}
}
