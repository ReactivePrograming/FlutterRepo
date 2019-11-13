
import 'package:flutter/material.dart';

class StockMart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StockMartState();
  }
}

class StockMartState extends State<StockMart> {

  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: const Alignment(0.0, 0.0),
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage('https://n.sinaimg.cn/translate/200/w1080h720/20181206/2adQ-hprknvt3854743.jpg'),

        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.green
          ),
          child: Text("d"),
        ),
        GestureDetector(
          child: TextField(
            decoration: InputDecoration(
              hintText: "place"
            ),
          ),
        ),
      ],

    );

  }
}