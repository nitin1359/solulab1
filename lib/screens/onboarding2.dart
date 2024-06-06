// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solulab1/widgets/bgimage.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BgImage(),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 107.0),
              child: Image(
                image: AssetImage(
                  'assets/images/Group 1911.png',
                ),
                height: 398.0,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 48.0),
            Text(
              'Find your Comfort\nFood here',
              style: TextStyle(
                fontFamily: 'Bentonsans_Bold',
                fontSize: 22.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Here You Can find a chef or dish for every\ntaste and color. Enjoy!',
              style: TextStyle(
                fontFamily: 'Bentonsans_Book',
                fontSize: 12.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6B50F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                fixedSize: Size(157, 57)
                
              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: 'BentonSans_Bold',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
