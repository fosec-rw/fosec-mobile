// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fosec/components/app_bar.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/label.dart';
import 'package:fosec/components/square_tile.dart';
import 'package:fosec/components/text_field.dart';
import 'package:fosec/pages/create-account/register_form.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/welcome.dart';
import 'package:fosec/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserService userService = UserService();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final errorController = TextEditingController();
  bool _isLoading = false;

  // Save login state using SharedPreferences
  Future<void> _saveLoginState(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken); // Mark user as logged in
  }

  Future<void> _saveUserCredentials(String userFirstName, String userLastName,
      String userRole, String userPhone, String userId) async {
    SharedPreferences userPrefs = await SharedPreferences.getInstance();
    await userPrefs.setString('firstName', userFirstName);
    await userPrefs.setString('lastName', userLastName);
    await userPrefs.setString('role', userRole);
    await userPrefs.setString('phone', userPhone);
    await userPrefs.setString('id', userId);
    // print(userRole);
  }

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
                        FieldLabel(
                          label: "Phone *",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormTextField(
                          controller: phoneController,
                          obscureText: false,
                          hintText: "Enter your phone number",
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
                          hintText: "Enter your password",
                        ),
                        SizedBox(height: 10),
                        Text(
                          errorController.text,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 10),

                        SizedBox(height: 16.0),
                        Button(
                          text: _isLoading ? "Loading..." : "Sign In",
                          onPressed: _isLoading
                              ? null
                              : () async {
                                  setState(() {
                                    _isLoading = true; // Start loading
                                  });

                                  try {
                                    final response =
                                        await userService.loginUser({
                                      'phone': phoneController.text,
                                      'password': passwordController.text,
                                    });

                                    final responseData = json.decode(response);
                                    if (responseData
                                        .containsKey('accessToken')) {
                                      await _saveLoginState(
                                        responseData['accessToken'],
                                      );
                                      await _saveUserCredentials(
                                          responseData!['user']['firstName'],
                                          responseData!['user']['lastName'],
                                          responseData!['user']['role'],
                                          responseData!['user']['phone'],
                                          responseData!['user']['id']);

                                      // Login successful, navigate to home page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                      );
                                    } else {
                                      // Handle login error (e.g., show a message)
                                      errorController.text =
                                          "Login failed - wrong credentials";
                                    }
                                  } catch (e) {
                                    // Handle other errors (e.g., network issues)
                                    errorController.text = ("Network error");
                                  } finally {
                                    setState(() {
                                      _isLoading = false; // Stop loading
                                    });
                                  }
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
