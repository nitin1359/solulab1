import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solulab1/utils/custom_elevated_button.dart';
import 'package:solulab1/screens/onboarding/onboarding3.dart';
import 'package:solulab1/widgets/bgimage.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

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
                    padding: EdgeInsets.only(top: 107.0),
                    child: Image(
                      image: AssetImage(
                        'assets/images/Group 1911.png',
                      ),
                      height: 398.0,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 48.0),
                  const Text(
                    'Find your Comfort\nFood here',
                    style: TextStyle(
                      fontFamily: 'Bentonsans_Bold',
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Here You Can find a chef or dish for every\ntaste and color. Enjoy!',
                    style: TextStyle(
                      fontFamily: 'Bentonsans_Book',
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48.0),
                  CustomElevatedButton(
                    buttonText: 'Next',
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const OnBoarding3(),
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
