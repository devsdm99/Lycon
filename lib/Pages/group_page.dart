
import 'package:dartapp/Widgets/group_list.dart';
import 'package:dartapp/Widgets/loading.dart';
import 'package:dartapp/Widgets/red_error.dart';
import 'package:dartapp/db.dart' as db;
import 'package:dartapp/models/group.dart';
import 'package:flutter/material.dart';



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
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder(
          stream: db.getGroups(),
          builder: (context, AsyncSnapshot<List<Group>> snapshot) {
            if (snapshot.hasError) {
              return RedError(snapshot.error);
            }
            if (!snapshot.hasData) {
              return Loading();
            }
            return GroupList(groups: snapshot.data);
          },
        ));
  }
}


