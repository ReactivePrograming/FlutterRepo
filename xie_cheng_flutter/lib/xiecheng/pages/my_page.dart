
import 'dart:convert';

import 'package:xie_cheng_flutter/xiecheng/CommonModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {

  String showResult = '初始值';

  Future<CommonModel> _fetchPost() async {
    final response = await http.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(response.body);
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Text(showResult),
            ),
            GestureDetector(
              child: Text("点我",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
              onTap: () {
                _fetchPost().then((value) {
                  setState(() {
                    showResult = '请求结果：${value.icon}';
                  });
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}