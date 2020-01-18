import 'package:dartapp/models/group.dart';
import 'package:flutter/material.dart';

class GroupTile extends StatelessWidget {
  final Group group;
  GroupTile({this.group});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        decoration: BoxDecoration(
          color: Colors.teal[100],
          shape: BoxShape.circle,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(group.name),
          Text("18/01/2020", style: TextStyle(
            color: Colors.grey[500],
            fontSize: 12
          ),)
        ],
      ),
      subtitle: Text(group.id),
    );
  }
}
