// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:fosec/components/app_bar.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/label.dart';
import 'package:fosec/components/text_field.dart';

class RegisterForm extends StatefulWidget {
  final String title;
  final String formTitle;

  RegisterForm({Key? key, required this.title, required this.formTitle})
      : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 255, 239, 1),
      body: Stack(
        children: [
          MainAppBar(),
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(14.0, 130.0, 14.0, 0.0),
                padding: EdgeInsets.all(15.0),
                height: 430,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
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
                      hintText: "example@gmail.com",
                    ),
                    SizedBox(height: 16.0),
                    FieldLabel(label: "Phone *"),
                    SizedBox(height: 10.0),
                    FormTextField(
                      controller: nameController,
                      obscureText: true,
                      hintText: "example@gmail.com",
                    ),
                    SizedBox(height: 16.0),
                    FieldLabel(
                      label: "Password *",
                    ),
                    SizedBox(height: 10.0),
                    FormTextField(
                      controller: nameController,
                      obscureText: false,
                      hintText: "example@gmail.com",
                    ),
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
                  child: Text(
                    "Already have an account? Sign in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              )
            ],
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
