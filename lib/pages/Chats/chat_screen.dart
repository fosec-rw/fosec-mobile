// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  types.User? _user; // Nullable until we get the user data

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser(); // Fetch the user data when the screen loads
  }

  Future<void> _fetchCurrentUser() async {
    try {
      final url = Uri.parse('https://red-hill-4858.fly.dev/api/v1/user/me');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Parse the JSON and initialize the user
        setState(() {
          _user = types.User(
            id: data['id'], // Ensure this matches the API response structure
            firstName: data['first_name'], // Adapt this to your API fields
            lastName: data['last_name'],
          );
        });
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      print('Error fetching user: $e');
    }
  }

  void _handleSendPressed(types.PartialText message) {
    if (_user == null)
      return; // Prevent sending messages if the user is not yet fetched

    final textMessage = types.TextMessage(
      author: _user!,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: UniqueKey().toString(),
      text: message.text,
    );
    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/profile.png'),
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "John Doe",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'online',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
      body: _user == null
          ? Center(
              child:
                  CircularProgressIndicator()) // Show loading while user data is being fetched
          : Chat(
              messages: _messages,
              onSendPressed: _handleSendPressed,
              user: _user!, // User is now non-nullable
            ),
    );
  }
}
