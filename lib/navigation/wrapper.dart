import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solulab1/main.dart';
import 'package:solulab1/screens/home_screen.dart';
import 'package:solulab1/screens/onboarding/onboarding1.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        // Handle foreground messages here
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getLoginState(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return HomeScreen();
            } else {
              return OnBoarding1();
            }
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Future<void> saveLoginState(bool isLoggedIn) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', isLoggedIn);
}

Future<bool> getLoginState() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}
