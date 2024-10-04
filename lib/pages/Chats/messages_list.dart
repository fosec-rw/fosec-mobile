// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/components/message_tile.dart';
import 'package:fosec/pages/Chats/chat_screen.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/profile.dart';
import 'package:fosec/pages/settings.dart';

const kBackgroundColor = Color(0xFFEFFFEF);
const kPrimaryColor = Color(0xFF1A8500);
const kSecondaryColor = Color(0xFF444444);
const kLogoutColor = Color(0xFFEA4335);
const kGreyColor = Color(0xFF808080);
const kPadding = EdgeInsets.all(10.0);

class MessagesListScreen extends StatelessWidget {
  const MessagesListScreen({Key? key}) : super(key: key);

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
        title: Text('Messages',
            style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
      ),
      body: ListView.builder(
        itemCount: 15, // or use the actual length of your messages list
        itemBuilder: (context, index) {
          // Here you should define your message object or model
          // Let's assume you have a Message class with text, isCurrentUser, and time properties
          // Replace this with your actual message model
          Message message = Message(
            text: 'Hello',
            isCurrentUser: true,
            time: DateTime.now(),
          );

          return MessageTile(
            child: ListTile(
              leading: Icon(
                Icons.person_4,
                size: 30,
                color: kPrimaryColor,
              ),
              title: Text(
                'Lauren Spencer',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                'Tractors have revolutionized modern farming practices...',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 10),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '2:37 PM',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 11),
                  ),
                  Icon(Icons.check_circle, color: Color(0xFF0F4901), size: 20),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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

class Message {
  final String text;
  final bool isCurrentUser;
  final DateTime time;

  Message({
    required this.text,
    required this.isCurrentUser,
    required this.time,
  });
}
