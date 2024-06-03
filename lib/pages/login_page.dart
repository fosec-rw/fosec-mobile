// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fosec/components/app_bar.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/label.dart';
import 'package:fosec/components/square_tile.dart';
import 'package:fosec/components/text_field.dart';
import 'package:fosec/pages/create-account/register_form.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/welcome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient App Bar
          MainAppBar(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetStartedScreen()));
            },
          ),

          // Scrollable Login Form
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                children: [
                  SizedBox(height: 120.0), // Adjust top margin
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Add your login form widgets here
                        FieldLabel(
                          label: "Name *",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormTextField(
                          controller: nameController,
                          obscureText: false,
                          hintText: "example@gmail.com",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FieldLabel(
                          label: "Password *",
                        ),
                        SizedBox(height: 10.0),
                        FormTextField(
                          controller: passwordController,
                          obscureText: true,
                          hintText: "example@gmail.com",
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Remember me",
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 13),
                            ),
                            Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF0F4901),
                                  fontSize: 13),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Button(
                          text: "Sign In",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 25),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.8,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Or",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                thickness: 0.8,
                                color: Colors.grey[400],
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RectangleTile(
                              imagePath: 'icons/google.png',
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),

                        // not a member? sign up
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins'),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => RegisterForm(
                                                  formTitle:
                                                      "Personal Information",
                                                  title: "Create Account",
                                                ))));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Color(0xFF1A8500),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 70.0, // Adjust the distance from the top
            left: 40.0, // Adjust the distance from the left
            child: Column(
              children: [
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Poppins',
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
