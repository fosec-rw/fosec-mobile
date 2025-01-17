// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/components/label.dart';
import 'package:fosec/components/text_field.dart';
import 'package:fosec/pages/Chats/messages_list.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/settings.dart';
import 'package:fosec/services/update_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool _isLoading = false;
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstNameController.text = prefs.getString('firstName') ?? '';
      lastNameController.text = prefs.getString('lastName') ?? '';
      phoneNumberController.text = prefs.getString('phone') ?? '';
    });
  }

  void handleUpdateUser() async {
    setState(() {
      _isLoading = true;
    });

    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String phone = phoneNumberController.text;

    try {
      await updateUser(firstName, lastName, phone);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Profile updated sucessfully"),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error updating profile")));
    }
    setState(() {
      _isLoading = false;
    });
  }

  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessagesListScreen()),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
      } else if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
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
                Icon(
                  Icons.person_4,
                  color: kPrimaryColor,
                  size: 50,
                ),
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
                  height: 20,
                ),

                Button(
                  text: _isLoading ? "Loading..." : "Update",
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
            icon: Icon(Icons.message_rounded),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
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
