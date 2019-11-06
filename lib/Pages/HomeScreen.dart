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
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTabBar(),
                _buildTabContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabData {
  final String label;
  final IconData icon;
  final Widget child;

  TabData(this.label, this.icon, this.child);
}

List<TabData> _tabs = [
  new TabData("Profile", Icons.person, ProfilePage()),
  new TabData("Swipe", Icons.arrow_forward_ios, SwipeScreen()),
  new TabData("Chat", Icons.chat, ChatScreen())
];

Widget _buildTabBar() {
  return TabBar(
    labelColor: Colors.black,
    indicatorWeight: 2,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Colors.yellow, width: 5),
      insets: EdgeInsets.symmetric(horizontal: 20)

    ),
    tabs: _tabs
        .map((tab) => Tab(
              text: tab.label,
              icon: Icon(tab.icon),
            ))
        .toList(),
  );
}

Widget _buildTabContent() {
  return Expanded(
    child: TabBarView(
      children: _tabs.map((tab) => tab.child).toList(),
    ),
  );
}

class CustomTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(),
    );
  }
}
