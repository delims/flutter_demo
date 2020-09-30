import 'package:flutter/cupertino.dart';

class ScaleAnimationRoute extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScaleAnimationRouteState();
  }
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    controller = new AnimationController(
//      duration: const Duration(seconds: 3),
//      vsync: this,
//    );
//    animation = CurvedAnimation(
//      parent: controller,
//      curve: Curves.bounceIn,
//    );
//
//    animation = new Tween(
//      begin: 0.0,
//      end: 300.0,
//    ).animate(controller)..addListener((){
//      setState(() {
//
//      });
//    });
//    controller.forward();
//  }

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 120.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    //启动动画（正向）
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Image.network(
        "http://pic1.win4000.com/wallpaper/6/59bb3a0fce2c8.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }




}