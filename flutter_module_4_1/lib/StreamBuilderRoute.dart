import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamBuilderRoute extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StreamBuilderRouteState();
  }
}

class StreamBuilderRouteState extends State<StreamBuilderRoute>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Theme(
        data: ThemeData.light(),
        isMaterialAppTheme: true,
        child: StreamBuilder<int>(
          stream: counter(),
          builder: (BuildContext context,AsyncSnapshot<int> snapshot){
            if (snapshot.hasError){
              return Text("Error:${snapshot.error}");
            }
            switch (snapshot.connectionState){
              case ConnectionState.none:
                return Text("没有Stream");
              case ConnectionState.waiting:
                return Text("等待数据。。");
              case ConnectionState.active:
                return Text("active:${snapshot.data}",
                 style: TextStyle(
                   decoration: TextDecoration.none,
                   fontSize: 14,
                   color: Colors.yellow,
                 ),
                );
              case ConnectionState.done:
                return Text("Stream 已关闭");
            }
            return Text("default");
          },
        ),
      )
    );
  }
}

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1),(i){
    return i;
  });
}


