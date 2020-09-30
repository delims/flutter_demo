import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScrollControllerTestRouteState();
  }
}
class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute>
{
  ScrollController _controller = ScrollController();
  bool showTopButton = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoll Controller"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (context,index){
            return ListTile(title: Text("$index"),);
          },
          itemExtent: 40,
          itemCount: 100,
          controller: _controller,
        ),
      ),
      floatingActionButton: !showTopButton ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _controller.animateTo(
              0.0,
              duration: Duration(microseconds: 500),
              curve: Curves.ease);
        },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showTopButton){
        setState(() {
          showTopButton = false;
        });
      } else if (_controller.offset >= 1000 && (showTopButton == false)){
        setState(() {
          showTopButton = true;
        });
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}


