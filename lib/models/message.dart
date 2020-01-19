import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id, text, userId;
  DateTime datetime;


//CONSTRUCTORES
  Message.fromFireStore(DocumentSnapshot doc)
      : id = doc.documentID,
        text = doc.data["text"],
        datetime = (doc.data["datetime"] as Timestamp).toDate();

        Map<String,dynamic> toFirestore() => {
          'text'    : text,
          'datetime': datetime
        };

        Message(this.text)
         : datetime = DateTime.now();
}

List<Message> toMessageList(QuerySnapshot query) {
  List<DocumentSnapshot> docs = query.documents;

  return docs.map((doc) => Message.fromFireStore(doc)).toList();
}

