// lib/pages/homepage.dart

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fosec/components/tips_card.dart';
import 'package:fosec/pages/Chats/messages_list.dart';
import 'package:fosec/pages/Chats/chat_bot.dart';
import 'package:fosec/pages/location/location.dart';
import 'package:fosec/pages/notifications.dart';
import 'package:fosec/pages/profile.dart';
import 'package:fosec/pages/qr-code/generate_code.dart';
import 'package:fosec/pages/qr-code/start_scanning.dart';
import 'package:fosec/pages/settings.dart';
import 'package:fosec/pages/tips/buyers_tips.dart';
import 'package:fosec/pages/tips/tips.dart';
import 'package:fosec/pages/tips/tips_data.dart';
import 'package:fosec/pages/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kBackgroundColor = Color(0xFFEFFFEF);
const kPrimaryColor = Color(0xFF1A8500);
const kSecondaryColor = Color(0xFF444444);
const kGreyColor = Color(0xFF808080);
const kPadding = EdgeInsets.all(10.0);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessagesListScreen()),
        );
      } else if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UpdateProfile()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: kPrimaryColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.notifications, color: kSecondaryColor),
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Notifications())));
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpdateProfile()));
            },
            child: Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person_4,
                color: kPrimaryColor,
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.wb_sunny, color: kPrimaryColor),
              title: Text('Weather'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.adb_rounded, color: kPrimaryColor),
              title: Text('AI Chatbot'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ChatBot())));
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: kPrimaryColor),
              title: Text('Location'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Location())));
              },
            ),
            ListTile(
              leading: Icon(Icons.message, color: kPrimaryColor),
              title: Text('Messages'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MessagesListScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.tips_and_updates, color: kPrimaryColor),
              title: Text('General Tips'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TipsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.qr_code_scanner, color: kPrimaryColor),
              title: Text('QR Scan'),
              onTap: () {
                // Handle the tap event
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ScanCode())));
              },
            ),
            userRole == 'Farmer'
                ? ListTile(
                    leading: Icon(Icons.qr_code_scanner, color: kPrimaryColor),
                    title: Text('QR Generate'),
                    onTap: () {
                      // Handle the tap event
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => GenerateCode())));
                    },
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(),
            Padding(
              padding: kPadding,
              child: Text(
                "Recent Tips for ${"${userRole}s"} ",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
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
            ),
            Padding(
              padding: kPadding,
              child: Text(
                "Spotlight",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(
                'images/spotlight.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kGreyColor,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      margin: kPadding,
      padding: EdgeInsets.all(8.0),
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
          Expanded(
            flex: 5,
            child: Image.asset(
              'images/image.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
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
                    IconButton(
                      icon: Icon(
                        Icons.more_vert_rounded,
                        size: 20,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => GetStartedScreen()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "Tractors have revolutionized modern farming practices, becoming an indispensable tool for farmers worldwide.",
                  maxLines: 3,
                  style: TextStyle(
                    color: Color(0xFF696969),
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "8 October 2024",
                  style: TextStyle(
                    color: Color(0xFF696969),
                    fontWeight: FontWeight.w200,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
