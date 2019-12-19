
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  List _imageUrls = [
    'https://goss.cfp.cn/creative/vcg/nowarter800/new/VCG211163148161.jpg',
    'https://goss.cfp.cn/creative/vcg/nowarter800/version2/108270476.jpg',
    'https://goss3.cfp.cn/creative/vcg/nowarter800/new/VCG211131544392.jpg'
  ];

  //修改appbar透明度
  double _appBarAlpha = 0;

  _onScroll(offset) {
    print(offset);
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      _appBarAlpha = alpha;    
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MediaQuery.removePadding(
        context: context,
          removeTop: true,
          child: NotificationListener(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                //滚动且是列表的时候//并且是第0个元素
                _onScroll(scrollNotification.metrics.pixels);
              }
              return true;
            },
            child: ListView(
              children: <Widget>[
                Container(
                  height: 160,
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
                ),
                Container(
                  height: 1000,
                  child: ListTile(
                      title: Text('haha')
                  ),
                )
              ],
            ),
          ),
        ),
        Opacity(
          opacity: _appBarAlpha,
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
    );

  }
}