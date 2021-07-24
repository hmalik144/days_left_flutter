import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:days_left/constants/constants.dart';
import 'package:days_left/model/UserProfileDetails.dart';
import 'package:days_left/services/NavigationService.dart';

import '../locator.dart';
import 'TextDetailWidget.dart';

class DisplayUserDetails extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final NavigationService _navigationService = locator<NavigationService>();

  final UserProfileDetails userDetails;
  final Function callback;

  DisplayUserDetails(this.userDetails, this.callback);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          key: _formKey,
          child: Container(
            width: 400,
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
            child: getInnerWidget(context),
          )),
    );
  }

  Widget getInnerWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Text(
            "User Profile",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20.0),
        ),
        _getInnerWidgetList(),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 12),
          child: ElevatedButton(
            onPressed: () {
              _navigationService.navigateTo(UpdateDetailsViewRoute,
                  arguments: userDetails);
            },
            child: Text('Update'),
          ),
        )
      ],
    );
  }

  Widget _getInnerWidgetList() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextDetailWidget("Name", userDetails?.name ?? "n/a"),
          TextDetailWidget("D.O.B", userDetails?.dob ?? "n/a"),
          TextDetailWidget("Email", userDetails?.email ?? "n/a"),
          TextDetailWidget("Phone no.", userDetails?.phone ?? "n/a"),
          TextDetailWidget("Sex", userDetails?.sex ?? "n/a"),
        ]);
  }
}
