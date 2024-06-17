import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solulab1/firebase_options.dart';
import 'package:solulab1/home_screen.dart';
import 'package:solulab1/screens/onboarding2.dart';
import 'package:solulab1/screens/onboarding3.dart';
import 'package:solulab1/screens/signin.dart';
import 'package:solulab1/screens/signup_main.dart';
import 'package:solulab1/screens/signup_process.dart';
import 'package:solulab1/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Wrapper(),
      routes: {
          '/onboarding2': (context) => const OnBoarding2(),
          '/onboarding3': (context) => const OnBoarding3(),
          '/signin': (context) => const Signin(),
          '/signup_main': (context) => const SignupMain(),
          '/signup_process': (context) =>  SignupProcess(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}