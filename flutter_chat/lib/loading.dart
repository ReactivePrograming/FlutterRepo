
import 'package:flutter/cupertino.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingState();
  }
}

class _LoadingState extends State<LoadingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      print('Flutter 即时通讯');
      Navigator.of(context).pushReplacementNamed('app');

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: Stack(
        children: <Widget>[
          Image.asset("images/loading.jpeg",fit: BoxFit.cover,)
        ],
      ),
    );
  }
}