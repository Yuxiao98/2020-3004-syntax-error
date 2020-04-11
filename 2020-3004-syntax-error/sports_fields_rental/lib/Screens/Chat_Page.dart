import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Model/User.dart';


class ChatPage extends StatelessWidget {

  final String text;
  final String userName;
  ChatPage({this.text, this.userName});

  @override
  Widget build(BuildContext context){

    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: new Text(userName),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(userName, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}