// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:fosec/components/tips_card.dart';
import 'package:fosec/pages/tips/buyers_tips.dart';
import 'package:fosec/pages/tips/tips_data.dart';
import 'package:fosec/pages/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  String? userRole;

  Future<void> _fetchRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userRole = prefs.getString('role');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _fetchRole();
  }

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
              ListView.builder(
                shrinkWrap: true,
                itemCount: userRole == 'Farmer'
                    ? TipsData.length
                    : BuyerTipsData.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final tip = userRole == 'Farmer'
                      ? TipsData[index]
                      : BuyerTipsData[index];
                  return Tips(
                    headline: tip['headline']!,
                    description: tip['description']!,
                    imageUrl: tip['imageUrl']!,
                    desc1: tip['desc1']!,
                    desc2: tip['desc2']!,
                    desc3: tip['desc3']!,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

const kPrimaryColor = Color(0xFF1A8500);
