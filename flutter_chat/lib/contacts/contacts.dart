

import 'package:flutter/material.dart';
import 'package:flutter_chat/contacts/contact_header.dart';
import 'package:flutter_chat/contacts/contact_item.dart';
import 'package:flutter_chat/contacts/contact_sider.dart';
import 'package:flutter_chat/contacts/contact_vo.dart';

class Contacts extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContactsState();
  }

}

class _ContactsState extends State<Contacts> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: ContactSiderList(
        items: contactData,
        headerBuilder: (BuildContext context, int index){
          return Container(
            child: ContactHeader(),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: ContactItem(item: contactData[index],),
          );
        },
        sectionBuilder: (BuildContext context, int index) {
          return Container(
            height: 32,
            padding: const EdgeInsets.only(left: 14),
            color: Colors.grey[300],
            alignment: Alignment.centerLeft,
            child: Text(
              contactData[index].seationKey,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff909090),
              ),
            ),
          );
        },
      ),
    );
  }
}