// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:fosec/components/tips_card.dart';
import 'package:fosec/pages/weather.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFFFEF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Tips',
          style: TextStyle(color: kPrimaryColor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFA6F9F1), Color(0XFFB6F9A6)]),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Want to know today's weather",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            // Handle more button action
                          },
                          child: GestureDetector(
                            child: Row(
                              children: [
                                Text(
                                  'Check',
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 15,
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WeatherPage()),
                              );
                            },
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Some tips',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor),
                ),
              ),
              SizedBox(height: 20),
              Tips(
                  headline: "How to improve your irrigation skills ?",
                  description:
                      "In an era where environmental concerns have taken center stage, farmers have emerged as crucial stewards of sustainable crop growth",
                  imageUrl: 'images/image.png'),
              Tips(
                  headline: "New maize harvesting technique !",
                  description:
                      "In an era where environmental concerns have taken center stage, farmers have emerged as crucial stewards of sustainable crop growth",
                  imageUrl: 'images/image.png'),
              Tips(
                  headline: "Resist the destructive fury of storms !",
                  description:
                      "In an era where environmental concerns have taken center stage, farmers have emerged as crucial stewards of sustainable crop growth",
                  imageUrl: 'images/image.png'),
              Tips(
                  headline: "Farmers Championing Sustainable Crop Growth : ",
                  description:
                      "In an era where environmental concerns have taken center stage, farmers have emerged as crucial stewards of sustainable crop growth",
                  imageUrl: 'images/image.png'),
              Tips(
                  headline:
                      "Dear Farmers, remember to use crates not sacks for transportation : ",
                  description:
                      "In an era where environmental concerns have taken center stage, farmers have emerged as crucial stewards of sustainable crop growth",
                  imageUrl: 'images/image.png'),
            ],
          ),
        ),
      ),
    );
  }
}

const kPrimaryColor = Color(0xFF1A8500);
