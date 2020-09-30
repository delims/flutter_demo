import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeTestRoute extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ThemeTestRouteState();
  }
}

class _ThemeTestRouteState extends State<ThemeTestRoute>
{
  Color _themeColor = Colors.teal;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    // TODO: implement build
    return Theme (
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(
          color: _themeColor,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "主题测试",
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text("颜色跟随主题"),
              ],
            ),
            Theme(
              data:themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                  color: Colors.black,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("颜色固定黑色"),
                ],
              ),
            ),
            RaisedButton(
              child: Text("弹出对话框"),
              onPressed: () async {
                bool deleteResult = await showDeleteConfirmDialog();
                if (deleteResult == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                }

              },
            ),
            RaisedButton(
              child: Text("选择对话框"),
              onPressed: (){
                changeLanguage();
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal;
            });

          },
          child: Icon(Icons.palette),

        ),
      ),

    );
  }

  Future<bool> showDeleteConfirmDialog(){
    return showCupertinoDialog(context: context, builder: (context){
      return CupertinoAlertDialog(
        title: Text("提示",
          style: TextStyle(
            color: Colors.blue,
          ),

        ),
        content: Text("确定要删除文件吗"),
        actions: [
          FlatButton(
            child: Text("取消"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text("删除",
            style: TextStyle(
              color: Colors.red,
            ),
            ),
            onPressed: (){
              Navigator.of(context).pop(true);
            },
          )
        ],
      );
    });
  }

  Future<void> changeLanguage() async{
    int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          title: const Text("请选择语言"),
          children: [
            SimpleDialogOption(
              onPressed: (){
                Navigator.pop(context,1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text("中文简体"),
              ),
            ),
            SimpleDialogOption(
              onPressed: (){
                Navigator.pop(context,2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text("English"),
              ),
            )
          ],

        );
      }
    );
  if (i != null) {
    print("选择了：${i == 1 ? "中文简体":"English"}");
  }
  }
}