import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GestureDetectorTestRouteState();
  }
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!";
  double _top = 50.0;
  double _left = 30.0;
  double _top_B = 50.0;
  double _left_B = 30.0;
  bool _toggle = false;
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Stack(
      children: <Widget>[
        Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200.0,
              height: 100.0,
              child: Text(
                _operation,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                ),
              ),
            ),
            onTap: () => updateText("Tap"),
            onDoubleTap: () => updateText("DoubleTap"),
            onLongPress: () => updateText("LongPress"),
          ),
        ),
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            onPanDown: (DragDownDetails e){
              print("用户手指按下：${e.globalPosition}");
            },

            onPanUpdate: (DragUpdateDetails e) {
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              print(e.velocity);
            },
          ),

        ),
        Positioned(
          top: _top_B,
          left: _left_B,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("B"),
            ),
            onPanDown: (DragDownDetails e){
              print("用户手指按下B:${e.globalPosition}");
            },
            onPanUpdate: (DragUpdateDetails e) {
              setState(() {
                _left_B += e.delta.dx;
                _top_B += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              print(e.velocity);
            },
          ),
        ),
        Positioned(
          left: 100,
          top: 200,
          child: Text.rich(
              TextSpan(
                  children: [
                    TextSpan(
                      text: "点我变色",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _toggle ? Colors.blue : Colors.red,
                      ),
                      recognizer: _tapGestureRecognizer..onTap = (){
                        setState(() {
                          _toggle = !_toggle;
                        });
                      },


                    ),
                    TextSpan(text: "你好世界",
                    style: TextStyle(
                      fontSize: 10,
                      decoration: TextDecoration.none,
                    ),
                    ),
                  ]
              )
          ),
        ),



      ],
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}

