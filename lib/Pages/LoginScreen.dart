import 'package:dartapp/CustomControls/CustomButton.dart';
import 'package:dartapp/Pages/SignUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _backgroundAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 30));

    _backgroundAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleOnPressedSignUp() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(pageBuilder: (context, anim1, anim2) => SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: FractionalOffset(_backgroundAnimation.value, 0),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: Text(
                    'La vida es mucho más hermosa y compleja que un número en la balanza',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                CustomButton(
                  text: 'Registrate',
                  highlight: true,
                  onPressed: _handleOnPressedSignUp,
                ),
                SizedBox(height: 16),
                CustomButton(text: 'Iniciar Sesion'),
                SizedBox(height: 16),
                SizedBox(height: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}
