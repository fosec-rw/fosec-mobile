// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/pages/Chats/messages_list.dart';
import 'package:fosec/components/formatTime.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart'; // For decoding JSON responses

Future<Map<String, dynamic>> fetchWeatherData(double lat, double long) async {
  final response = await http.get(
    Uri.parse(
        'https://red-hill-4858.fly.dev/api/v1/weather?long=$long&lat=$lat'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Map<String, dynamic>? weatherData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getWeatherData();
  }

  void _getWeatherData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      double lat =
          prefs.getDouble('latitude') ?? -1.9403; // Use default value if null
      double long = prefs.getDouble('longitude') ??
          29.8739; // Assuming longitude stored as well

      var data = await fetchWeatherData(lat, long);
      setState(() {
        weatherData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: kPrimaryColor,
              ))
            : weatherData != null
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Main Weather Info
                        Center(
                          child: Column(
                            children: [
                              Column(children: [
                                Text(weatherData!['name'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins')),
                                Text(
                                  '${weatherData!['main']['temp']}°C',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          'Poppins'), // Use theme colors
                                ),
                                Text(
                                  '${weatherData!['weather'][0]['description']}',
                                  style: TextStyle(
                                      fontSize: 35, fontFamily: 'Poppins'),
                                ),
                              ]),
                              Icon(
                                weatherData!['weather'][0]['description']
                                        .contains("clouds")
                                    ? Icons.cloud
                                    : weatherData!['weather'][0]['description']
                                            .contains("sky")
                                        ? Icons.cloud_circle
                                        : weatherData!['weather'][0]
                                                    ['description']
                                                .contains("rain")
                                            ? Icons.cloudy_snowing
                                            : Icons.sunny,
                                color: weatherData!['weather'][0]['description']
                                        .contains("clouds")
                                    ? kGreyColor
                                    : weatherData!['weather'][0]['description']
                                            .contains("sky")
                                        ? Colors.blue
                                        : weatherData!['weather'][0]
                                                    ['description']
                                                .contains("rain")
                                            ? Colors.blue
                                            : Color(0XFFFAE41D),
                                size: 45,
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 30),

                        // Sunrise/Sunset & Temperature/Rainfall/Humidity
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildInfoItem("Sunrise",
                                  format_time(weatherData!['sys']['sunrise'])),
                              _buildInfoItem("Sunset",
                                  format_time(weatherData!['sys']['sunset'])),
                            ],
                          ),
                        ),

                        SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildInfoItem("Temp min",
                                  '${weatherData!['main']['temp_min']}°C'),
                              _buildInfoItem("Temp max",
                                  '${weatherData!['main']['temp_max']}°C'),
                              _buildInfoItem("Humidity",
                                  '${weatherData!['main']['humidity']}%'),
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Adjust size
                                  SizedBox(width: 10),

                                  Text(
                                    'Feels ${_getTemperatureDescription(weatherData!['main']['feels_like'])}',
                                    style: TextStyle(
                                        fontSize: 16, fontFamily: 'Poppins'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Text("No weather data"),
                  ));
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

  String _getTemperatureDescription(double feelsLike) {
    if (feelsLike < 10) {
      return 'cold';
    } else if (feelsLike >= 10 && feelsLike < 20) {
      return 'cool';
    } else if (feelsLike >= 20 && feelsLike < 30) {
      return 'warm';
    } else {
      return 'hot';
    }
  }
}
