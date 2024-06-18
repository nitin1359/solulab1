import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.buttonText, required this.onPressed,});

  final String buttonText;
  final VoidCallback onPressed;
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
      onPressed: onPressed,
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
