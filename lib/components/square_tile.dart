// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class RectangleTile extends StatelessWidget {
  final String imagePath;
  const RectangleTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 40,
            width: 40,
          ),
          Text(
            "Sign in with Google",
            style: TextStyle(fontFamily: 'Outfit'),
          )
        ],
      ),
    );
  }
}
