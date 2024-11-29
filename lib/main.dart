import 'package:flutter/material.dart';
//import 'package:your_app/home_page.dart';
import 'package:your_app/presentation/splash_screen.dart';
import 'package:your_app/repository.dart';

Repository client = Repository();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


