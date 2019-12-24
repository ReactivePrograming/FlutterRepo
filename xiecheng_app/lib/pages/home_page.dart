
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xiecheng_app/dao/home_dao.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xiecheng_app/model/common_model.dart';
import 'package:xiecheng_app/model/grid_nav_model.dart';
import 'package:xiecheng_app/model/home_model.dart';
import 'package:xiecheng_app/model/sales_box_model.dart';
import 'package:xiecheng_app/widget/grid_nav.dart';
import 'package:xiecheng_app/widget/loading_container.dart';
import 'package:xiecheng_app/widget/local_nav.dart';
import 'package:xiecheng_app/widget/sales_box.dart';
import 'package:xiecheng_app/widget/sub_nav.dart';
import 'package:xiecheng_app/widget/webview.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {
  //滚动图的数据源

  double appBarAlpha = 0;
  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  GridNavModel gridNavModel;
  List<CommonModel> subNavModel = [];
  SalesBoxModel salesBoxModel;
  bool _isLoading = true;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleRefresh();
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
        gridNavModel = model.gridNav;
        subNavModel = model.subNavList;
        salesBoxModel = model.salesBox;
        bannerList = model.bannerList;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });

    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
          child: Stack(
            children: <Widget>[
              MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: NotificationListener(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                          _onScroll(scrollNotification.metrics.pixels);
                        }
                        return true;
                      },
                      child: RefreshIndicator(
                        child: _listView(),
                        onRefresh: _handleRefresh,
                      )
                  ),
              ),
              _appBar(),
            ],
          ),
          isLoading: _isLoading
      )
    );
  }

  _listView() {
    return ListView(
      children: <Widget>[
        _bannerView(),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
          child: LocalNav(localNavList: localNavList,),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: GridNav(gridNavModel: gridNavModel),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SubNav(subNavList: subNavModel),
        ),
        Padding(

          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SalesBox(salesBox: salesBoxModel),
        ),
      ],
    );
  }

  _appBar() {
    return Opacity(
      opacity: appBarAlpha,
      child: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('首页'),
          ),
        ),
      ),
    );
  }

  _bannerView() {
    return Container(
      height: 150,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Image.network(
              bannerList[index].icon,
              fit: BoxFit.fill,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WebView(
                  url: bannerList[index].url,
                  title: 'Banner',
                );
              }));
            },
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }
}