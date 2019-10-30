import 'package:dartapp/Pages/LoginScreen.dart';
import 'package:dartapp/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(PantallasApp());

class PantallasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/':(context) => LoginScreen(),
        '/profile':(context) => ProfilePage()
      },
    );
  }
}