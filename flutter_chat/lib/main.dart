import 'package:flutter/material.dart';
import 'package:flutter_chat/search.dart';
import './app.dart';
import './loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  /*
    定义Theme Data
   */

  final mThemeData = new ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xFFebebeb),
    cardColor: Colors.green
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat Demo',
      theme: mThemeData,
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => new App(),
        "/friends": (_) => WebviewScaffold(
          url: "https://baidu.com",
          appBar: new AppBar(
            title: new Text('Flutter WebView'),
          ),
          withZoom: true,
          withLocalStorage: true,
        ),
        "search": (BuildContext context) => new Search(),
      },
      home: new LoadingPage(),
    );
  }
}

