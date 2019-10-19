import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '容器Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            MyContainer(),
//            MyGridView(),
//            MyListView(),
//            MyStackView(),
//            MyCardWithListTitle()
          ],
        ),
//        child: MyContainer(),
//        child: MyGridView(),
//        child: MyListView(),
//        child: MyStackView(),
//        child: MyCardWithListTitle(),
      )

    );
  }
}

//Container 容器类
/*
Container 概要 :

添加padding, margins, borders
改变背景颜色或图片
包含单个子widget，但该子widget可以是Row，Column，甚至是widget树的根
 */

class MyContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.black26,
      ),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius: const BorderRadius.all(const Radius.circular(8)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/th-2.jpeg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius: const BorderRadius.all(const Radius.circular(8)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/th-3.jpeg'),
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius: const BorderRadius.all(const Radius.circular(8)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/th-4.jpeg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius: const BorderRadius.all(const Radius.circular(8)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/th-5.jpeg'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*
GridView使用说明；
使用GridView将widget放置为二维列表。 GridView提供了两个预制list，或者您可以构建自定义网格。当GridView检测到其内容太长而不适合渲染框时，它会自动滚动。

GridView 概览:

在网格中放置widget
检测列内容超过渲染框时自动提供滚动
构建您自己的自定义grid，或使用一下提供的grid之一:
GridView.count 允许您指定列数
GridView.extent 允许您指定项的最大像素宽度

 */
class MyGridView extends StatelessWidget {
  
  List<Container> _buildGridTitleList(int count) {
    return new List<Container>.generate(count, (int index) => new Container(
      child: new Image.asset('images/th-${index+1}.jpeg'),
    ));
  }

  Widget buildGrid() {
    return new GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.9,
      children: _buildGridTitleList(29),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildGrid();
  }
}

/*
ListView
ListView是一个类似列的widget，它的内容对于其渲染框太长时会自动提供滚动。

ListView 摘要:

用于组织盒子中列表的特殊Column
可以水平或垂直放置
检测它的内容超过显示框时提供滚动
比Column配置少，但更易于使用并支持滚动
 */

class MyListView extends StatelessWidget {

  List<Widget> list = <Widget>[
    new ListTile(
      title: new Text(
          'CineArts at the Empire',
        style: new TextStyle(
          fontWeight: FontWeight.w500, fontSize: 20
        ),
      ),
      subtitle: new Text('85 W Portail Ave'),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue,
      ),
    ),
    new ListTile(
      title: new Text(
        'CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20
        ),
      ),
      subtitle: new Text('85 W Portail Ave'),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue,
      ),
    ),
    new ListTile(
      title: new Text(
        'CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20
        ),
      ),
      subtitle: new Text('85 W Portail Ave'),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue,
      ),
    ),
    new ListTile(
      title: new Text(
        'CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20
        ),
      ),
      subtitle: new Text('85 W Portail Ave'),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new ListView(
        children: list,
      ),
    );
  }

}

/*

stack View

使用Stack来组织需要重叠的widget。widget可以完全或部分重叠底部widget。

Stack summary:

用于与另一个widget重叠的widget
子列表中的第一个widget是base widget; 随后的子widget被覆盖在基础widget的顶部
Stack的内容不能滚动
您可以选择剪切超过渲染框的子项
 */

class MyStackView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      alignment: const Alignment(0.6, 0.6),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: AssetImage('images/th-20.jpeg'),
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black38
          ),
          child: new Text(
            'Havi Lee',
            style: new TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}

/*
Card

Card 摘要:

实现了一个 Material Design card
接受单个子项，但该子项可以是Row，Column或其他包含子级列表的widget
显示圆角和阴影
Card内容不能滚动
Material Components 库的一个widget

list title
ListTile 摘要:

包含最多3行文本和可选图标的专用行
比起Row不易配置，但更易于使用
Material Components 库里的widget
 */

class MyCardWithListTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SizedBox(
      height: 300,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('1625 Main Street', style: new TextStyle(fontWeight: FontWeight.w500),),
              subtitle: new Text('this is test'),
              leading: new Icon(Icons.restaurant_menu, color: Colors.blue,)
            ),
            new Divider(),
            new ListTile(
                title: new Text('1625 Main Street', style: new TextStyle(fontWeight: FontWeight.w500),),
                subtitle: new Text('this is test'),
                leading: new Icon(Icons.restaurant_menu, color: Colors.blue,)
            ),
            new ListTile(
                title: new Text('1625 Main Street', style: new TextStyle(fontWeight: FontWeight.w500),),
                subtitle: new Text('this is test'),
                leading: new Icon(Icons.restaurant_menu, color: Colors.blue,)
            ),
          ],
        ),
      ),
    );
  }
}