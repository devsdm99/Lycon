

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartapp/models/group.dart';

import 'models/message.dart';

Stream<List<Group>> getGroups(){

  return Firestore.instance.collection("groups").snapshots().map(toGroupList);

}


Stream<List<Message>> getGroupMessages(String groupId) {
  return Firestore.instance
      .collection('groups/$groupId/messages')
      .snapshots()
      .map(toMessageList);
}
