import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScrollNotificationTestRouteState();
  }
}

class _ScrollNotificationTestRouteState extends State
{
  String _progress = "0%";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification){
            double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
          return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  itemBuilder:(context, index){
                    return ListTile(
                      title: Text("$index"),
                    );
                  }
              ),
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}