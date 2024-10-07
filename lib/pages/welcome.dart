// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool _isLoading = true;
  String? _accessToken;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Implementing Shared Preferences
  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken'); // Fetch accessToken

    setState(() {
      _accessToken = accessToken;
      _isLoading = false; // No longer loading, show the Get Started button
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: Color(0xFFD6FFD5),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
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
                // Navigate to HomePage if logged in, otherwise to LoginPage
                if (_accessToken != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
