import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solulab1/home_screen.dart';
import 'package:solulab1/screens/signin.dart';
import 'package:solulab1/widgets/bgimage.dart';
import 'package:solulab1/wrapper.dart';

class SignupMain extends StatefulWidget {
  const SignupMain({super.key});

  @override
  State<SignupMain> createState() => _SignupMainState();
}

class _SignupMainState extends State<SignupMain> {
  final userIdController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorMessage = '';
  bool _obscurePassword = true;
  bool keepSignedIn = false;
  bool emailSpecialPricing = false;

  Future<void> createUserWithEmailAndPassword() async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await userCredential.user!
          .updateDisplayName(userIdController.text.trim());

      if (mounted) {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: const HomeScreen(),
          ),
        );

        await saveLoginState(true);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
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
                      'Sign Up For Free ',
                      style: TextStyle(
                          fontFamily: 'Bentonsans_Bold', fontSize: 20),
                    ),
                    const SizedBox(height: 46.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: userIdController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Image.asset('assets/images/Profile.png'),
                          contentPadding: const EdgeInsets.all(20.0),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'madeofzero . . |',
                          hintStyle: const TextStyle(
                            fontFamily: 'Bentonsans_Regular',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Image.asset('assets/images/Email.png'),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(20.0),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            fontFamily: 'Bentonsans_Regular',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Image.asset('assets/images/Lock.png'),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            child: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(20.0),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            fontFamily: 'Bentonsans_Regular',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 19.0),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                keepSignedIn = !keepSignedIn;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  keepSignedIn
                                      ? Icons.check_circle
                                      : Icons.circle_outlined,
                                  color: const Color(0xff6B50F6),
                                ),
                                const SizedBox(width: 8.0),
                                const Text(
                                  'Keep Me Signed In',
                                  style: TextStyle(
                                    fontFamily: 'Bentonsans_Book',
                                    fontSize: 12,
                                    color: Color(0xFF22242E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          InkWell(
                            onTap: () {
                              setState(() {
                                emailSpecialPricing = !emailSpecialPricing;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  emailSpecialPricing
                                      ? Icons.check_circle
                                      : Icons.circle_outlined,
                                  color: const Color(0xff6B50F6),
                                ),
                                const SizedBox(width: 8.0),
                                const Text(
                                  'Email Me About Special Pricing',
                                  style: TextStyle(
                                    fontFamily: 'Bentonsans_Book',
                                    fontSize: 12,
                                    color: Color(0xFF22242E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 43.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6B50F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fixedSize: const Size(175, 57)),
                      onPressed: () {
                        createUserWithEmailAndPassword();
                      },
                      child: const Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            fontFamily: 'BentonSans_Bold',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const Signin(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF6B50F6),
                      ),
                      child: const Text(
                        'already have an account?',
                        style: TextStyle(
                            fontFamily: 'Bentonsans_Medium',
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const SizedBox(height: 36.0),
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
