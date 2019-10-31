import 'package:dartapp/Pages/HomeScreen.dart';
import 'package:dartapp/Pages/IntroduceScreen.dart';
import 'package:dartapp/Pages/ProfilePage.dart';
import 'package:dartapp/Pages/SignUpPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(PantallasApp());

class PantallasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/':(context) => IntroduceScreen(),
        '/signUp':(context) => SignUpPage(),
        '/home':(context) => HomeScreen(),
        '/profile':(context) => ProfilePage()
      },
    );
  }
}