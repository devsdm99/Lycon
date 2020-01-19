import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id, text, userId;
  DateTime dateTime;

  Message.fromFireStore(DocumentSnapshot doc)
      : id = doc.documentID,
        text = doc.data["text"],
        dateTime = (doc.data["datetime"] as Timestamp).toDate();
}

List<Message> toMessageList(QuerySnapshot query) {
  List<DocumentSnapshot> docs = query.documents;

  return docs.map((doc) => Message.fromFireStore(doc)).toList();
}
