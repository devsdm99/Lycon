import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  final Function onSend;
  MessageBox({this.onSend});

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  _send(String text) {
    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Material(
              elevation: 4,
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  onSubmitted: _send,
                  controller: _controller,
                ),
              ),
            ),
          ),
          SizedBox(width: 8,),
          Material(
            color: Theme.of(context).primaryColor,
            shape: CircleBorder(),
            elevation: 4,
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _send(_controller.text),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
