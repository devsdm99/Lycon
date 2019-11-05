import 'package:dartapp/CustomControls/CustomIcon.dart';
import 'package:dartapp/Pages/ProfilePage.dart';
import 'package:dartapp/Pages/SwipeScreen.dart';
import 'package:flutter/material.dart';

import 'ChatScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TabController controller;

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Center(
            child: NavBar(),
          ),
        ),
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  CustomIcon active;

  List items = [
    CustomIcon(-1.0, Colors.black, Icons.person),
    CustomIcon(-0.5, Colors.white, Icons.photo_camera),
    CustomIcon(0.0, Colors.green, Icons.chat)
  ];

  @override
  void initState() {
    super.initState();

    active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(active.x, -1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 8,
              width: w * 0.2,
              color: active.color,
            ),
          ),

        ],
      ),
    );
  }
}
