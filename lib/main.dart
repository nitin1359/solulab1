import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solulab1/firebase_options.dart';
import 'package:solulab1/screens/home_screen.dart';
import 'package:solulab1/screens/onboarding/onboarding2.dart';
import 'package:solulab1/screens/onboarding/onboarding3.dart';
import 'package:solulab1/screens/authentication/signin.dart';
import 'package:solulab1/screens/authentication/signup_main.dart';
import 'package:solulab1/navigation/wrapper.dart';
import 'package:solulab1/services/notification_services.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler); 
  
  runApp(const MyApp()); 
}
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print(message.data.toString());
    print(message.notification!.body.toString());
    // Just checking message structure here
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    
    super.initState();
    notificationServices .requestNotificationPermission();
    notificationServices.foregroundMessage();
    // notificationServices .isTokenRefresh();
    notificationServices .firebaseInit(context);
    notificationServices .getDeviceToken().then((value){
      if (kDebugMode) {
        print('FCM Token: $value');
      }
    });
    

  }
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
