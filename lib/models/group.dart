import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  String id;
  String name;

  Group.fromFireStore(DocumentSnapshot doc)
      : id = doc.id,
        name = doc.get('name');
}

List<Group> toGroupList(QuerySnapshot query) {
  List<DocumentSnapshot> docs = query.docs;

  return docs.map((doc) => Group.fromFireStore(doc)).toList();
}
