import 'package:flutter/material.dart';
import 'screens/onboarding1.dart';
import 'screens/onboarding2.dart';
import 'screens/onboarding3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SafeArea(
          child: OnBoarding2(),
        ),
      ),
      routes: {
        
        '/onboarding2': (context) => const OnBoarding2(),
        '/onboarding3': (context) => const OnBoarding3(), 
      },
    );
  }
}
