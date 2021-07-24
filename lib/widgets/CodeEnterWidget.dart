import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CodeEnterWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldPageOne;

  CodeEnterWidget({this.scaffoldPageOne});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Sign in with your phone number below.",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20.0),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter the code sent to you';
                        }
                        return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            scaffoldPageOne.currentState.showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                          Timer(Duration(seconds: 2), () {
                            // Todo: change body
                          });
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
