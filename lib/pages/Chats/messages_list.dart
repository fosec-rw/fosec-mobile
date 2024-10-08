// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:fosec/components/message_tile.dart';
import 'package:fosec/pages/Chats/chat_screen.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/profile.dart';
import 'package:fosec/pages/settings.dart';
import 'package:intl/intl.dart';

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
    // List of messages from different users
    List<Message> messages = [
      Message(
          text: 'Hey, how are you?',
          isCurrentUser: true,
          time: DateTime.now(),
          userName: 'Kaze Joanna'),
      Message(
          text: 'Tractors have revolutionized...',
          isCurrentUser: false,
          time: DateTime.now(),
          userName: 'Habimana Jean'),
      Message(
          text: 'Are we still meeting later?',
          isCurrentUser: true,
          time: DateTime.now(),
          userName: 'Alice Mukamana'),
      Message(
          text: 'I loved the presentation...',
          isCurrentUser: false,
          time: DateTime.now(),
          userName: 'Didier Mugabo'),
      Message(
          text: 'Can you send me the documents?',
          isCurrentUser: true,
          time: DateTime.now(),
          userName: 'Muteteri'),
    ];

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
          },
        ),
        title: Text('Messages',
            style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
      ),
      body: ListView.builder(
        itemCount:
            messages.length, // use the actual length of the messages list
        itemBuilder: (context, index) {
          Message message = messages[index];

          return MessageTile(
            child: ListTile(
              leading: Icon(
                Icons.person_4,
                size: 30,
                color: kPrimaryColor,
              ),
              title: Text(
                message.userName, // User name from the message
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                message.text, // Message text
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
                    builder: (context) => ChatPage(
                        title:
                            message.userName), // Pass the user name to ChatPage
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

// Message class with additional userName field
class Message {
  final String text;
  final bool isCurrentUser;
  final DateTime time;
  final String userName; // Add user name

  Message({
    required this.text,
    required this.isCurrentUser,
    required this.time,
    required this.userName,
  });
}
