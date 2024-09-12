// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/pages/Chats/messages_list.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/profile.dart';
import 'package:fosec/pages/settings.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final List<String> _suggestions = [
    'Kigali city, Kicukiro, KK 457 St',
    'Kigali city, Nyarugenge, KN 457 AV',
    'Kigali city, Kicukiro',
    'Kigali city, Kicukiro, Kanombe',
    'Kigali city, Kicukiro, KK 457 St',
    'Kigali city, Kicukiro, KK 457 St',
    'Kigali city, Kicukiro, KK 457 St',
  ];
  final TextEditingController _controller = TextEditingController();
  List<String> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _filteredSuggestions = _suggestions
            .where((item) =>
                item.toLowerCase().contains(_controller.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Location'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Kigali, Nyarugenge, KN 457 AV',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  focusColor: kPrimaryColor,
                  fillColor: Color(0XFFF8FFF7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              if (_filteredSuggestions.isNotEmpty)
                Container(
                  child: ListView.builder(
                    itemCount: _filteredSuggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          _filteredSuggestions[index],
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                        ),
                        onTap: () {
                          _controller.text = _filteredSuggestions[index];
                          setState(() {
                            _filteredSuggestions.clear();
                          });
                        },
                      );
                    },
                  ),
                ),
              SizedBox(height: 20),
              Button(
                onPressed: () {
                  // Handle confirm action
                },
                text: 'Confirm',
              ),
              SizedBox(
                height: 35,
              ),
              Icon(
                Icons.location_on,
                size: 100,
                color: kPrimaryColor,
              ),
              Text(
                'Track your location ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Allow to track your geolocation ? for better\nresults and save your time',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle track my location action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF0F4901),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Track my Location'),
              ),
            ],
          ),
        
      ),
    );
  }

  static const kPrimaryColor = Color(0xFF1A8500);
}
