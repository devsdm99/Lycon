import 'package:dartapp/Widgets/Messagebox.dart';
import 'package:dartapp/Widgets/loading.dart';
import 'package:dartapp/Widgets/message_list.dart';
import 'package:dartapp/Widgets/red_error.dart';
import 'package:dartapp/db.dart' as db;
import 'package:dartapp/models/group.dart';
import 'package:dartapp/models/message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Group? group = ModalRoute.of(context)!.settings.arguments as Group?;
    return Scaffold(
      backgroundColor: Color.fromRGBO(29, 29, 28, 1.0),
      appBar: AppBar(
        title: Text(group!.name),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 30),
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: db.getGroupMessages(group.id),
        builder: (context, AsyncSnapshot<List<Message>> snapshot) {
          if (snapshot.hasError) {
            //return RedError(snapshot.error);
          }
          if (!snapshot.hasData) {
            return Loading();
          }
          return Column(
            children: <Widget>[
              Expanded(
                child: MessageList(messages: snapshot.data),
              ),
              MessageBox(onSend: (text) {
                if (text.toString().length > 0) {
                  String texto = text.toString().trim();
                  db.sendMessage(group.id, Message(texto));
                }
              }),
            ],
          );
        },
      ),
    );
  }
}
