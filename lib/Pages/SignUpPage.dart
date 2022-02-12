import 'package:dartapp/Pages/IntroduceScreen.dart';
import 'package:dartapp/Widgets/CustomButton.dart';
import 'package:dartapp/auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  AnimationController? _signUpAnimationController;
  Animation<double>? _signUpAnimation;

  AnimationController? _signInAnimationController;
  Animation<double>? _signInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 20), vsync: this);

    _signUpAnimationController =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);

    _signInAnimationController =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);

    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController!.reset();
              _animationController!.forward();
            }
          });

    Future.delayed(Duration.zero, () {
      _signUpAnimation =
          Tween(begin: MediaQuery.of(context).size.height, end: 450.0).animate(
              _signUpAnimationController!
                  .drive(CurveTween(curve: Curves.easeOut)))
            ..addListener(() {
              setState(() {});
            })
            ..addStatusListener((animationStatus) {
              if (animationStatus == AnimationStatus.completed) {
                _signInAnimationController!.forward();
              }
            });

      _signInAnimation = Tween(begin: -32.0, end: 16.0).animate(
          _signInAnimationController!.drive(CurveTween(curve: Curves.easeOut)))
        ..addListener(() {
          setState(() {});
        });
    });

    _animationController!.forward();

    _signUpAnimationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() {
    _handleOnTabBackButton();
    return Future.delayed(Duration.zero, () {
      _handleOnTabBackButton();
      return true;
    });
  }

  void _handleOnTabBackButton() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) => IntroduceScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    String username = "", email = "", password = "";
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              alignment: FractionalOffset(_animation!.value, 0),
            ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  BackArrow(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 48),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          username = val;
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: 'NOMBRE DE USUARIO',
                        labelStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          labelText: 'DIRECCION DE EMAIL',
                          labelStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: _signUpAnimation?.value ?? double.maxFinite,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 300,
                    child: CustomButton(
                      text: 'Registrate',
                      highlight: true,
                      onPressed: () async {
                        print(email);
                        print(username);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.10,
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  'assets/images/icon-back.png',
                  fit: BoxFit.cover,
                  width: 32,
                  height: 32,
                ),
                onTap: () => Navigator.of(context).pop('/'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
