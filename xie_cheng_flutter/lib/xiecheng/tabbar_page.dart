
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/my_page.dart';
import 'pages/search_page.dart';
import 'pages/travel_page.dart';

class TabNavigator extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabNavigatorState();
  }
}

class _TabNavigatorState extends State<TabNavigator> with SingleTickerProviderStateMixin {
  //定义我们的局部变量

  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
  // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[HomePage(), SearchPage(), TravelPage(), MyPage()],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _defaultColor,),
            activeIcon: Icon(Icons.home, color: _activeColor,),
            title: Text(
                '首页',
                style: TextStyle(
                  color: _currentIndex != 0 ? _defaultColor : _activeColor,
                ),
            )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _defaultColor,),
              activeIcon: Icon(Icons.search, color: _activeColor,),
              title: Text(
                '搜索',
                style: TextStyle(
                  color: _currentIndex != 1 ? _defaultColor : _activeColor,
                ),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt, color: _defaultColor,),
              activeIcon: Icon(Icons.camera_alt, color: _activeColor,),
              title: Text(
                '旅拍',
                style: TextStyle(
                  color: _currentIndex != 2 ? _defaultColor : _activeColor,
                ),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: _defaultColor,),
              activeIcon: Icon(Icons.account_circle, color: _activeColor,),
              title: Text(
                '我的',
                style: TextStyle(
                  color: _currentIndex != 3 ? _defaultColor : _activeColor,
                ),
              )
          ),
        ],
      ),
    );
  }
}






















