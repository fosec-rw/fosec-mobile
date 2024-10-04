// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:fosec/pages/Chats/messages_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;

const kBackgroundColor = Color(0xFFEFFFEF);
const kPrimaryColor = Color(0xFF1A8500);
const kSecondaryColor = Color(0xFF444444);
const kLogoutColor = Color(0xFFEA4335);
const kPadding = EdgeInsets.all(10.0);

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  late types.User _user; // Declared at class level
  bool _isLoading = true; // For loading state

  @override
  void initState() {
    super.initState();
    _getUserCredentials();
  }

  Future<void> _getUserCredentials() async {
    SharedPreferences userPrefs = await SharedPreferences.getInstance();

    String? firstName = userPrefs.getString('firstName') ?? 'Guest';
    String? lastName = userPrefs.getString('lastName') ?? '';
    String? userId = userPrefs.getString('id') ?? 'unknown';

    // Set up user object for the chat
    setState(() {
      _user = types.User(
        id: userId!,
        firstName: firstName,
        lastName: lastName,
      );
      _isLoading = false; // Finished loading user data
    });

    print('User First Name: $firstName');
    print('User ID: $userId');
    print('Last Name: $lastName');
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: UniqueKey().toString(),
      text: message.text,
    );
    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    print("Sending message: $message");
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/profile.png'),
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Chat",
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                Text('online',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontFamily: 'Poppins')),
              ],
            ),
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child:
                  CircularProgressIndicator()) // Show loader while fetching data
          : Chat(
              messages: _messages,
              onSendPressed: _handleSendPressed,
              user: _user,
              theme: DefaultChatTheme(
                  sentMessageBodyTextStyle:
                      TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  inputTextColor: Colors.black,
                  receivedMessageBodyTextStyle:
                      TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  inputBackgroundColor: kBackgroundColor,
                  backgroundColor: Colors.white,
                  inputBorderRadius: BorderRadius.all(Radius.circular(64)),
                  sendButtonIcon: Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  primaryColor: kPrimaryColor,
                  systemMessageTheme: SystemMessageTheme(
                    margin: EdgeInsets.all(2),
                    textStyle: TextStyle(color: kBackgroundColor),
                  )),
            ),
    );
  }
}
