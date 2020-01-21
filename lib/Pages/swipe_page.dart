import 'package:dartapp/models/CardInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SwipePage extends StatefulWidget {
  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          _fondoPantalla(),
          _cartas(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      iconSize: 50,
                      icon: new Icon(MdiIcons.refresh),
                    ),
                    IconButton(
                      iconSize: 50,
                      icon: new Icon(MdiIcons.close),
                    ),
                    IconButton(
                      iconSize: 50,
                      icon: new Icon(MdiIcons.heartOutline),
                    ),
                    IconButton(
                      iconSize: 50,
                      icon: new Icon(MdiIcons.hexagonMultipleOutline),
                    )
                  ],
                ),
              )
            ],
          )
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

    List<CardInfo> personas = [
      new CardInfo("Alexis Ren", "18", "Los Angeles", "assets/images/1.jpg"),
      new CardInfo("Leo", "21", "Vilanova y la Geltrú", "assets/images/4.jpg"),
      new CardInfo("Mireia", "23", "Madrid", "assets/images/3.jpg"),
      new CardInfo("Tania", "19", "Valencia", "assets/images/2.jpg"),
      new CardInfo("Nacho", "18", "Barcelona", "assets/images/5.jpg"),
      new CardInfo("Claire", "19", "Lyon", "assets/images/2.jpg"),
    ];
    //Image.asset('${personas[index].photoURL}', fit: BoxFit.contain,)
    return Container(
      color: Colors.yellow,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: new TinderSwapCard(
        orientation: AmassOrientation.BOTTOM,
        totalNum: personas.length,
        stackNum: 3,
        swipeEdge: 6.0,
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height * 0.7,
        minWidth: MediaQuery.of(context).size.width * 0.8,
        minHeight: MediaQuery.of(context).size.height * 0.6,
        cardBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            // Color.fromRGBO(29, 29, 28, 1.0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    _datosPersona(personas, index),
                    _foto(personas, index),
                  ],
                )
              ],
            ),
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

  Expanded _foto(List<CardInfo> personas, int index) {
    return Expanded(
      child: Image(
        image: AssetImage(
          personas[index].photoURL,
        ),
        fit: BoxFit.fill,
        width: double.infinity,
      ),
    );
  }

  Widget _datosPersona(List<CardInfo> personas, int index) {
    TextStyle estilo = new TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 23.0);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.13,
      color: Colors.black,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${personas[index].name}, ${personas[index].age}',
            style: estilo,
          ),
          Text(
            personas[index].country,
            style: estilo,
          ),
        ],
      ),
    );
  }
}
