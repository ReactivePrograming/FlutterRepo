import 'package:flutter/material.dart';
import 'package:flutter_stock/home/StockHome.dart';

void main() => runApp(StockApp());

class StockApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StockAppState();
  }
}

class StockAppState extends State<StockApp> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      //home: ,//首先考虑
      title: '股市牛市',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/" : (BuildContext context) => StockHome(),

      },
    );
  }
}
