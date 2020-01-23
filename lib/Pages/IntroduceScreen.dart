import 'package:dartapp/Pages/SignUpPage.dart';
import 'package:dartapp/SizeConfig.dart';
import 'package:dartapp/Widgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroduceScreen extends StatefulWidget {
  @override
  IntroduceScreenState createState() => IntroduceScreenState();
}

class IntroduceScreenState extends State<IntroduceScreen>
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


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: Text(
                    'La vida es mucho más hermosa y compleja que un número en la balanza',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 9,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CustomButton(
                          text: 'Registrate',
                          highlight: true,
                          onPressed: () => Navigator.of(context).pushNamed('/signUp'),
                        ),
                        SizedBox(height: 16),
                        CustomButton(
                          text: 'Iniciar Sesión',
                          onPressed: () {
                            Navigator.of(context).pushNamed('/home');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
