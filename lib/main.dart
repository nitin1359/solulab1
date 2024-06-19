import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:solulab1/firebase_options.dart';
import 'package:solulab1/screens/home_screen.dart';
import 'package:solulab1/screens/onboarding/onboarding2.dart';
import 'package:solulab1/screens/onboarding/onboarding3.dart';
import 'package:solulab1/screens/authentication/signin.dart';
import 'package:solulab1/screens/authentication/signup_main.dart';
import 'package:solulab1/navigation/wrapper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> requestNotificationPermissions() async {
  await FirebaseMessaging.instance.requestPermission(
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
  // Display the notification using flutter_local_notifications
  flutterLocalNotificationsPlugin.show(
    message.hashCode, // Unique notification ID
    message.notification?.title ?? 'Notification Title',
    message.notification?.body ?? 'Notification Body',
    NotificationDetails(
      android: AndroidNotificationDetails(
        'your_channel_id', // Replace with your channel ID
        'your_channel_name', // Replace with your channel name
        importance: Importance.max,
        priority: Priority.high,
      ),
      // Add iOS details if needed
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher'); // Use your app icon
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: null, // Add iOS settings if needed
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

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
      home: Wrapper(),
      routes: {
        '/onboarding2': (context) => const OnBoarding2(),
        '/onboarding3': (context) => const OnBoarding3(),
        '/signin': (context) => const Signin(),
        '/signup_main': (context) => const SignupMain(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
