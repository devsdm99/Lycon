import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda pantalla'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('VOlver a primera pantalla'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
