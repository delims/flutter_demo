import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderRoute extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FutureBuilderRouteState();
  }
}

class FutureBuilderRouteState extends State<FutureBuilderRoute>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if (snapshot.hasError){
                return Text("Error: ${snapshot.error}");
              } else {
                return Text("Contents: ${snapshot.data}");
              }
            } else if(snapshot.connectionState == ConnectionState.waiting){
//              return Text("waiting");
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.active){
              return Text("active");
            } else if (snapshot.connectionState == ConnectionState.none){
              return Text("none");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<String> mockNetworkData() async
{
  return Future.delayed(Duration(seconds: 3), () => "我是从互联网上获取的数据");
}