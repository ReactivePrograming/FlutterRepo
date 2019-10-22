import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/message_page.dart';
import 'package:flutter_chat/contacts/contacts.dart';
import 'package:flutter_chat/person/person.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}

class AppState extends State<App> {

  //记录当前selected index
  var _currentIndex = 0;
  //三大模块
  Message message;
  Contacts contacts;
  PersonInfo personInfo;

  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (message == null) {
          message = new Message();
        }
        return message;
      case 1:
        if (contacts == null) {
          contacts = new Contacts();
        }
        return contacts;
      case 2:
        if (personInfo == null) {
          personInfo = new PersonInfo();
        }
        return personInfo;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('即时通讯'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              //search 界面
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                //menu
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      // 底部导航栏
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,//通过fixed color设置选中的颜色
        currentIndex: _currentIndex,
        onTap: ((index){
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          new BottomNavigationBarItem(
            title: new Text(
              '聊天',
              style: new TextStyle(
                color: _currentIndex == 0 ? Color(0xFF46c01b) : Color(0xFF999999),
              ),
            ),
            icon: _currentIndex == 0 ?
                Image.asset('images/message_pressed.png',width: 32.0, height: 28.0,) :
                Image.asset('images/message_normal.png',width: 32.0, height: 28.0,)
          ),
          new BottomNavigationBarItem(
              title: new Text(
                '好友',
                style: new TextStyle(
                  color: _currentIndex == 1 ? Color(0xFF46c01b) : Color(0xFF999999),
                ),
              ),
              icon: _currentIndex == 1 ?
              Image.asset('images/contact_list_pressed.png',width: 32.0, height: 28.0,) :
              Image.asset('images/contact_list_normal.png',width: 32.0, height: 28.0,)
          ),
          new BottomNavigationBarItem(
              title: new Text(
                '我的',
                style: new TextStyle(
                  color: _currentIndex == 2 ? Color(0xFF46c01b) : Color(0xFF999999),
                ),
              ),
              icon: _currentIndex == 2 ?
              Image.asset('images/profile_pressed.png',width: 32.0, height: 28.0,) :
              Image.asset('images/profile_normal.png',width: 32.0, height: 28.0,)
          ),
        ],
      ),
      //显示的界面
      body: currentPage(),
    );
  }
}