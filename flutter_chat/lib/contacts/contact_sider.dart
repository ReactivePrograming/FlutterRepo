
import 'package:flutter/material.dart';
import 'package:flutter_chat/contacts/contact_vo.dart';

class ContactSiderList extends StatefulWidget {

  //数据源
//  好友列表
  final List <ContactVO> items;
//  好友列表构造器
  final IndexedWidgetBuilder headerBuilder;
//  好友列表构造器
  final IndexedWidgetBuilder itemBuilder;
//  字母构造器
  final IndexedWidgetBuilder sectionBuilder;

  ContactSiderList({Key key, @required this.items, @required this.itemBuilder, this.headerBuilder, @required this.sectionBuilder}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContactState();
  }

}

class _ContactState extends State<ContactSiderList> {

//  列表滚动控制器

  final ScrollController _scrollController = new ScrollController();
//  滚动行为监听
  bool _onNotification(ScrollNotification notification) {
    return true;
  }

//  判断并显示头部视图或空容器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

//  根据定位判断是否显示好友列表

  bool _shouldShowHeader(int position) {
    if (position <= 0) {
      return false;
    }

    if(position != 0 && widget.items[position].seationKey != widget.items[position-1].seationKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      _isShowHeaderView(index),
                      Offstage(
                        offstage: _shouldShowHeader(index),
                        child: widget.sectionBuilder(context, index),
                      ),
                      Column(

                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

