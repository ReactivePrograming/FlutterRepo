
class ConfigModel {

  final String searchUrl;

  //定义构造方法
  ConfigModel({this.searchUrl});

  //创建一个工厂方法
  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      searchUrl: json['searchUrl']
    );
  }
}