import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartapp/db.dart' as db;
import 'package:dartapp/models/group.dart';
import 'package:flutter/material.dart';

import '../group_tile.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat Page"),
          backgroundColor: Colors.green,
        ),
        body: StreamBuilder(
          stream: db.getGroups(),
          builder: (context, AsyncSnapshot<List<Group>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            List<Group> groups = snapshot.data;
            return ListView.separated(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final Group group = groups[index];
                return GroupTile(group: group);
              },
              separatorBuilder: (context, index){
                return Divider(
                  height: 2,
                  indent: 75,
                  endIndent: 15 ,
                );
              },
            );
          },
        ));
  }
}

