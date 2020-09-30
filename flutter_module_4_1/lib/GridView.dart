import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewTestState extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "MaterialApp",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
        ),
        body: Container(
          child: GridView(
           padding: EdgeInsets.zero,
           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
             maxCrossAxisExtent: 120,
             childAspectRatio: 1,
           ),
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast),
              GridView.extent(maxCrossAxisExtent: 50,
                childAspectRatio: 2,
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast),
                ],
              )
            ],

          ),
        ),
      ),

    );
    throw UnimplementedError();
  }
}