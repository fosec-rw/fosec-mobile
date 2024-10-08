// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/components/message_tile.dart';
import 'package:fosec/pages/Chats/messages_list.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/profile.dart';
import 'package:fosec/pages/settings.dart';
import 'package:fosec/pages/tips/tips.dart';
import 'package:intl/intl.dart';

const kBackgroundColor = Color(0xFFEFFFEF);
const kPrimaryColor = Color(0xFF1A8500);
const kSecondaryColor = Color(0xFF444444);
const kLogoutColor = Color(0xFFEA4335);
const kGreyColor = Color(0xFF808080);
const kPadding = EdgeInsets.all(10.0);

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            // handle back press
          },
        ),
        title: Text('Notifications',
            style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
      ),
      body: ListView.builder(
        itemCount: 1, // or use the actual length of your messages list
        itemBuilder: (context, index) {
          return MessageTile(
            child: ListTile(
              subtitle: Text(
                'New Tips available ...',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 10),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    DateFormat.jm().format(DateTime.now()),
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 11),
                  ),
                  Icon(Icons.check_circle, color: Color(0xFF0F4901), size: 20),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TipsPage(),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MessagesListScreen()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdateProfile()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kGreyColor,
      ),
    );
  }
}
