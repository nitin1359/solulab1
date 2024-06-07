import 'package:flutter/material.dart';
import 'package:solulab1/widgets/bgimage.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontFamily: 'Bentonsans_Regular',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: 'Bentonsans_Regular',
                            fontSize: 14,
                          ),
                        ),
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
                          onPressed: () {},
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6B50F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fixedSize: const Size(157, 57)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup_main');
                      },
                      child: const Center(
                        child: Text(
                          'Login',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
