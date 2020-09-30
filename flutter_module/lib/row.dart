import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class RowTestWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 88, 0, 0),
          color: Colors.grey.withAlpha(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("hello world"),
                  Text("i am Jack"),
                ],
              ),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Hello world"),
                  Text("I an Jack"),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Text("1"),
                  Text("2"),
                  Text("3"),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: RaisedButton(
                      child: Text("submit"),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: RaisedButton(
                      child: Text("submit"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: RaisedButton(
                      child: Text("submit"),
                    ),
                  ),
                ],
              ),
              Text("***"*100,
              maxLines: 1,
              ),
              Wrap(
                alignment: WrapAlignment.end,
                spacing: 10,
                runSpacing: 0,
                runAlignment: WrapAlignment.end,
                children: <Widget>[
                  FlatButton(
                    color: Colors.grey,
                    textColor: Colors.white,
                    child: Text("FlatButton1"),
                    onPressed: (){},
                  ),
                  FlatButton(
                    color: Colors.grey,
                    textColor: Colors.white,
                    child: Text("FlatButton2"),
                    onPressed: (){},
                  ),
                  FlatButton(
                    color: Colors.grey,
                    textColor: Colors.white,
                    child: Text("FlatButton3"),
                    onPressed: (){},
                  ),

                  FlatButton(
                    color: Colors.grey,
                    textColor: Colors.white,
                    child: Text("FlatButton4"),
                    onPressed: (){},
                  ),
                  FlatButton(
                    color: Colors.grey,
                    textColor: Colors.white,
                    child: Text("FlatButton5"),
                    onPressed: (){},
                  ),
                  FlatButton(
                    color: Colors.grey,
                    textColor: Colors.white,
                    child: Text("FlatButton6"),
                    onPressed: (){},
                  ),
                  FlatButton(
                    color: Colors.grey,
                    textColor: Colors.white,
                    child: Text("FlatButton7"),
                    onPressed: (){},
                  ),
                  Flow(
                    delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                    children: <Widget>[
                      new Container(width: 80.0, height:80.0, color: Colors.red,),
                      new Container(width: 80.0, height:80.0, color: Colors.green,),
                      new Container(width: 80.0, height:80.0, color: Colors.blue,),
                      new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
                      new Container(width: 80.0, height:80.0, color: Colors.brown,),
                      new Container(width: 80.0, height:80.0,  color: Colors.purple,),
                    ],
                  ),
                ],
              ),
            ],
            



          ),
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}