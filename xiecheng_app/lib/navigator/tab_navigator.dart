import 'package:flutter/material.dart';
import 'package:xiecheng_app/pages/home_page.dart';
import 'package:xiecheng_app/pages/my_page.dart';
import 'package:xiecheng_app/pages/search_page.dart';
import 'package:xiecheng_app/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabNavigatorState();
  }
}

class TabNavigatorState extends State<TabNavigator> {

  //set the color for default and active tab items
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  //记录当前选中的索引
  int _currentIndex = 0;

  //flutter 中都是widget，记住这句话
  final PageController _pageController = PageController(
    initialPage: 0
  );



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          SearchPage(hideLeft: true,),
          TravelPage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,//定义默认的index
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },//相应点击事件
        type: BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _defaultColor,),
            activeIcon: Icon(Icons.home, color: _activeColor,),
            title: Text(
              '首页',
              style: TextStyle(color: _currentIndex != 0 ? _defaultColor:_activeColor),
            )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _defaultColor,),
              activeIcon: Icon(Icons.search, color: _activeColor,),
              title: Text(
                '搜索',
                style: TextStyle(color: _currentIndex != 1 ? _defaultColor:_activeColor),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt, color: _defaultColor,),
              activeIcon: Icon(Icons.camera_alt, color: _activeColor,),
              title: Text(
                '旅拍',
                style: TextStyle(color: _currentIndex != 2 ? _defaultColor:_activeColor),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: _defaultColor,),
              activeIcon: Icon(Icons.account_circle, color: _activeColor,),
              title: Text(
                '我的',
                style: TextStyle(color: _currentIndex != 3 ? _defaultColor:_activeColor),
              )
          ),
        ],
      ),
    );
  }


}