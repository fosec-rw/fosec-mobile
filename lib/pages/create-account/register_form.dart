// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fosec/components/app_bar.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/label.dart';
import 'package:fosec/components/text_field.dart';
import 'package:fosec/pages/create-account/project_form.dart';
import 'package:fosec/pages/login_page.dart';
import 'package:fosec/services/user_services.dart';

class RegisterForm extends StatefulWidget {
  final String title;
  final String formTitle;

  RegisterForm({Key? key, required this.title, required this.formTitle})
      : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final UserService userService = UserService();
  String data = 'Loading...';
  bool _isLoading = false;
  bool isError = false;

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String selectedCategory = 'Farmer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 255, 239, 1),
      body: Stack(
        children: [
          MainAppBar(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(14.0, 130.0, 14.0, 0.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.formTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FieldLabel(
                          label: "Name *",
                        ),
                        SizedBox(height: 10.0),
                        FormTextField(
                          controller: nameController,
                          obscureText: false,
                          hintText: "Enter your name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        FieldLabel(label: "Phone *"),
                        SizedBox(height: 10.0),
                        FormTextField(
                          controller: phoneController,
                          obscureText: false,
                          hintText: "Enter your phone number",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        FieldLabel(
                          label: "Password *",
                        ),
                        SizedBox(height: 10.0),
                        FormTextField(
                          controller: passwordController,
                          obscureText: true,
                          hintText: "Enter your password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category *',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  RadioListTile(
                                    title: Text(
                                      'Buyer',
                                      style: TextStyle(
                                          fontFamily: 'Outfit', fontSize: 15),
                                    ),
                                    value: 'Buyer',
                                    activeColor: Color(0xFF1A8500),
                                    groupValue: selectedCategory,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedCategory = value.toString();
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text(
                                      'Farmer',
                                      style: TextStyle(
                                          fontFamily: 'Outfit', fontSize: 15),
                                    ),
                                    value: 'Farmer',
                                    activeColor: Color(0xFF1A8500),
                                    groupValue: selectedCategory,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedCategory = value.toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Button(
                            text: _isLoading ? "Loading..." : "Next",
                            onPressed: _isLoading
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _isLoading = true; // Start loading
                                      });

                                      try {
                                        final response =
                                            await userService.registerUser({
                                          'firstName': nameController.text,
                                          'lastName': nameController
                                              .text, // Assuming you have a separate field for lastName
                                          'phone': phoneController.text,
                                          'password': passwordController.text,
                                          'role': selectedCategory,
                                        });

                                        final responseData =
                                            json.decode(response);
                                        if (responseData
                                            .containsKey('accessToken')) {
                                          // Registration successful, navigate to next page
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ProjectForm(
                                                title: "Project",
                                                formTitle:
                                                    "Project Information",
                                              ),
                                            ),
                                          );
                                        } else {
                                          // Handle registration error (e.g., show a message)
                                          print(
                                              "Registration failed: $response");
                                        }
                                      } catch (e) {
                                        // Handle other errors (e.g., network issues)
                                        print("Error during registration: $e");
                                      } finally {
                                        setState(() {
                                          _isLoading = false; // Stop loading
                                        });
                                      }
                                    }
                                  }),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 10.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => LoginPage())));
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                color: Color(0xFF1A8500),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 70.0,
            left: 40.0,
            child: Column(
              children: [
                Text(
                  widget.title,
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
