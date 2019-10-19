import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  //定义一个大标题

  var titieSection = new Container(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: new Text(
      '这是一个大大的Title',
      style: new TextStyle(
        fontWeight: FontWeight.w100,
        fontSize: 25,
        color: Colors.black45,
      ),
    ),
  );

  //定义一个子标题

  var subTitleSection = new Container(
    padding: EdgeInsets.all(5),
    child: new Text(
      '这是我测试的一个子Title,Pavlova图片来自 Pixabay ，可以在Creative Commons许可下使用。 您可以使用Image.network直接从网上下载显示图片，但对于此示例，图像保存到项目中的图像目录中，添加到pubspec文件.',
      style: new TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        color: Colors.lightGreen
      ),
    ),
  );

  //定义ratings界面

  var ratingSection = new Container(
    padding: EdgeInsets.all(5),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Icon(Icons.star, color: Colors.red,),
            new Icon(Icons.star, color: Colors.red,),
            new Icon(Icons.star, color: Colors.red,),
            new Icon(Icons.star, color: Colors.red,),
            new Icon(Icons.star, color: Colors.red,),
          ],
        ),
        new Text(
          '170 Stars',
          style: new TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 5,
            fontSize: 20
          ),
        ),
      ],
    ),
  );


  //类似于ios的初始化函数
  @override
  Widget build(BuildContext context) {

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2.0,
    );

    //四个button界面

    var iconListSection = DefaultTextStyle.merge(
      style: descTextStyle,
      child: new Container(
        padding: EdgeInsets.all(5),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Icon(Icons.kitchen, color: Colors.green,),
                new Text('PREP:'),
                new Text('25 min')
              ],
            ),
            new Column(
              children: <Widget>[
                new Icon(Icons.timer, color: Colors.green,),
                new Text('PREP:'),
                new Text('1 hour')
              ],
            ),
            new Column(
              children: <Widget>[
                new Icon(Icons.restaurant, color: Colors.green,),
                new Text('PREP:'),
                new Text('4 - 6')
              ],
            )
          ],
        ),
      ),
    );

    //左侧视图

    var leftColumn = new Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: new Column(
        children: <Widget>[
          titieSection,
          subTitleSection,
          ratingSection,
          iconListSection,
        ],
      ),
    );

    var mainImage = new Container(
      padding: EdgeInsets.all(5),
      child: new Image.asset('images/aaa.png'),
    );
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Container(
          margin: new EdgeInsets.all(5),
          height: 600,
          child: new Card(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: 300,
                  child: leftColumn,
                ),
                new Expanded(
                  child: mainImage,
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
