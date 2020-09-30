import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "hello",
      home: Scaffold(
        appBar: AppBar(
          title: Text("NavigationBar"),
        ),
        body: Center(
//          padding: EdgeInsets.fromLTRB(10, 88, 10, 50),
          child: Column(
            children: <Widget>[
              Text("我是第一个",
                style: TextStyle(
                  backgroundColor: Colors.grey,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              Switch(value: true, onChanged: (value){}),
              Checkbox(value: true, onChanged: (value){}),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或者邮箱",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "你的登录密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              DelimsStatefulWidget(),
              LinearProgressIndicator(
                backgroundColor: Colors.blue,
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ),
              Container(
                height: 20,
              ),
              LinearProgressIndicator(
                backgroundColor: Colors.green,
                value: 0.5,
              ),
              Container(
                height: 20,
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.green,
                value: 0.8,
              ),
              SizedBox(
                height: 30,
                width: 100,

                child: RaisedButton(
                  child: Text("submit",style: TextStyle(color: Colors.white),),
                  color: Colors.green,
                  textColor: Colors.blue,
                  colorBrightness: Brightness.dark,
                ),

              )


            ],
          ),
        ),
      ),
    );
  }
}

class DelimsStatefulWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DelimsStatefulWidgetState();
    throw UnimplementedError();
  }
}

class DelimsStatefulWidgetState extends State<DelimsStatefulWidget>
{
  bool _valid = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      child: Center(
        child: Checkbox(
          value: _valid,
          onChanged: (value){
            setState(() {
              _valid = value;
            });
          },
        ),
      ),

    );
  }
}