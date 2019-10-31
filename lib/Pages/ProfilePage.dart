import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Header(
            height: 200,
            backgroundAsset: 'assets/images/backgroundProfile.png',
            userAsset: 'assets/images/user.jpg',
            username: 'Pep el jefe',
          ),
          Connectons(
            following: 128,
            followers: 3921,
          ),
          Description(
            text: 'Maecenas vestibulum risus mi, eu aliquet tellus auctor ut. Quisque cursus pulvinar luctus. Etiam pellentesque est eget scelerisque sodales. Pellentesque in volutpat nibh. Donec ut ultrices ante, ac imperdiet lorem. Mauris imperdiet tortor a urna interdum ullamcorper. Mauris eu nunc tristique, cursus nisi ut, faucibus mi. In tempus, sapien at vulputate sagittis, justo massa condimentum dui, nec congue massa lorem nec quam. ',
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String text;

  Description({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(this.text),
    );
  }
}

class Connectons extends StatelessWidget {
  final int following, followers;
  const Connectons({Key key, this.followers, this.following}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Connection(
            textConnection: "Following",
            number: following,
          ),
          Connection(
            textConnection: "Followers",
            number: followers,
          ),
        ],
      ),
    );
  }
}

class Connection extends StatelessWidget {
  final String textConnection;
  final int number;

  const Connection(
      {Key key, @required this.textConnection, @required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: Color.fromARGB(160, 0, 0, 0),
    );

    return Column(
      children: <Widget>[
        Text(
          textConnection.toUpperCase(),
          style: style.copyWith(fontSize: 14),
        ),
        Text(
          '$number',
          style: style.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  final double height;
  final String backgroundAsset;
  final String userAsset;
  final String username;

  const Header(
      {Key key,
      this.height,
      @required this.backgroundAsset,
      @required this.userAsset,
      @required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(this.backgroundAsset),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          UserPhoto(
            assetImage: this.userAsset,
            size: 100,
          ),
          Text(
            this.username,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class UserPhoto extends StatelessWidget {
  final String assetImage;
  final double size;

  const UserPhoto({Key key, @required this.assetImage, this.size = 100})
      : super(key: key);

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
                image: AssetImage(this.assetImage), fit: BoxFit.cover),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
        ),
      ],
    );
  }
}
