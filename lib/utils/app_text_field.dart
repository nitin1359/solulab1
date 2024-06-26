import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.black,
      ),
      validator: (value) {
        if (value!.isEmpty) return "Field is required";
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Bentonsans_Regular',
          fontSize: 14,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
Widget assign2TextField({
  required String text,
  required String fontFamily,
  required double fontSize,
  Color? color,
}) {
  return SizedBox(
    width: 233.0,
    height: 82.0,
    child: Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
      ),
    ),
  );
}
