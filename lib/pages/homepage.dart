// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:fosec/components/tips_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFFFEF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Color(0xFF1A8500),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Color(0xFF444444),
                ),
                onPressed: () {
                  // Add onPressed action if required
                },
              ),
              Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey, // Placeholder color
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(8.0),
              height: 200, // Specifying an average height for the container
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
                      'images/image.png',
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
                                "Enhancing Agricultural Efficiency with Tractors:",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Icon(Icons.more_vert_rounded)
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Tractors have revolutionized modern farming practices, becoming an indispensable tool for farmers worldwide. ",
                          maxLines: 3,
                          style:
                              TextStyle(color: Color(0xFF696969), fontSize: 13),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "12 May 2020",
                          style: TextStyle(
                              color: Color(0xFF696969),
                              fontWeight: FontWeight.w200,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Recent Tips & AI generated",
                style: TextStyle(
                    color: Color(0xFF1A8500),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Tips(
              headline: "Farmers Championing Sustainable Crop Growth : ",
              description:
                  "In an era where environmental concerns have taken center stage, farmers have emerged as crucial stewards of sustainable crop growth",
              imageUrl: "images/image.png",
            ),
            Tips(
              headline: "Farmers Championing Sustainable Crop Growth : ",
              description:
                  "In an era where environmental concerns have taken center stage, farmers have emerged as crucial stewards of sustainable crop growth",
              imageUrl: "images/image.png",
            ),
            Tips(
              headline: "Farmers Championing Sustainable Crop Growth : ",
              description:
                  "In an era where environmental concerns have taken center stage, farmers have emerged as crucial stewards of sustainable crop growth",
              imageUrl: "images/image.png",
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Spotlight",
                style: TextStyle(
                    color: Color(0xFF1A8500),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
