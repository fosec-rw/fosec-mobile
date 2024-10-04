// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fosec/components/app_bar.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/label.dart';
import 'package:fosec/components/text_field.dart';
import 'package:fosec/pages/create-account/finish.dart';
import 'package:fosec/pages/login_page.dart';
import 'package:fosec/services/project_services.dart';

class ProjectForm extends StatefulWidget {
  final String title;
  final String formTitle;

  ProjectForm({Key? key, required this.title, required this.formTitle})
      : super(key: key);

  @override
  State<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  final ProjectService projectService = ProjectService();
  String data = 'Loading ...';
  bool _isLoading = false;
  bool isError = false;

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final errorController = TextEditingController();

  void onPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 255, 239, 1),
      body: Stack(
        children: [
          MainAppBar(onPressed: onPressed),
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
                          label: "Project Name *",
                        ),
                        SizedBox(height: 10.0),
                        FormTextField(
                          controller: nameController,
                          obscureText: false,
                          hintText: "Enter project name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the project name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        
                        FieldLabel(
                          label: "Description for the project *",
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: descriptionController,
                          maxLines: null,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade700),
                            ),
                            fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            filled: true,
                            hintText: "Enter project description",
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w100,
                              fontSize: 15,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the project description';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        Button(
                          text: _isLoading ? data : "Next",
                          onPressed: _isLoading
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _isLoading = true; // Start loading
                                    });

                                    try {
                                      final response = await projectService
                                          .createProject({
                                        'name': nameController.text,
                                        'description':
                                            descriptionController.text
                                      });

                                      final responseData =
                                          json.decode(response);
                                      if (responseData
                                          .containsKey('accessToken')) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FinishRegister()));
                                      } else {
                                        // Handle registration error (e.g., show a message)
                                        debugPrint(
                                            "Registration failed: $response");
                                        errorController.text =
                                            "Registration failed, try again";
                                      }
                                    } catch (e) {
                                      // Handle other errors (e.g., network issues)
                                      debugPrint(
                                          "Error during registration: $e");
                                      errorController.text =
                                          "Our servers are down, try again later";
                                    } finally {
                                      setState(() {
                                        _isLoading = false; // Stop loading
                                      });
                                    }
                                  }
                                },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
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
