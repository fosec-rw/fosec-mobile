// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:fosec/components/tips_card.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
            onPressed: () {},
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
                // Handle the tap event
              },
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: kPrimaryColor),
              title: Text('AI Tips'),
              onTap: () {
                // Handle the tap event
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: kPrimaryColor),
              title: Text('Location'),
              onTap: () {
                // Handle the tap event
              },
            ),
            ListTile(
              leading: Icon(Icons.message, color: kPrimaryColor),
              title: Text('Messages'),
              onTap: () {
                // Handle the tap event
              },
            ),
            ListTile(
              leading: Icon(Icons.tips_and_updates, color: kPrimaryColor),
              title: Text('General Tips'),
              onTap: () {
                // Handle the tap event
              },
            ),
            ListTile(
              leading: Icon(Icons.qr_code_scanner, color: kPrimaryColor),
              title: Text('QR Scan'),
              onTap: () {
                // Handle the tap event
              },
            ),
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
                "Recent Tips & AI generated",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
                'images/image.png',
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
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: "Messages",
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
      height: 200,
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
            flex: 4,
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
                    Icon(Icons.more_vert_rounded),
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
                  "12 May 2020",
                  style: TextStyle(
                    color: Color(0xFF696969),
                    fontWeight: FontWeight.w200,
                    fontSize: 10,
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
