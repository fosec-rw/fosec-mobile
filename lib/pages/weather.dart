// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/pages/Chats/messages_list.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color:
                kPrimaryColor, // Replace kPrimaryColor with your actual color
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Weather",
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Weather Info
            Center(
              child: Column(
                children: [
                  Column(children: [
                    Text("Nyabihu, Today, June 4, 2023",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins')),
                    Text(
                      "24°C",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'), // Use theme colors
                    ),
                    Text(
                      "Sunny",
                      style: TextStyle(fontSize: 50, fontFamily: 'Poppins'),
                    ),
                  ]),
                  Icon(
                    Icons.sunny,
                    color: Color(0XFFFAE41D),
                    size: 45,
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Sunrise/Sunset & Temperature/Rainfall/Humidity
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoItem("Sunrise", "05:10"),
                  _buildInfoItem("Daylight", "12 h 23 min"),
                  _buildInfoItem("Sunset", "18:07"),
                ],
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoItem("Temperature", "24°C  21°C"),
                  _buildInfoItem("Rainfall", "100mm"),
                  _buildInfoItem("Humidity", "21°C"),
                ],
              ),
            ),

            SizedBox(height: 40),

            // Hourly Forecast
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Hourly Forecast",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
            SizedBox(height: 10),

            Container(
              height: 100, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildHourlyItem("Now", "24°C"),
                  _buildHourlyItem("4 PM", "24°C"),
                  _buildHourlyItem("5 PM", "24°C"),
                  _buildHourlyItem("6 PM", "24°C"),
                  _buildHourlyItem("7 PM", "24°C"),
                  _buildHourlyItem("8 PM", "24°C"),
                  // ... add more hourly items
                ],
              ),
            ),

            SizedBox(height: 40),

            // Today's Forecast Summary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud,
                        size: 30,
                      ), // Adjust size
                      SizedBox(width: 10),
                      Text(
                        "21°C, Partially Cloudy",
                        style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
      ],
    );
  }

  Widget _buildHourlyItem(String time, String temperature) {
    return Container(
      width: 80, // Adjust width
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Optional
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          SizedBox(height: 5),
          Text(
            temperature,
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}
