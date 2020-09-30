import 'package:flutter/cupertino.dart';

class WillPopScopeTestRoute extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute>
{
  DateTime _lastPressedAt;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child:GestureDetector(
          child:  Text("1秒之内连续按两次返回键退出",style: TextStyle(
            fontSize: 14,
            decoration: TextDecoration.none,
          ),
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

}