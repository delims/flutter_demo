import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DelimsApp extends StatefulWidget {
  DelimsApp({this.number});

  int number = 1;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DelimsAppState(number:number);
  }
}

class DelimsAppState extends State<DelimsApp> {

  DelimsAppState({this.number});

  int number = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("$number"),
      ),
      body: Wrap(
        runSpacing: 0,
        spacing: 10,
        children: <Widget>[
          RaisedButton(
            child: Text("click"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => DelimsApp(number:(number + 1))));
            },
          ),
        ],
      ),
    );
  }
}
