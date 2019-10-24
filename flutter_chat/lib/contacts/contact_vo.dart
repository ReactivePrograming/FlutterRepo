
import 'package:flutter/cupertino.dart';

class ContactVO {
  //字母排列值
  String seationKey;
  //title
  String name;

  String avatarUrl;

  //构造函数
  ContactVO({@required this.seationKey, this.name, this.avatarUrl});
}

List<ContactVO> contactData = [
  new ContactVO(
    seationKey: 'A',
    name: '张三',
    avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'A',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'F',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'A',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'A',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'E',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'A',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'A',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'D',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'A',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'A',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'B',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'B',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'B',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'C',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'C',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'A',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'J',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'J',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'J',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'K',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'K',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'K',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  ),
  new ContactVO(
      seationKey: 'Z',
      name: '张三',
      avatarUrl: 'https://cn.bing.com/th?id=OIP.TiKxade-C2zcWIh2z4g5mQHaLH&o=5&pid=1.7&rs=1'
  )

];