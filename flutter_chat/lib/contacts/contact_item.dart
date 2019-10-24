
import 'package:flutter/material.dart';
import 'package:flutter_chat/contacts/contact_vo.dart';

class ContactItem extends StatelessWidget {

  //item 数据
  final ContactVO item;
  //标题名
  final String titleName;
  //图片路径
  final String imageName;

  ContactItem({this.item, this.titleName, this.imageName});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //列表容器
    return Container(
      //表框修饰
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xFFd9d9d9)
          )
        ),
      ),
      height: 52.0,
      child: FlatButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            imageName == null ? Image.network(item.avatarUrl != '' ? item.avatarUrl : 'http://pic22.nipic.com/20120621/8126152_092948620000_2.jpg', width: 36, height: 36,scale: 0.9,) :
                Image.asset(imageName, width: 36, height: 36,),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Text(
                titleName == null ? item.name ?? '暂时' : titleName
              ),
            ),
          ],
        ),
      ),
    );
  }
}