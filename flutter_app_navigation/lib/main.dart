import 'package:flutter/gestures.dart';
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

/*
混合管理

对于一些widget来说，混搭管理的方法最有意义的。在这种情况下，有状态widget管理一些状态，并且父widget管理其他状态。
//---------------------------- ParentWidget ----------------------------
 */

class ParentWidgetC extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ParentWidgetStateC();
  }
}

class _ParentWidgetStateC extends State<ParentWidgetC> {

  bool _active = false;

  void _handleTapBoxCChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TapBoxC(
      active: _active,
      onChanged: _handleTapBoxCChanged,
    );
  }
}

class TapBoxC extends StatefulWidget {

  TapBoxC({Key key, this.active, this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TapBoxCState();
  }
}

class _TapBoxCState extends State<TapBoxC> {

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'Active' : 'InActive',
            style: new TextStyle(
              fontSize: 32,
              color: Colors.red
            ),
          ),
        ),
        height: 200.0,
        width: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? new Border.all(
            color: Colors.teal,
            width: 10,
          ) : null
        ),
      ),
    );
  }
}

/*
定义一个view,父类管理子类的状态
 */

// ParentWidget 为 TapboxB 管理状态.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {

  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapBoxB(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapBoxB extends StatelessWidget {

  //类的初始化函数

  TapBoxB({Key key, this.active, @required this.onChanged });

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleChanged() {
    onChanged(!active);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleChanged,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'TapBox-B' : 'InActive-TapB',
            style: new TextStyle(
              fontSize: 32,
              color: Colors.red
            ),
          ),
        ),
        height: 200.0,
        width: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}

/*
定义一个有状态的View，自己管理自己的状态
 */

class TapBoxA extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TapBoxAState();
  }
}

class _TapBoxAState extends State<TapBoxA> {

  var _active = true;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget buildTapBox() {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active-A' : 'InActive-A',
            style: new TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildTapBox();
  }
}

/*
自定义一个有状态的收藏按钮
 */

class FavoriteWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FavoriteWidgetState();
  }
}

//对应的favorite的状态Model

class _FavoriteWidgetState extends State<FavoriteWidget> {

  //定义两个变量。
  var _isFavoriated = true;
  var _favoriateCount = 41;

  void _toggleFavoriate() {
    setState(() {
      if (_isFavoriated) {
        _favoriateCount -= 1;
        _isFavoriated = false;
      } else {
        _favoriateCount += 1;
        _isFavoriated = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(0),
          child: new IconButton(
            icon: (_isFavoriated
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavoriate,
          ),
        ),
        new SizedBox(
          width: 18,
          child: new Container(
            child: new Text('$_favoriateCount'),
          ),
        )
      ],
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

  /*
  main images
   */
  final sectionMainImage = new Container(
    padding: EdgeInsets.all(0),
    child: new Image.asset('images/th-2.jpeg'),
  );

  /*
  rating rows
   */

  final sectionRating = new Container(
    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
            '中国西藏岩石',
             style: new TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 24,
               color: Colors.black38
             ),
            ),
            new Text(
              '中国卡岩石',
              style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.lightGreen
              ),
            )
          ],
        ),
        FavoriteWidget()
      ],
    ),
  );

  /*
  描述
   */
  final sectionDesc = new Card(
    child: new Container(
      padding: EdgeInsets.all(10),
      child: new Text(
        'stateful widget 是动态的. 用户可以和其交互 (例如输入一个表单、 或者移动一个slider滑块),或者可以随时间改变 (也许是数据改变导致的UI更新). Checkbox, Radio, Slider, InkWell, Formand TextField 都是 stateful widgets, 他们都是 StatefulWidget的子类',
        style: new TextStyle(
          color: Colors.black38,
          fontSize: 17,

        ),

      ),
    )

  );

}

class _MyHomePageState extends State<MyHomePage> {


  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {


    /*
  build icon list
   */

    Widget buildIconButton(String title, IconData icon) {
      return Container(
        padding: EdgeInsets.only(bottom: 5),
        child: new Column(
          children: <Widget>[
            new Icon(
              icon,
              color: Colors.blue,

            ),
            new Text(
              title,
              style: new TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.blue
              ),
            )
          ],
        ),
      );
    }

    var sectionIconList = new Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildIconButton('CALL', Icons.phone),
          buildIconButton('ROUTE', Icons.location_city),
          buildIconButton('SHARE', Icons.share),
        ],
      ),

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
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            widget.sectionMainImage,
            widget.sectionRating,
            new Divider(),
            sectionIconList,
            widget.sectionDesc,
            new Divider(),
            new Container(
              padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
              child: TapBoxA(),
            ),
            new Container(
              padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
              child: ParentWidget(),
            ),
            new Container(
              padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
              child: ParentWidgetC(),
            )

          ],
        ),
      ),
    );
  }
}
