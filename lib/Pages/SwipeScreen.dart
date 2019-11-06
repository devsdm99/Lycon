import 'package:dartapp/SizeConfig.dart';
import 'package:dartapp/models/CardInfo.dart';
import 'package:flutter/material.dart';

class SwipeScreen extends StatefulWidget {
  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(alignment: Alignment.center, children: _getMatchCard()),
    );
  }
}

List<Widget> _getMatchCard() {
  List<CardInfo> cards = [
    new CardInfo("Sofia", "assets/images/1.jpg", "Hola soy sofia"),
    new CardInfo("Marta", "assets/images/2.jpg", "Hola soy marta"),
    new CardInfo("Claudia", "assets/images/3.jpg", "Hola soy Claudia"),
  ];

  List<Widget> cardList = new List();
  for (int x = 0; x < 3; x++) {
    cardList.add(
      Positioned(
        child: new FullPersonCard(cards: cards, x: x),
      ),
    );
  }
  return cardList;
}

class FullPersonCard extends StatelessWidget {
  const FullPersonCard({
    Key key,
    @required this.cards,
    @required this.x,
  }) : super(key: key);

  final List<CardInfo> cards;
  final int x;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      onDragEnd: (drag) {},
      childWhenDragging: Container(),
      feedback: new Column(
        children: <Widget>[
          new Container(
            child: Image.asset(cards[x].img),
          )
        ],
      ),
      child: Card(
        margin: EdgeInsets.all(20),
        color: Color.fromRGBO(247, 247, 247, 1),
        child: new Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Image.asset(
                cards[x].img,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "${cards[x].name}, ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  Text("30", style: TextStyle(fontSize: 30)),
                ],
              ),
            ),
            SizedBox(height: 3),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Barcelona, Cataluña",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
