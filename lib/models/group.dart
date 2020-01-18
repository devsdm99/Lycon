import 'package:cloud_firestore/cloud_firestore.dart';

class Group{

  String id;
  String name;

  Group.fromFireStore(DocumentSnapshot doc)
  : id = doc.documentID,
  name = doc.data["name"];
}

List<Group> toGroupList(QuerySnapshot query){
  List<DocumentSnapshot> docs = query.documents;

  return docs.map((doc) => Group.fromFireStore(doc)).toList();
}
