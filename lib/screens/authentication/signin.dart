import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solulab1/utils/custom_elevated_button.dart';
import 'package:solulab1/services/firebase_auth.dart';
import 'package:solulab1/screens/home_screen.dart';
import 'package:solulab1/screens/authentication/signup_main.dart';
import 'package:solulab1/utils/app_text_field.dart';
import 'package:solulab1/widgets/bgimage.dart';
import 'package:solulab1/navigation/wrapper.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String? errorMessage = '';
  bool isLogin = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;

  GestureDetector eyeToggle() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscurePassword = !_obscurePassword;
        });
      },
      child: Icon(
        _obscurePassword ? Icons.visibility : Icons.visibility_off,
      ),
    );
  }

  void signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((userCredential) async {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Successful")),
        );
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: HomeScreen(),
          ),
        );
      }
      await saveLoginState(true);
    }).catchError(
      (e) {
        if (e is FirebaseAuthException) {
          setState(() {
            errorMessage = e.message;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.message ?? "An error occurred",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red.shade400,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BgImage(),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 55.0),
                      child: Image(
                        image: AssetImage('assets/images/Group 1910.png'),
                        height: 214.85,
                        width: 120,
                      ),
                    ),
                    const SizedBox(height: 47.15),
                    const Text(
                      'Login To Your Account',
                      style: TextStyle(
                          fontFamily: 'Bentonsans_Bold', fontSize: 20),
                    ),
                    const SizedBox(height: 40.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: AppTextField(
                          controller: emailController, hintText: 'Email'),
                    ),
                    const SizedBox(height: 12.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: AppTextField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        hintText: 'Password',
                        suffixIcon: eyeToggle(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Or Continue With',
                      style: TextStyle(
                        fontFamily: 'Bentonsans_Bold',
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/facebook-icon.png',
                            height: 25,
                            width: 25,
                          ),
                          label: const Text(
                            'Facebook',
                            style: TextStyle(
                              fontFamily: 'Bentonsans_Medium',
                              fontSize: 14,
                              color: Color(0xFF22242E),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fixedSize: const Size(152, 57),
                          ),
                        ),
                        const SizedBox(width: 21.0),
                        ElevatedButton.icon(
                          onPressed: () {
                            AuthMethods().signInWithGoogle(context);
                          },
                          label: const Text(
                            'Google',
                            style: TextStyle(
                              fontFamily: 'Bentonsans_Medium',
                              fontSize: 14,
                              color: Color(0xFF22242E),
                            ),
                          ),
                          icon: Image.asset(
                            'assets/images/google-icon.png',
                            height: 25,
                            width: 25,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            fixedSize: const Size(152, 57),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF6B50F6),
                      ),
                      child: const Text(
                        'Forgot Your Password?',
                        style: TextStyle(
                            fontFamily: 'Bentonsans_Medium',
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const SizedBox(height: 36.0),
                    CustomElevatedButton(
                        buttonText: 'Login', onPressed: signIn),
                    const SizedBox(height: 14.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const SignupMain(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF6B50F6),
                      ),
                      child: const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            fontFamily: 'Bentonsans_Medium',
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
