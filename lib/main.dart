import 'package:flutter/material.dart';
import 'package:dartapp/CustomControls/customTextField.dart';

class Screen1 extends StatelessWidget {
  @override
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover),
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("LOGO DE EMPRESA"),
                  Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: Column(
                      children: <Widget>[
                        CustomTextField(
                          onSaved: (input) {
                            _email = input;
                          },
                          icon: Icon(Icons.email),
                          hint: "EMAIL",
                        ),
                        CustomTextField(
                          icon: Icon(Icons.lock),
                          obsecure: true,
                          onSaved: (input) => _password = input,
                          validator: (input) =>
                              input.isEmpty ? "*Required" : null,
                          hint: "PASSWORD",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(Screen1());
}
