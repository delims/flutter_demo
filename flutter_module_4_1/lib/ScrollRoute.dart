import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollRoute extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String str = "ABCDEFGHIGKLMNOPQRSTUVWXYZ"*3;
    return MaterialApp(
      title: "title",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ScollView"),
          leading: BackButton(
            color: Colors.white,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),

        body:Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: str.split("").map((e) => Text(e,textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.blue,
//                    backgroundColor: Colors.orange,
                    decorationColor: Colors.black,
                ),)).toList(),
              ),
            ),
          ),
        ),

      ),
    );
    throw UnimplementedError();
  }
}

class ListViewStatus extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text("商品列表"),
            ),
            Expanded (
              child: ListView.builder(
                  itemCount: 50,
                  itemExtent: 40,
                  itemBuilder:(BuildContext context, int index){
                    return ListTile(title: Text("商品$index"),);
                  },
              ),
            ),
          ],

        ),

      ),
    );
  }
}