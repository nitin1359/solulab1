import 'package:flutter/material.dart';
import 'package:solulab1/screens/signin.dart';
import 'package:solulab1/screens/signup_main.dart';
import 'package:solulab1/screens/signup_process.dart';
import 'package:solulab1/widgets/bgimage.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoarding1(),
      routes: {
        '/onboarding2': (context) => const OnBoarding2(),
        '/onboarding3': (context) => const OnBoarding3(),
        '/signin': (context) => const Signin(),
        '/signup_main': (context) => const SignupMain(),
        '/signup_process': (context) => const SignupProcess(),
      },
    );
  }
}
