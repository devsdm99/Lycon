import 'package:dartapp/Pages/IntroduceScreen.dart';
import 'package:dartapp/Pages/SignUpPage.dart';
import 'package:dartapp/Pages/home_page.dart';
import 'package:dartapp/Pages/profile_page.dart';
import 'package:dartapp/Pages/chat_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(PantallasApp());

class PantallasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/'       :(context) => IntroduceScreen(),
        '/signUp' :(context) => SignUpPage(),
        '/home'   :(context) => HomePage(),
        '/profile':(context) => ProfilePage(),
        '/chat'   :(context) => ChatPage()
      },
    );
  }
}