import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDetailWidget extends StatelessWidget {
  final String labelText;
  final String bodyText;

  TextDetailWidget(this.labelText, this.bodyText);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            labelText,
            style: TextStyle(color: Colors.blue),
          ),
          Text(
            bodyText,
            style: TextStyle(color: Colors.black),
          )
        ]);
  }
}
