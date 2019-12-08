import 'package:dartapp/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          _fondoPantalla(),
          _cartas(context),
        ],
      ),
    );
  }

  Widget _fondoPantalla() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(29, 29, 28, 1.0),
    );
  }

  Widget _cartas(BuildContext context) {
    CardController controller;
    List<String> welcomeImages = [
      "assets/images/1.jpg",
      "assets/images/background.jpg",
      "assets/images/3.jpg",
      "assets/images/3.jpg",
      "assets/images/3.jpg",
      "assets/images/3.jpg",
      "assets/images/3.jpg",

    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: new TinderSwapCard(
        orientation: AmassOrientation.TOP,
        totalNum: 7,
        stackNum: 3,
        swipeEdge: 5.0,
        maxWidth: SizeConfig.screenWidth,
        maxHeight: SizeConfig.screenHeight,
        minWidth: MediaQuery.of(context).size.width * 0.8,
        minHeight: MediaQuery.of(context).size.width * 0.8,
        cardBuilder: (context, index) =>
        //CREAR EL MODELO DE CARTA
        Container(
          child: Image.asset('${welcomeImages[index]}', fit: BoxFit.contain,),
        ),
        cardController: controller = CardController(),
        swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
          /// Get swiping card's alignment
          if (align.x < 0) {
            //Card is LEFT swiping
            print("IZQUIERDA");
          } else if (align.x > 0) {
            print("DERECHA");
          }
        },
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          /// Get orientation & index of swiped card!
        },
      ),
    );
  }
}
