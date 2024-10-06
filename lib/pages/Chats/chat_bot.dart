// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Message> _messages = []; // List to hold chat messages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: Color(0xFF24880C),
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
              backgroundImage: AssetImage('images/chat-box.png'),
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Chat',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins')),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageItem(_messages[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                CircleAvatar(
                  backgroundColor: Color(0xFF4CAF50),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      _sendMessage();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(Message message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: message.isCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 5.0,
            color: message.isCurrentUser ? Color(0xFFDCF8C6) : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                message.text,
                style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            DateFormat.jm().format(DateTime.now()),
            style: TextStyle(
                color: Colors.grey, fontSize: 12.0, fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage() async {
    String text = _textEditingController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(
          Message(
            text: text,
            isCurrentUser: true,
            time: DateTime.now(),
          ),
        );
      });

      _textEditingController.clear(); // Clear text input field

      final response = await _fetchResponseFromChatbot(text);
      setState(() {
        _messages.add(
          Message(
            text: response,
            isCurrentUser: false,
            time: DateTime.now(),
          ),
        );
      });
    }
  }

  Future<String> _fetchResponseFromChatbot(String prompt) async {
    final url = Uri.parse('https://red-hill-4858.fly.dev/chat?prompt=$prompt');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load chatbot response');
    }
  }
}

class Message {
  final String text;
  final bool isCurrentUser;
  final DateTime time;

  Message(
      {required this.text, required this.isCurrentUser, required this.time});
}
