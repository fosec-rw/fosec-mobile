// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fosec/components/app_bar.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/text_field.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 255, 239, 1),
      body: Stack(
        children: [
          // Gradient App Bar
          MainAppBar(),

          // Login Form
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(14.0, 130.0, 14.0, 14.0),
                padding: EdgeInsets.all(16.0),
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Add your login form widgets here
                    // For example: TextFields, Buttons, etc.
                    FormTextField(
                        controller: nameController,
                        obscureText: false,
                        hintText: "Name"),
                    SizedBox(height: 16.0),
                    FormTextField(
                        controller: nameController,
                        obscureText: true,
                        hintText: "Password"),
                    SizedBox(height: 16.0),

                    Button(
                      text: "Next",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(14.0, 50.0, 14.0, 14.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text("Already have an account? Sign in"),
              )
            ],
          ),

          Positioned(
            top: 70.0, // Adjust the distance from the top
            left: 40.0, // Adjust the distance from the left
            child: Column(
              children: [
                Text(
                  'Create Account',
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
