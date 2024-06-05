// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solulab1/widgets/bgimage.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Stack(
          children: [
            BgImage(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 85.0),
                  child: Image(
                    image: AssetImage(
                      'assets/images/Group 1911.png',
                    ),
                    height: 398.0,
                    width: double.infinity,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
