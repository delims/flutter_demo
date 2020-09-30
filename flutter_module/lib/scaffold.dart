import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScaffoldRouteState();
    throw UnimplementedError();
  }
}

class _ScaffoldRouteState extends State<ScaffoldRoute> with SingleTickerProviderStateMixin
{
  int _selectedIndex = 1;
  TabController _tabController;
  List tabs = ["新闻","历史","图片"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "MaterialApp",
      home: Scaffold(
        appBar: AppBar(
          title: Text("appBar"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: (){},
            )
          ],
          elevation: 10,
          bottom: TabBar(
            controller: _tabController,
//            tabs: tabs.map((e) => Tab(text: e,)).toList(),
            tabs: <Widget>[
              Tab(text: "历史",
                icon: Icon(Icons.map),
              ),
              Tab(text: "文化",),
              Tab(text: "政治",),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) => Container(
            alignment: Alignment.center,
            child: RaisedButton(
              child: Text(e),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: (){},
            ),
          )).toList(),
        ),

        drawer: MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text("Home"),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text("Business"),
              icon: Icon(Icons.business),
            ),
            BottomNavigationBarItem(
              title: Text("School"),
              icon: Icon(Icons.school),
            ),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
              print(index);
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
        ),


      ),
    );

  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 88.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}