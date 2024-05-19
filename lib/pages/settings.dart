// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
          ),
          _buildSettingsOption(
            icon: Icons.qr_code_scanner,
            title: 'QR scan',
          ),
          _buildSettingsOption(
            icon: Icons.perm_device_information,
            title: 'Permissions',
          ),
          _buildSettingsOption(
            icon: Icons.brightness_4,
            title: 'Theme',
          ),
          SizedBox(height: 32.0),
          _buildLogoutOption(),
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

  Widget _buildSettingsOption({required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(icon, color: kPrimaryColor),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      onTap: () {
        // Handle onTap if required
      },
    );
  }

  Widget _buildLogoutOption() {
    return ListTile(
      leading: Icon(Icons.power_settings_new, color: kLogoutColor),
      title: Text(
        'Log out',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: kLogoutColor,
            fontFamily: 'Poppins'),
      ),
      onTap: () {
        // Handle log out action
      },
    );
  }
}
