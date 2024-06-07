import 'package:flutter/material.dart';
import 'package:solulab1/widgets/bgimage.dart';

class SignupProcess extends StatelessWidget {
  const SignupProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // const BgImage(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              'assets/images/Icon Back.png',
                              height: 45,
                              width: 45,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Fill in your bio to get\nstarted',
                      style: TextStyle(
                        fontFamily: 'Bentonsans_Bold',
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'This data will be displayed in your account\nprofile for security',
                      style: TextStyle(
                        fontFamily: 'Bentonsans_Regular',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      children: [
                        Padding(
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
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                fontFamily: 'Bentonsans_Regular',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Padding(
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
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                fontFamily: 'Bentonsans_Regular',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Padding(
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
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                fontFamily: 'Bentonsans_Regular',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 220.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6B50F6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              fixedSize: Size(157, 57)),
                          onPressed: () {
                            
                          },
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
