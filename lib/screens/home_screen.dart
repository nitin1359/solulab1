import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solulab1/screens/authentication/signin.dart';
import 'package:solulab1/navigation/wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final user = FirebaseAuth.instance.currentUser;

  signOut() async {
    try {
      await GoogleSignIn()
          .signOut(); /*this line is used to signout 
      from google account as well, cause without this, next time when 
      someone click on it, it will direct log them using previously selected google id */

      await FirebaseAuth.instance.signOut();
      if (mounted) {
        // Check if the widget is still in the widget tree
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: const Signin(),
          ),
        );
      }
      await saveLoginState(false);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign out failed. Please try again later.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user != null) // Display user email if available
              Text(
                '${user!.email}',
                style: TextStyle(fontSize: 30),
              ),
            ElevatedButton(
                onPressed: () => signOut(), // Call signOut function
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
