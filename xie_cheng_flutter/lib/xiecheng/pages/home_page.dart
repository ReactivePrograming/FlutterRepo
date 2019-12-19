
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 100),
          ),
          RaisedButton(
            onPressed: _incrementCounter,
            child: Text('Increment Counter'),
          ),
          RaisedButton(
            onPressed: _getCounter,
            child: Text('get Counter'),
          ),
          Text(
            countString,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'result: ' + localCount,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  //增加
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + " 1";
    });
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  //获取数据
  _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
  
}

