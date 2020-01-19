import 'package:dartapp/models/message.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  const MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(message.text, style: TextStyle(
                  fontSize: 15
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 4),
                child: Text(
                  message.hhmm,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
