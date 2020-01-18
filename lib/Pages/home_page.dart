import 'package:dartapp/Pages/chat_page.dart';
import 'package:dartapp/Pages/swipe_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageOptions = [SwipePage(), ChatScreen()];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: _navigationBar(),
    );
  }

  Widget _navigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(46, 46, 44, 1.0),
      selectedItemColor: Color.fromRGBO(247, 88, 106, 1.0),
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person,
            size: 35,
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.heart,
            size: 35,
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.refresh,
            size: 35,
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
            size: 35,
          ),
          title: Container(),
        ),
      ],
    );
  }
}
