// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/label.dart';
import 'package:fosec/components/text_field.dart';
import 'package:fosec/pages/Chats/messages_list.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/settings.dart';

const kPrimaryColor = Color(0xFF1A8500);
const kGreyColor = Color(0xFF808080);

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

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
      } else if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessagesListScreen()),
        );
      } else if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: "Messages",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kGreyColor,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}
