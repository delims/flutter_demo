import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String str = "ABCDEFIDAGJELAJLGEJWLAGEWAGERWAGEWAABCDEFIDAGJELAJLGEJWLAGEWAGERWAGEWAABCDEFIDAGJELAJLGEJWLAGEWAGERWAGEWA";
    return MaterialApp(
      home: Scaffold(
        body: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 88, 0, 34),
            child: Center(
              child: Column(
                children: str.split("").map((e) => Text(e)).toList(),
              ),
            )
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}