

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/message_data.dart';
import 'package:flutter_chat/common/touch_callback.dart';

class MessageItem extends StatelessWidget {

  //数据
  final MessageData message;

  MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.grey,
          ),
        )
      ),
      height: 64,
      child: TouchCallBack(
        onPressed: () {
          print("pressed cell");
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //头像
            Container(
              //头像左右有边距
              margin: const EdgeInsets.only(left: 13, right: 13),
              child: Image.network(message.avatar, width: 48, height: 48,),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff353535),
                    ),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                  ),
                  Text(
                    message.subTitle,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xffa9a9a9),
                    ),
                    maxLines: 1,
                    //显示不完使用省略号
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            //时间显示
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.only(right: 12.0, left: 12.0, top: 5),
              child: Text(
                //格式化时间
                formatDate(message.time, [HH, ":", nn, ":", ss]).toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffa9a9a9),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}