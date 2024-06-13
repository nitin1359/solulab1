import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solulab1/screens/signin.dart';
import 'package:solulab1/wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      if (mounted) {
        // Check if the widget is still in the widget tree
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Signin(),
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
                  'Signout Button',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
