
import 'package:xiecheng_app/model/common_model.dart';
import 'package:xiecheng_app/model/config_model.dart';
import 'package:xiecheng_app/model/grid_nav_model.dart';
import 'package:xiecheng_app/model/sales_box_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;

  HomeModel({this.config, this.bannerList, this.localNavList, this.subNavList, this.gridNav, this.salesBox});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var localNaviListJson = json['localNavList'] as List;
    List<CommonModel> localNaviList = localNaviListJson.map((i) => CommonModel.fromJson(i)).toList();

    return HomeModel();
  }

}