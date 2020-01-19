import 'package:dartapp/Widgets/group_tile.dart';
import 'package:dartapp/models/group.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    @required this.groups,
  }) ;

  final List<Group> groups;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final Group group = groups[index];
        return GroupTile(group: group);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 2,
          indent: 75,
          endIndent: 15,
        );
      },
    );
  }
}