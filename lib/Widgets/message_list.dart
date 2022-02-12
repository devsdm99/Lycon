import 'package:dartapp/Widgets/message_widget.dart';
import 'package:dartapp/models/message.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  const MessageList({
    @required this.messages,
  });

  final List<Message>? messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: messages!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 16, 8),
          child: MessageWidget(messages![index]),
        );
      },
    );
  }
}
