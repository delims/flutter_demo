import 'package:flutter/cupertino.dart';

class ScaleTestRoute extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScaleTestRouteState();
  }
}


class _ScaleTestRouteState extends State<ScaleTestRoute>
{
  double _width = 200.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
        child: Image.network(
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2164724814,1401845036&fm=26&gp=0.jpg",
          width: _width,
        ),
        onScaleUpdate: (ScaleUpdateDetails details){
          setState(() {
            _width = 200 * details.scale.clamp(0.08, 10.0);
          });
        },
      ),
    );
  }
}