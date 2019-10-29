import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('IR a perfil'),
          onPressed: (){
            Navigator.of(context).pushNamed('/profile');
          },
        ),
      ),
    );
  }
}