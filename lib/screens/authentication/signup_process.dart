import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:solulab1/utils/app_text_field.dart';
import 'package:solulab1/utils/custom_elevated_button.dart';
import 'package:solulab1/screens/home_screen.dart';
import 'package:solulab1/screens/authentication/signup_main.dart';
import 'package:solulab1/navigation/wrapper.dart';

class SignupProcess extends StatelessWidget {
  final String email;
  final String password;
  final String userId;

  SignupProcess({
    required this.userId,
    required this.email,
    required this.password,
    super.key,
  });

  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final mobileNumberController = TextEditingController();

  Future<void> signUp(BuildContext context) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Retrieve FCM token
        String? fcmToken = await FirebaseMessaging.instance.getToken();

        // Save additional user data to Firestore
        await FirebaseFirestore.instance.collection('User').doc(user.uid).set(
          {
            'userId': userId,
            'firstName': fnameController.text.trim(),
            'lastName': lnameController.text.trim(),
            'mobileNumber': mobileNumberController.text.trim(),
            'email': email,
            'fcmToken': fcmToken,
          },
        );
        await saveLoginState(true);

        // Navigate to home screen
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: HomeScreen(),
            ),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message ?? "An error occurred",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red.shade400,
        ),
      );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // const BgImage(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20.0),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const SignupMain(),
                              ),
                            );
                          },
                          icon: Image.asset(
                            'assets/images/Icon Back.png',
                            height: 45,
                            width: 45,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Fill in your bio to get\nstarted',
                          style: TextStyle(
                            fontFamily: 'Bentonsans_Bold',
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'This data will be displayed in your account\nprofile for security',
                          style: TextStyle(
                            fontFamily: 'Bentonsans_Regular',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Column(
                      children: [
                        AppTextField(
                            controller: fnameController,
                            hintText: 'First Name'),
                        const SizedBox(height: 20.0),
                        AppTextField(
                            controller: lnameController, hintText: 'Last Name'),
                        const SizedBox(height: 20.0),
                        AppTextField(
                            controller: mobileNumberController,
                            hintText: 'Mobile Number'),
                        const SizedBox(height: 220.0),
                        CustomElevatedButton(
                          buttonText: 'Next',
                          onPressed: (() => signUp(context)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
