import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solulab1/app_text_field.dart';
import 'package:solulab1/custom_elevated_button.dart';
import 'package:solulab1/screens/signup_main.dart';

class SignupProcess extends StatelessWidget {
  SignupProcess({super.key});

  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final mobileNumberController = TextEditingController();

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
                          onPressed: () {},
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
