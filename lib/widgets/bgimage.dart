import 'package:flutter/material.dart';
import 'dart:math' as math;

class BgImage extends StatelessWidget {
  const BgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Colors.transparent,
          Colors.white60,
          Colors.white70,
          Colors.white.withOpacity(0.8),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        // transform: GradientRotation(math.pi / 2),
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Pattern.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            // colorFilter: ColorFilter.mode(Colors.black12, BlendMode.luminosity),
          ),
        ),
      ),
    );
  }
}
