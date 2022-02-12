import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? id, text, userId;
  DateTime datetime;

//CONSTRUCTORES
  Message.fromFireStore(DocumentSnapshot doc)
      : id = doc.id,
        text = doc.get("text"),
        datetime = (doc.get("datetime") as Timestamp).toDate();

  Map<String, dynamic> toFirestore() => {'text': text, 'datetime': datetime};

  Message(this.text) : datetime = DateTime.now();

  String get hhmm =>
      '${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
}

List<Message> toMessageList(QuerySnapshot query) {
  List<DocumentSnapshot> docs = query.docs;

  return docs.map((doc) => Message.fromFireStore(doc)).toList();
}
