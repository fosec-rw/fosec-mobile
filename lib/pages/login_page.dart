// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fosec/components/app_bar.dart';
import 'package:fosec/components/button.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient App Bar
          MainAppBar(),

          // Login Form
          Container(
            margin: EdgeInsets.fromLTRB(14.0, 140.0, 14.0, 75.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add your login form widgets here
                // For example: TextFields, Buttons, etc.
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: const Color.fromARGB(255, 226, 246, 220),
                      filled: true,
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.grey[500])),
                ),
                SizedBox(height: 16.0),
                
                SizedBox(height: 16.0),
                Button(text: "Sign In", onPressed: () {  },),
              ],
            ),
          ),

          Positioned(
            top: 80.0, // Adjust the distance from the top
            left: 40.0, // Adjust the distance from the left
            child: Column(
              children: [
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
