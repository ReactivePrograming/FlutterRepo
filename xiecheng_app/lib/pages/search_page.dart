
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {

  List list = new List();

  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      print('refresh');
      setState(() {
        list = List.generate(20, (i) => '哈喽,我是新刷新的 $i');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: RefreshIndicator(
        child: ListView.builder(
          itemBuilder: _renderRow,
          itemCount: list.length,
        ),
        onRefresh: _onRefresh,
      )
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    return ListTile(
        title: Text(list[index]),
    );
  }
}