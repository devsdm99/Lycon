import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> personas = [
      "assets/images/1.jpg",
      "assets/images/4.jpg",
      "assets/images/3.jpg",
      "assets/images/2.jpg",
      "assets/images/5.jpg",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Header(
              height: 200,
              backgroundAsset: 'assets/images/background.jpg',
              userAsset: 'assets/images/1.jpg',
              username: 'Pep el jefe',
            ),
            Connectons(
              following: 128,
              followers: 3921,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Instagram',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            Description(
              text:
                  'Maecenas vestibulum risus mi, eu aliquet tellus auctor ut. Quisque cursus pulvinar luctus. Etiam pellentesque est eget scelerisque sodales. Pellentesque in volutpat nibh. Donec ut ultrices ante, ac imperdiet lorem. Mauris imperdiet tortor a urna interdum ullamcorper. Mauris eu nunc tristique, cursus nisi ut, faucibus mi. In tempus, sapien at vulputate sagittis, justo massa condimentum dui, nec congue massa lorem nec quam. ',
            )
          ],
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String? text;

  Description({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(this.text!),
    );
  }
}

class Connectons extends StatelessWidget {
  final int? following, followers;
  const Connectons({this.followers, this.following});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(46, 46, 44, 1.0),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Connection(
            textConnection: "Following",
            number: following!,
          ),
          Connection(
            textConnection: "Followers",
            number: followers!,
          ),
        ],
      ),
    );
  }
}

class Connection extends StatelessWidget {
  final String? textConnection;
  final int? number;

  const Connection({@required this.textConnection, @required this.number});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

    return Column(
      children: <Widget>[
        Text(
          textConnection!.toUpperCase(),
          style: style,
        ),
        Text(
          '$number',
          style: style,
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  final double? height;
  final String? backgroundAsset;
  final String? userAsset;
  final String? username;

  const Header(
      {this.height,
      @required this.backgroundAsset,
      @required this.userAsset,
      @required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(this.backgroundAsset!),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          UserPhoto(
            assetImage: this.userAsset!,
            size: 100,
          ),
          Text(
            this.username!,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class UserPhoto extends StatelessWidget {
  final String? assetImage;
  final double? size;

  const UserPhoto({@required this.assetImage, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: this.size,
          width: this.size,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(this.assetImage!), fit: BoxFit.cover),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
        ),
      ],
    );
  }
}
