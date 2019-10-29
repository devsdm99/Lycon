import 'package:dartapp/widgets/FirstScreen.dart';
import 'package:dartapp/widgets/ProfilePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(PantallasApp());

class PantallasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/',
      routes: {
        '/':(context) => FirstScreen(),
        '/profile':(context) => ProfilePage()
      },
    );
  }
}