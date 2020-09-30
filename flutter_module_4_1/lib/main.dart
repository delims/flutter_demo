import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fluttermodule41/GridView.dart';
import 'ScrollRoute.dart';
import 'CustomScrollViewTestRoute.dart';
import 'ScrollControllerTestRoute.dart';
import 'ScrollNotificationTestRoute.dart';
import 'WillPopScopeTestRoute.dart';
import 'ShareDataWidget.dart';
import 'ThemeTestRoute.dart';
import 'FutureBuilderRoute.dart';
import 'StreamBuilderRoute.dart';
import 'PointerEventRoute.dart';
import 'GestureDetectorTestRoute.dart';
import 'ScaleTestRoute.dart';
import 'ScaleAnimationRoute.dart';
import 'GradientButtonRoute.dart';


class Apple {
  int weight;
  int shape;
  Apple(x,y):weight = x,shape = y;

  String _color;


  String get color {
    return "red";
  }

  set color(String value) {
    _color = value;
  }

  @override
  int operator +(Object other) {
    // TODO: implement ==

    return 1;
  }

  @override
  noSuchMethod(Invocation invocation) {
    // TODO: implement noSuchMethod
    return "123";
  }



}

void main()
{
  print("12");
  (i){
    print("123" + i);
  }("12025");

  Apple app = Apple(23, 18);

  print(app.weight);
  app.weight = 1000;
  print(app.weight);
  print(app+1);
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
      ),
      routes: {
        "ScrollView":(context)=>ScrollRoute(),
        "ListView":(context)=>ListViewStatus(),
        "GridView":(context)=>GridViewTestState(),
        "CustomScrollViewTestRoute":(context)=>CustomScrollViewTestRoute(),
        "ScrollControllerTestRoute":(context)=>ScrollControllerTestRoute(),
        "ScrollNotificationTestRoute":(context)=>ScrollNotificationTestRoute(),
        "WillPopScopeTestRoute":(context)=>WillPopScopeTestRoute(),
        "InheritedWidgetTestRoute":(context)=>InheritedWidgetTestRoute(),
        "ThemeTestRoute":(context)=>ThemeTestRoute(),
        "FutureBuilderRoute":(context)=>FutureBuilderRoute(),
        "StreamBuilderRoute":(context)=>StreamBuilderRoute(),
        "PointerEventRoute":(context)=>PointerEventRoute(),
        "GestureDetectorTestRoute":(context)=>GestureDetectorTestRoute(),
        "ScaleTestRoute":(context)=>ScaleTestRoute(),
        "ScaleAnimationRoute":(context)=>ScaleAnimationRoute(),
        "GradientButtonRoute":(context)=>GradientButtonRoute(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page',
        routes: [
          "ScrollView",
          "ListView",
          "GridView",
          "CustomScrollViewTestRoute",
          "ScrollControllerTestRoute",
          "ScrollNotificationTestRoute",
          "WillPopScopeTestRoute",
          "InheritedWidgetTestRoute",
          "ThemeTestRoute",
          "FutureBuilderRoute",
          "StreamBuilderRoute",
          "PointerEventRoute",
          "GestureDetectorTestRoute",
          "ScaleTestRoute",
          "ScaleAnimationRoute",
          "GradientButtonRoute",
        ],
      ),
    );;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.routes}) : super(key: key);

  final String title;
  final List routes;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      
      body: Wrap(
        runSpacing: 0,
        spacing: 10,
        children: widget.routes.map((e) => RaisedButton(
          child: Text(e),
          onPressed: (){
            Navigator.pushNamed(context, e);
          },
        )).toList(),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
      ),
    );
  }
}
