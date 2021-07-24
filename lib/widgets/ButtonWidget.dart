
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final String label;
  final Function onPressed;

  ButtonWidget(this.label, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 12),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }


}