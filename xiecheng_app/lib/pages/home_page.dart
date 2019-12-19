
import 'package:flutter/material.dart';
import 'package:xiecheng_app/dao/home_dao.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  String resultString = "meiyou";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() {
    HomeDao.fetch().then((result) {
      setState(() {
        resultString = json.encode(result.config);
      });
    }).catchError((error){
      setState(() {
        resultString = error.toString();
      });
    });
    /*
    or
     */
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Text(
          resultString,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}