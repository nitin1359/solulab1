import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:solulab1/firebase_options.dart';
import 'package:solulab1/screens/home_screen.dart';
import 'package:solulab1/screens/onboarding2.dart';
import 'package:solulab1/screens/onboarding3.dart';
import 'package:solulab1/screens/signin.dart';
import 'package:solulab1/screens/signup_main.dart';
import 'package:solulab1/screens/signup_process.dart';
import 'package:solulab1/wrapper.dart';



Future<void> requestNotificationPermissions() async {
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  ); 
}

@pragma('vm:entry-point') // Necessary for background message handling on iOS
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // This function is called when the app receives a message in the background.
  // You can handle the message here, e.g., show a notification or update data.
  print('Handling a background message: ${message.messageId}');
  print('Message data: ${message.data}'); 
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  
  await requestNotificationPermissions();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
          // '/signup_process': (context) =>  SignupProcess(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}