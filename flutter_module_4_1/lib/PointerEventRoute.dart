import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointerEventRoute extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PointerEventRouteState();
  }
}

class PointerEventRouteState extends State<PointerEventRoute>
{
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
//          _event?.toString()??"" +
          _event?.delta.toString()??""


          ,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
      onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
      onPointerUp:(PointerUpEvent event)=> setState(()=>_event=event),
    );
  }
}