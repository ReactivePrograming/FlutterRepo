
import 'package:flutter/material.dart';
import 'package:xiecheng_app/dao/search_dao.dart';
import 'package:xiecheng_app/model/search_model.dart';
import 'package:xiecheng_app/widget/search_bar.dart';
import 'package:xiecheng_app/widget/webview.dart';

class SearchPage extends StatefulWidget {

  final bool hideLeft;
  final String searchUrl;
  final String keyword;
  final String hint;


  SearchPage({Key key,this.hideLeft, this.searchUrl = SEARCH_URL, this.keyword, this.hint}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin {

  @protected
  @override
  bool get wantKeepAlive => true;

  SearchModel _searchModel;
  String _keyword;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(),
          MediaQuery.removePadding(
            removeTop: true,
              context: context,
              child: Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: _searchModel?.data?.length ?? 0,
                itemBuilder: (BuildContext context, int position) {
                  return _item(position);
                },
              ),
            )
          )
        ],
      )
    );
  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x66000000), Colors.transparent], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: Container(
            padding: EdgeInsets.only(top: 22),
            height: 88,
            decoration: BoxDecoration(color: Colors.white),
            child: SearchBar(
              hideLeft: widget.hideLeft,
              defaultText: widget.keyword,
              hint: widget.hint,
              onChanged: _onTextChanged,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              rightButtonClick: _rightButtonClick,
            ),
          ),
        )

      ],
    );
  }

  //
  _onTextChanged(String text) {
    _keyword = text;
    if (text.length == 0) {
      setState(() {
        _searchModel = null;
      });
      return;
    }
    String url = widget.searchUrl + _keyword;
    SearchDao.fetch(url, text).then((SearchModel model) {
      if (model.keyword == _keyword) {
        setState(() {
          _searchModel = model;
        });
      }
    }).catchError((error){
      print(error);
    });
  }

  _rightButtonClick() {

  }

  _item(int position) {
    if (_searchModel == null || _searchModel.data == null) return null;
    SearchItem item = _searchModel.data[position];
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebView(url: item.url, title: item.word,);
        }));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, top: 5, right: 10),
              child: Image.network(
                'https://www.devio.org/io/flutter_app/img/ln_ticket.png',
                height: 32,
                width: 32,
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 300,
                  child: Text(
                    '${item.word} ${item.districtname??''} ${item.zonename??''}'
                  ),
                ),
                Container(
                  width: 300,
                  child: Text(
                      '${item.price??''} ${item.type??''}'
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}