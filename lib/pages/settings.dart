// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fosec/pages/location/location.dart';
import 'package:fosec/pages/login_page.dart';
import 'package:fosec/pages/profile.dart';
import 'package:fosec/pages/qr-code/generate_code.dart';
import 'package:fosec/pages/qr-code/start_scanning.dart';

const kBackgroundColor = Color(0xFFEFFFEF);
const kPrimaryColor = Color(0xFF1A8500);
const kSecondaryColor = Color(0xFF444444);
const kLogoutColor = Color(0xFFEA4335);
const kPadding = EdgeInsets.all(10.0);

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'Poppins'),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader('Account settings'),
          _buildSettingsOption(
            icon: Icons.person,
            title: 'Profile',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpdateProfile()));
            },
          ),
          _buildSettingsOption(
            icon: Icons.phone,
            title: 'Phone number',
          ),
          _buildSettingsOption(
            icon: Icons.email,
            title: 'Email',
          ),
          _buildSettingsOption(
            icon: Icons.lock,
            title: 'Password',
          ),
          _buildSettingsOption(
            icon: Icons.language,
            title: 'Language',
          ),
          SizedBox(height: 16.0),
          _buildSectionHeader('App settings'),
          _buildSettingsOption(
              icon: Icons.location_on,
              title: 'Location',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Location())));
              }),
          _buildSettingsOption(
              icon: Icons.qr_code_scanner,
              title: 'QR scan',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ScanCode())));
              }),
          _buildSettingsOption(
              icon: Icons.qr_code_scanner,
              title: 'QR generate',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => GenerateCode())));
              }),
          _buildSettingsOption(
            icon: Icons.perm_device_information,
            title: 'Permissions',
          ),
          _buildSettingsOption(
            icon: Icons.brightness_4,
            title: 'Theme',
          ),
          SizedBox(height: 32.0),
          _buildLogoutOption(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingsOption(
      {required IconData icon, required String title, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: kPrimaryColor),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }

  Widget _buildLogoutOption(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.power_settings_new, color: kLogoutColor),
      title: Text(
        'Log out',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: kLogoutColor,
            fontFamily: 'Poppins'),
      ),
      onTap: () async {
        // Clear login status
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('accessToken');

        //Navigate to login page
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false,
        );
      },
    );
  }
}
