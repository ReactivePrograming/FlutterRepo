
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xie_cheng_flutter/xiecheng/CommonModel.dart';

class SearchPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==  _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();

  }

  List<String> cities = ['北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '郑州'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('网格视图'),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
          controller: _scrollController,
          children: _buildList(),
        ),
      )
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cities = cities.reversed.toList();
    });
    return null;
  }

  _loadData() async {
    await Future.delayed(Duration(seconds: 200));
    setState(() {
      List<String> list = List<String>.from(cities);
      list.addAll(cities);
      cities = list;
    });
  }

  //
  List<Widget> _buildList() {
    return cities.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(city),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  //future demo

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Container(
//      height: 200,
//      child: FutureBuilder<CommonModel>(
//        future: fetchPost(),
//        builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
//          switch (snapshot.connectionState) {
//            case ConnectionState.none:
//              return Container(
//                padding: EdgeInsets.only(top: 80),
//                child: Text('Input a url to Start'),
//              );
//            case ConnectionState.waiting:
//              return Center(child: CircularProgressIndicator(),);
//            case ConnectionState.active:
//              return Text('');
//            case ConnectionState.done:
//              if (snapshot.hasError) {
//                return Text(
//                  '${snapshot.error}',
//                  style: TextStyle(color: Colors.red),
//                );
//              } else {
//                return Container(
//                  padding: EdgeInsets.only(top: 100),
//                  child:  Column(
//                    children: <Widget>[
//                      Text('done')
//                    ],
//                  ),
//                );
//              }
//          }
//          return Text("none");
//        },
//      ),
//    );
//  }
}