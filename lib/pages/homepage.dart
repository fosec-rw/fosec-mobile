// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Color(0xFF1A8500),
          weight: 10,
          opticalSize: 20,
        ),
        title: Text(
          "Tips",
          style: TextStyle(
              color: Color(0xFF1A8500),
              fontWeight: FontWeight.w600,
              fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
