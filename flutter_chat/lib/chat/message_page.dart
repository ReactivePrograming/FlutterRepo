
import 'package:flutter/material.dart';
import 'package:flutter_chat/chat/message_data.dart';
import 'package:flutter_chat/chat/message_item.dart';

class Message extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessageState();
  }

}

class _MessageState extends State<Message> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: ListView.builder(
        itemCount: messageData.length,
        itemBuilder: (BuildContext context, int index) {
          return new MessageItem(messageData[index]);
        },
      ),
    );
  }
}