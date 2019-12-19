

import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TravelPageState();
  }
}

class _TravelPageState extends State<TravelPage> {

  final cities = {'北京': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区'],
                  '上海': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区'],
                  '广州': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区'],
                  '深圳': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区'],
                  '杭州': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区'],
                  '苏州': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区'],};

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('城市列表'),
        ),
        body: Center(

          child: ListView(
            children:_buildListCell()
          ),
        )
    );
  }

  //
  List<Widget> _buildListCell() {
    List<Widget> widgets = [];
    cities.keys.forEach((key) {
      widgets.add(_item(key, cities[key]));
    });
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(
        city,
        style: TextStyle(color: Colors.black54, fontSize: 20),
      ),
      children: subCities.map((subCity) => _buildSub(subCity)).toList(),
    );
  }

  Widget _buildSub(String subCity) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child: Text(subCity),
      ),
    );
  }
}