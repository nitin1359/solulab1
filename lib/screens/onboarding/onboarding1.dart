import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solulab1/screens/onboarding/onboarding2.dart';
import 'package:solulab1/widgets/bgimage.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({
    super.key,
  });
 
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Future.delayed(
          const Duration(seconds: 3),
          () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: const OnBoarding2(),
              ),
            );
          },
        );
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BgImage(),
            Positioned(
              top: (MediaQuery.of(context).size.height - 400.0) /
                  3, // One-third of screen height
              left: (MediaQuery.of(context).size.width - 172.0) / 2,
              child: const Image(
                image: AssetImage(
                  'assets/images/Group 1909.png',
                ),
                width: 172.0,
                height: 328.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
