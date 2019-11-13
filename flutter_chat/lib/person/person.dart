
import 'package:flutter/material.dart';
import 'package:flutter_chat/common/touch_callback.dart';
import 'package:flutter_chat/person/im_item.dart';

class PersonInfo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonInfoState();
  }

}

class _PersonInfoState extends State<PersonInfo> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          //头像
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.white,
            height: 80,
            child: TouchCallBack(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //头像
                  Container(
                    margin: const EdgeInsets.only(left: 12, right: 15),
                    child: Image.asset('images/yixiu.jpeg', width: 70, height: 79,),
                  ),
                  //用户名
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '一宿',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff353535)
                          ),
                        ),
                        Text(
                          '账号一宿',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff353535)
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, right: 15),
                    child: Image.asset('images/code.png', width: 24, height: 24,),
                  )
                ],
              ),
              onPressed: () {

              },
            ),
          ),
          //列表项
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.white,
            child: ImItem(
              title: '好友动态',
              imagePath: 'images/icon_me_friends.png',
            ),
          ),
          //其他
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ImItem(
                  title: '消息管理',
                  imagePath: 'images/icon_me_message.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                ),
                ImItem(
                  title: '我的相册',
                  imagePath: 'images/icon_me_photo.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                ),
                ImItem(
                  title: '我的文件',
                  imagePath: 'images/icon_me_file.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Colors.grey,
                  ),
                ),
                ImItem(
                  title: '联系客服',
                  imagePath: 'images/icon_me_service.png',
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.white,
            child: ImItem(
              title: '清理缓存',
              imagePath: 'images/icon_me_clear.png',
            ),
          )
        ],
      ),
    );
  }
}