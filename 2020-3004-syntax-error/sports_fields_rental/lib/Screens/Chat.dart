import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Screens/Team_confirmation.dart';
// https://stackoverflow.com/questions/43947552/using-textfield-throws-no-material-widget-found-error

class Chat extends StatefulWidget{
  @override
  State createState() => new ChatState();

}

class ChatState extends State<Chat>{

  final TextEditingController _textEditingController = new TextEditingController();

  /*Widget _textWidget(){
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextField(
        decoration: new InputDecoration.collapsed(hintText: 'Send Message'),
        controller: _textEditingController,
      ),
    );
  }*/

  @override
  Widget build(BuildContext context){
    //return _textWidget();
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            controller: _textEditingController,
            decoration: new InputDecoration.collapsed(hintText: 'Send Message'),
          ),
          new RaisedButton(
            onPressed: () {},
            child: new Text('SEND'),
          ),
        ],
      ),
    );
  }
}