
import 'package:flutter/material.dart';
import 'package:xiecheng_app/widget/search_bar.dart';

class SearchPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SearchBar(
            hideLeft: true,
            defaultText: '旅游搜索',
            hint: '123',
            leftButtonClick: () {
              Navigator.pop(context);
            },
            onChanged: _onTextChanged,
          )
        ],
      )
    );
  }

  //
  _onTextChanged(text) {

  }


}