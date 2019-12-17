import 'package:dartapp/SizeConfig.dart';
import 'package:dartapp/models/CardInfo.dart';
import 'package:flutter/cupertino.dart';
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
      bottomNavigationBar: _navigationBar(),
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
    List<CardInfo> personas = [
      new CardInfo("Alexis Ren", "18", "Los Angeles", "assets/images/1.jpg"),
      new CardInfo("Miriam", "18", "Los Angeles", "assets/images/2.jpg"),
      new CardInfo("Tania", "18", "Los Angeles", "assets/images/3.jpg"),
      new CardInfo("Tania", "18", "Los Angeles", "assets/images/3.jpg"),
      new CardInfo("Tania", "18", "Los Angeles", "assets/images/3.jpg"),
      new CardInfo("Tania", "18", "Los Angeles", "assets/images/3.jpg"),
      new CardInfo("Tania", "18", "Los Angeles", "assets/images/3.jpg"),
    ];
    //Image.asset('${personas[index].photoURL}', fit: BoxFit.contain,)
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: new TinderSwapCard(
        orientation: AmassOrientation.BOTTOM,
        totalNum: 7,
        stackNum: 3,
        swipeEdge: 6.0,
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        maxHeight: MediaQuery.of(context).size.width * 0.9,
        minWidth: MediaQuery.of(context).size.width * 0.8,
        minHeight: MediaQuery.of(context).size.width * 0.8,
        cardBuilder: (context, index) =>
            //CREAR EL MODELO DE CARTA    
         Container(
           
          color: Colors.red,
          child: Stack(
            children: <Widget>[ 
              _datosPersona(personas, index),
              Image(
                  image: AssetImage(personas[index].photoURL), 
                ),
            ],
          ),
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

  Widget _navigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(46, 46, 44, 1.0),
      selectedItemColor: Color.fromRGBO(247, 88, 106, 1.0),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person,
            size: 35,
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.heart,
            size: 35,
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.heart,
            size: 35,
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.refresh,
            size: 35,
          ),
          title: Container(),
        ),
      ],
    );
  }

  Widget _datosPersona(List<CardInfo> personas, int index) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${personas[index].name}, ${personas[index].age}',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
            Text(
              personas[index].country,
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
