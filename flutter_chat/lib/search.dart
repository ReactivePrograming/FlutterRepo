
import 'package:flutter/material.dart';
import 'package:flutter_chat/common/touch_callback.dart';

class Search extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchState();
  }
}

class _SearchState extends State<Search> {

  //首先定义一个焦点
  FocusNode focusNode = new FocusNode();

  //聚焦的方法

  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  //文本组件

  _getText(String text) {
    return TouchCallBack(
      isfeed: false,
      onPressed: () {},
      child: Text(
        text,
        style: new TextStyle(
          fontSize: 14,
          color: Color(0xff1aad19),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Container(
        //距离顶部距离
        margin: const EdgeInsets.only(top: 25),
        //一行的布局
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //导航栏布局
            Stack(
              children: <Widget>[
                //返回按钮
                TouchCallBack(
                  isfeed: false,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45.0,
                    margin: const EdgeInsets.only(left: 12.0, right: 10.0),
                    //返回按钮
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                ),
                //搜索界面
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45,
                  margin: EdgeInsets.only(left: 45, right: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Colors.green
                      )
                    )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: //输入框
                        TextField(
                          //请求获取焦点
                          focusNode: _requestFocus(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          onChanged: (String text) {

                          },
                          decoration: InputDecoration(
                              hintText: '搜索',
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      //添加麦克风
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),

            //常用搜索
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                '常用搜索',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffb5b5b5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('朋友'),
                  _getText('聊天'),
                  _getText('群组')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('Flutter'),
                  _getText('Dart'),
                  _getText('C++')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}