
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PositionTestWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "position",
      home: Scaffold(
        appBar: AppBar(
          title: Text("--"),
          actions: <Widget>[
//            CircularProgressIndicator(
//              strokeWidth: 5,
//              valueColor: AlwaysStoppedAnimation(Colors.white70),
//            ),
            UnconstrainedBox(
              child: Padding(
                padding: EdgeInsets.only(right: 30),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(Colors.yellow),
                  ),
                ),
              )
            )
          ],
        ),
        body: Container(
//          color: Colors.brown,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 40,
                top: 100,
                width: 80,
                height: 80,
                child: RaisedButton(
                  child: Text("RaiseButton"),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: RaisedButton(
                  child: Text("submit"),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 50,
                ),
                child: Container(
                  height: 5.0,
                  color: Colors.blue,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}