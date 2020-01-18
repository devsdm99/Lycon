import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartapp/db.dart' as db;
import 'package:dartapp/models/group.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
            return ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(groups[index].name),
                );
              },
            );
          },
        ));
  }
}
