// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Tips extends StatelessWidget {
  final String headline; // Headline of the tip
  final String description; // The small text description
  final String imageUrl; // Link to the image of the tip

  const Tips(
      {super.key,
      required this.headline,
      required this.description,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(8.0),
      height: 140, // Specifying an average height for the container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Expanded(
            flex: 4,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10), // Add spacing between image and text
          // Text Section
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        headline,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.more_vert_rounded,
                      size: 15,
                    )
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  maxLines: 3,
                  style: TextStyle(color: Color(0xFF696969), fontSize: 13),
                ),
                Container(
                  width: 25,
                  height: 25,
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEFFFEF),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 15,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
