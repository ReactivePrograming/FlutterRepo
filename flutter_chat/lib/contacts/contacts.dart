

import 'package:flutter/material.dart';
import 'package:flutter_chat/contacts/contact_sider.dart';

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
        items: conta,
      ),
    );
  }
}