
import 'package:flutter/material.dart';

//定义一个触摸回调组件

class TouchCallBack extends StatefulWidget {

  /*
  定义变量
   */
  //子组件
  final Widget child;
  //回调函数
  final VoidCallback onPressed;
  //
  final bool isfeed;
  //北京颜色
  final Color background;

  //初始化函数
  TouchCallBack({Key key, @required this.child, @required this.onPressed, this.isfeed: true, this.background: const Color(0xffd8d8d8) }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TouchState();
  }
}

class TouchState extends State<TouchCallBack> {

  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //返回GestureDetector对象
    return GestureDetector(
      //使用Container容器包裹
      child: Container(
        color: color,
        child: widget.child,
      ),
      //on tap 回调
      onTap: widget.onPressed,
      onPanDown: (d) {
        if (widget.isfeed) {
          return;
        }
        setState(() {
          color = widget.background;
        });
      },
      onPanCancel: () {
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}