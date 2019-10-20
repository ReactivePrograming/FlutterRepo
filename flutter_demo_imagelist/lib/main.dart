import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //定义标题行

  Widget titleSection = new Container(
    padding: const EdgeInsets.all(15),
    child: new Row(
      children: <Widget>[
        new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    '这是一个测试的界面',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  '这是一个sub title',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            )
        ),

        new Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        new Text(
            '42'
        )
      ],
    ),
  );



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    //按钮行具有重复性，可以抽离成一个函数

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color,),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    //定义button 行

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Column>[
          buildButtonColumn(Icons.call, 'Call'),
          buildButtonColumn(Icons.near_me, 'Route'),
          buildButtonColumn(Icons.share, 'Share'),
        ],
      ),
    );

    //定义text
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32),
      child: new Text(
        '''
        如何修改你的应用程序，使其对用户动作做出反应？在本教程中，您将为widget添加交互。 具体来说，您将通过创建一个管理两个无状态widget的自定义有状态的widget来使图标可以点击。
        ''',
        softWrap: true,
      ),
    );


    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return new MaterialApp(
      title: "图文混排",
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('图文混排'),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/coast.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );

  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//  //定义标题行
//
//  Widget titleSection = new Container(
//    padding: const EdgeInsets.all(15),
//    child: new Row(
//      children: <Widget>[
//        new Expanded(
//            child: new Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                new Container(
//                  padding: const EdgeInsets.only(bottom: 8.0),
//                  child: new Text(
//                    '这是一个测试的界面',
//                    style: new TextStyle(
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ),
//                new Text(
//                  '这是一个sub title',
//                  style: new TextStyle(
//                    color: Colors.grey[500],
//                  ),
//                )
//              ],
//            )
//        ),
//
//        new Icon(
//          Icons.star,
//          color: Colors.red[500],
//        ),
//        new Text(
//          '42'
//        )
//      ],
//    ),
//  );
//
//  //按钮行具有重复性，可以抽离成一个函数
//
//  Column buildButtonColumn(IconData icon, String label) {
//    Color color = Theme.of(context).primaryColor;
//
//    return new Column(
//      mainAxisSize: MainAxisSize.min,
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        new Icon(icon, color: color,),
//        new Container(
//          margin: const EdgeInsets.only(top: 8.0),
//          child: new Text(
//            label,
//            style: new TextStyle(
//              fontSize: 12.0,
//              fontWeight: FontWeight.w400,
//              color: color,
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//
//  //定义button 行
//
//  Widget buttonSection = new Container(
//    child: new Row(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Column>[
//        buildButtonColumn(Icons.call, 'Call'),
//        buildButtonColumn(Icons.near_me, 'Route'),
//        buildButtonColumn(Icons.share, 'Share'),
//      ],
//    ),
//  );
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      body: new ListView(
//        children: <Widget>[
//          new Image.asset(
//            'images/coast.jpg',
//            width: 600,
//            height: 240,
//            fit: BoxFit.cover,
//          ),
//          titleSection,
//        ],
//      )
//    );
//  }
//}
