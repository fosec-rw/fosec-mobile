// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/components/button.dart';
import 'package:fosec/pages/homepage.dart';
import 'package:fosec/pages/location/geotracking.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final List<String> _suggestions = [
    'Nyabihu',
    'Musanze',
    'Murindi',
    'Nyaruguru',
    'Gisagara',
    'Gakenke',
    'Nyagatare',
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
    _controller.dispose(); // Keep this as is
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Nyabihu',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  fillColor: Color(0XFFF8FFF7),
                  focusColor: kPrimaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              if (_filteredSuggestions.isNotEmpty)
                SizedBox(
                  height: 100,
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
                  // Check if the text field is empty
                  if (_controller.text.isEmpty) {
                    // Show alert dialog suggesting to track location
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('No Location Set'),
                        content: Text(
                            "The location field cannot be empty. Would you like to track your location instead?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GeoTracking()));
                            },
                            child: Text(
                              'Track Location',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Show alert dialog when button is pressed
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text("Location set to: ${_controller.text}"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
                text: 'Confirm',
              ),
              SizedBox(height: 35),
              Icon(
                Icons.location_on,
                size: 100,
                color: kPrimaryColor,
              ),
              Text(
                'Track your location?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Allow to track your geolocation for better\nresults and save your time.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GeoTracking()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF0F4901),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Track my Location',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const kPrimaryColor = Color(0xFF1A8500);
}
