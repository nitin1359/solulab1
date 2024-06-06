import 'package:flutter/material.dart';
import 'package:solulab1/widgets/bgimage.dart';


class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          );
  }
}
