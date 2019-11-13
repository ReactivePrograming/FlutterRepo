
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock/home/StockMart.dart';
import 'package:flutter_stock/home/StockPortfolio.dart';

class StockHome extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StockHomeState();
  }
}

class StockHomeState extends State<StockHome> {
  
  //定义appbar
  
  Widget _buildAppBar(BuildContext context) {
    
    return AppBar(
      title: Text('股市大灾'),
      bottom: TabBar(
        tabs: <Widget>[
          Tab(
            text: 'Mart',
          ),
          Tab(
            text: 'Portfolio',
          )
        ],
      ),
    );
  }

  //定义个drawer
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(context),
        appBar: _buildAppBar(context),
        body: TabBarView(
          dragStartBehavior: DragStartBehavior.start,
          children: <Widget>[
            StockMart(),
            StockPortfolio()
          ],
        ),
      ),
    );
  }
}