import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class ViewUtils{

  static displayToast(BuildContext context, String message){
    Toast.show(
        message, context,
        duration: Toast.LENGTH_SHORT,
        gravity:  Toast.BOTTOM
    );
  }
}