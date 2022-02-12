import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartapp/models/group.dart';

import 'models/message.dart';

Stream<List<Group>> getGroups() {
  return FirebaseFirestore.instance
      .collection("groups")
      .snapshots()
      .map(toGroupList);
}

Stream<List<Message>> getGroupMessages(String groupId) {
  return FirebaseFirestore.instance
      .collection('groups/$groupId/messages')
      .orderBy('datetime', descending: true)
      .snapshots()
      .map(toMessageList);
}

Future<void> sendMessage(String groupId, Message msg) async {
  await FirebaseFirestore.instance
      .collection('groups/$groupId/messages')
      .add(msg.toFirestore());
}

Future<void> addNewUser(String email, String username, String uid) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .set({'username': username, 'email': email});
}
