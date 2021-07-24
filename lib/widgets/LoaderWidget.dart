
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatefulWidget {

  final Widget body;
  LoaderWidget({this.body, Key key}): super(key: key);

  @override
  LoaderWidgetState createState() => LoaderWidgetState();
}

class LoaderWidgetState extends State<LoaderWidget> {
  bool _status = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _status ? Center(child: CircularProgressIndicator())
          : Center(
        child: widget.body,
      ),
    );
  }

  void changeState(){
    setState(() {
      _status = !_status;
    });
  }
}

abstract class LoaderStatelessWidget extends StatelessWidget{
  final loaderKey = GlobalKey<LoaderWidgetState>();

  void changeState(){
    loaderKey.currentState.changeState();
  }

  Widget LoaderWidgeted({Widget body}){
    return LoaderWidget(body: body, key: loaderKey);
  }
}

abstract class LoaderStatefulWidget<T extends StatefulWidget> extends State<T>{
  final loaderKey = GlobalKey<LoaderWidgetState>();

  void changeState(){
    loaderKey.currentState.changeState();
  }

  Widget LoaderWidgeted(Widget body, Key key){
    return LoaderWidget(body: body, key: key);
  }
}