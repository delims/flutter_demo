import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget
{
  ShareDataWidget({
    @required this.data,
    Widget child
}) : super (child : child);

  final int data;
  static ShareDataWidget of (BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
    throw UnimplementedError();
  }
}

class __TestWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return __TestWidgetState();
    throw UnimplementedError();
  }
}

class __TestWidgetState extends State<__TestWidget>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      ShareDataWidget.of(context).data.toString(),
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        color: Colors.yellow,
      ),
    );
    throw UnimplementedError();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  _InheritedWidgetTestRouteState createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute>
{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: __TestWidget(),
            ),
            RaisedButton(
              child: Text(
                "Increment",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                ),
              ),
              onPressed: (){
                setState(() {
                  ++count;
                });
              },
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}