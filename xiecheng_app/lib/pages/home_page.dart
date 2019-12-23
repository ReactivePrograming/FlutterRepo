
import 'package:flutter/material.dart';
import 'package:xiecheng_app/dao/home_dao.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xiecheng_app/model/common_model.dart';
import 'package:xiecheng_app/model/grid_nav_model.dart';
import 'package:xiecheng_app/model/home_model.dart';
import 'package:xiecheng_app/widget/grid_nav.dart';
import 'package:xiecheng_app/widget/local_nav.dart';

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
  List _imageUrls = [
  'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
  'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
  'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];

  double appBarAlpha = 0;
  List<CommonModel> localNavList = [];
  GridNavModel gridNavModel;

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
    loadData();
  }

  loadData() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
        gridNavModel = model.gridNav;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
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
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 150,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),//广告位
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
                      child: LocalNav(localNavList: localNavList,),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                      child: GridNav(gridNavModel: gridNavModel),
                    ),

                    Container(
                      height: 800,
                      child: ListTile(
                        title: Text('哈哈'),
                      ),
                    )
                  ],
                ),
              )
          ),
          Opacity(
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
          )
        ],
      )
    );
  }
}