import 'dart:async';
import 'dart:convert';
import 'package:xiecheng_app/model/search_model.dart';
import 'package:http/http.dart' as http;
import 'package:xiecheng_app/model/search_model.dart' as prefix0;

const SEARCH_URL = 'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';

class SearchDao {

  static Future<SearchModel> fetch(String url, String text) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      //本地优化keyword
      SearchModel model = SearchModel.fromJson(result);
      model.keyword = text;
      return model;
    } else {
      throw Exception('faild to load data');
    }
  }
}
