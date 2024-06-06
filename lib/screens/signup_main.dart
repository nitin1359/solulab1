import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solulab1/widgets/bgimage.dart';

class SignupMain extends StatelessWidget {
  const SignupMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          BgImage(),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 55.0),
                  child: Image(
                    image: AssetImage('assets/images/Group 1910.png'),
                    height: 214.85,
                    width: 120,
                  ),
                ),
                SizedBox(height: 47.15),
                Text(
                  'Login To Your Account',
                  style: TextStyle(fontFamily: 'Bentonsans_Bold', fontSize: 20),
                ),
                SizedBox(height: 40.0),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 57.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    labelText: 'Email',
                    hintText: 'Enter your Email',
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
