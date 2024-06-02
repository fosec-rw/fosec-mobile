// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/login_page.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  // Simulated authentication check
  bool isUserLoggedIn() {
    // Replace this with actual authentication logic
    // For example, checking a token in shared preferences or a user session
    return false; // Change this to true if you want to simulate a logged-in user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6FFD5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                // Logo
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fosec',
                    style: TextStyle(
                      fontFamily: 'Knewave', // Replace with your font name
                      fontSize: 48,
                      color: Color(0xFF1A8500),
                    ),
                  ),
                  Image.asset('icons/eco-plant.png'), // Ensure correct path
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Safe and Adequate Food Thanks to Tech',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF309219),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                if (isUserLoggedIn()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }
              },
              child: Text(
                'Get Started',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
