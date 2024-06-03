// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/label.dart';
import 'package:fosec/components/text_field.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  bool obscureText = false; // Placeholder for the obscureText property

  void handleUpdateUser() {
    // Your update logic here
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String phoneNumber = phoneNumberController.text;
    String email = emailController.text;
    String location = locationController.text;

    // // Update user logic
    // // For example, make an API call to update the user profile
    // print("First Name: $firstName");
    // print("Last Name: $lastName");
    // print("Phone Number: $phoneNumber");
    // print("Email: $email");
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF1A8500),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Profile",
          style: TextStyle(
              color: Color(
                0xFF1A8500,
              ),
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20), // Optional: Add some space at the top
                Text(
                  "About me",
                  style: TextStyle(
                      fontFamily: 'Outfit', fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Image.asset("images/profile.png"),
                SizedBox(
                  height: 5,
                ),
                FieldLabel(label: "First name"),
                FormTextField(
                  controller: firstNameController,
                  obscureText: obscureText,
                ),
                SizedBox(
                  height: 5,
                ),
                FieldLabel(label: "Last name"),
                FormTextField(
                  controller: lastNameController,
                  obscureText: obscureText,
                ),
                SizedBox(
                  height: 5,
                ),
                FieldLabel(label: "Phone number"),
                FormTextField(
                  controller: phoneNumberController,
                  obscureText: obscureText,
                ),
                SizedBox(
                  height: 5,
                ),
                FieldLabel(label: "Email"),
                FormTextField(
                  controller: emailController,
                  obscureText: obscureText,
                ),
                SizedBox(
                  height: 5,
                ),
                FieldLabel(label: "Location"),
                FormTextField(
                    controller: locationController, obscureText: false),
                SizedBox(height: 20),
                Button(
                  text: "Update",
                  onPressed: handleUpdateUser,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
