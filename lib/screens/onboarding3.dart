import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solulab1/utils/custom_elevated_button.dart';
import 'package:solulab1/screens/signup_main.dart';
import 'package:solulab1/widgets/bgimage.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BgImage(),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 123.0),
                    child: Image(
                      image: AssetImage(
                        'assets/images/Group 1912.png',
                      ),
                      height: 370.0,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 66.0),
                  const Text(
                    'DIDFOOD is Where Your\nComfort Food Lives',
                    style: TextStyle(
                      fontFamily: 'Bentonsans_Bold',
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Enjoy a fast and smooth food delivery at\nyour doorstep',
                    style: TextStyle(
                      fontFamily: 'Bentonsans_Book',
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 42.0),
                  CustomElevatedButton(
                    buttonText: 'Next',
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const SignupMain(),
                        ),
                      );
                    },
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
