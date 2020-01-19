
import 'package:dartapp/Widgets/group_list.dart';
import 'package:dartapp/Widgets/loading.dart';
import 'package:dartapp/Widgets/red_error.dart';
import 'package:dartapp/db.dart' as db;
import 'package:dartapp/models/group.dart';
import 'package:flutter/material.dart';



class GroupListPage extends StatefulWidget {
  @override
  _GroupListPageState createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Groups"),
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


