// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fosec/pages/tips/tips_info.dart';

class Tips extends StatelessWidget {
  final String headline; // Headline of the tip
  final String description; // The small text description
  final String imageUrl; // Link to the image of the tip
  final String? desc1;
  final String? desc2;
  final String? desc3;

  const Tips(
      {super.key,
      required this.headline,
      required this.description,
      required this.imageUrl,
      this.desc1,
      this.desc2,
      this.desc3});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.more_vert_rounded,
                        size: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(
                      color: Color(0xFF696969),
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Center(
                    child: Container(
                      width: 23,
                      height: 23,
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
                        size: 13,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => MoreTipsInfo(
                      title: headline,
                      imageUrl: imageUrl,
                      desc1: desc1!,
                      desc2: desc2,
                      desc3: desc3,
                    ))));
      },
    );
  }
}
