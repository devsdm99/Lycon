import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartapp/models/group.dart';

import 'models/message.dart';

Stream<List<Group>> getGroups() {
  return Firestore.instance.collection("groups").snapshots().map(toGroupList);
}

Stream<List<Message>> getGroupMessages(String groupId) {
  return Firestore.instance
      .collection('groups/$groupId/messages').orderBy('datetime',descending: true)
      .snapshots()
      .map(toMessageList);
}

Future<void> sendMessage(String groupId, Message msg) async {
  await Firestore.instance
      .collection('groups/$groupId/messages')
      .add(msg.toFirestore());
}
