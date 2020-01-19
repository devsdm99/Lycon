import 'package:flutter/material.dart';

class RedError extends StatelessWidget {

  final Error error;
  RedError(this.error);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error.toString(),
        style: TextStyle(backgroundColor: Colors.red),
      ),
    );
  }
}
