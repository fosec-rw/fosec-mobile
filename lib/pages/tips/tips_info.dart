import 'package:flutter/material.dart';

import '../homepage.dart';

class MoreTipsInfo extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String desc1;
  final String? desc2;
  final String? desc3;

  const MoreTipsInfo(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.desc1,
      this.desc2,
      this.desc3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFFEF),
      appBar: AppBar(
        backgroundColor: kPrimaryColor, // Ensure kPrimaryColor is defined
        elevation: 0,
        title: const Text(
          'Tips',
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 2),
          child: Center(
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Wrapping the image with a SizedBox to control its dimensions
                SizedBox(
                  height: 250, // You can adjust this value for desired height
                  width: double.infinity, // Ensures the image takes full width
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover, // Ensures the image scales well
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  desc1,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  desc2!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  desc3!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
