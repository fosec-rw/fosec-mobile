// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fosec/pages/Chats/chat_screen.dart';
import 'package:fosec/pages/welcome.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:ui';

const MaterialColor myCustomGreen = MaterialColor(
  0xFF1A8500, // Base color (hexadecimal)
  <int, Color>{
    50: Color(0xFFE1F7E0),
    100: Color(0xFFB3EBAA),
    200: Color(0xFF80DE7F),
    300: Color(0xFF4BD053),
    400: Color(0xFF26C432),
    500: Color(0xFF1A8500), // Your main custom color
    600: Color(0xFF188200),
    700: Color(0xFF156F00),
    800: Color(0xFF125C00),
    900: Color(0xFF0D4400),
  },
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // textTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: myCustomGreen,
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
          progressIndicatorTheme:
              ProgressIndicatorThemeData(color: kPrimaryColor)),
      home: GetStartedScreen(),
    );
  }
}
