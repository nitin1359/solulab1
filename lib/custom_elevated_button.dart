import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'main.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.buttonText, required this.routeName});

  final String buttonText;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6B50F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        fixedSize: const Size(175, 57),
      ),
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft, 
            child: routes[routeName]!(context), // Fixed route
          ),
        );
      },
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            fontFamily: 'BentonSans_Bold',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}