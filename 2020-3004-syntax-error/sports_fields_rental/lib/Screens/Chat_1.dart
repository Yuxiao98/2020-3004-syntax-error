import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Model/User.dart';
import 'package:sports_fields_rental/Screens/Chat_Page.dart';
import 'package:sports_fields_rental/Services/database.dart';
// https://stackoverflow.com/questions/43947552/using-textfield-throws-no-material-widget-found-error

class Chat extends StatefulWidget{
  User currentUser;
  Chat({this.currentUser});
  @override
  State createState() => new ChatState();

}

class ChatState extends State<Chat>{

  final TextEditingController _textEditingController = new TextEditingController();

  final List<ChatPage> _message = <ChatPage> [];
  String userName = 'unknown';

  void _handleSubmitted(String text){
    _textEditingController.clear();

    ChatPage message = new ChatPage(
      text: text, userName: userName
    );
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _textWidget(){
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              decoration: new InputDecoration.collapsed(hintText: 'Send Message'),
              controller: _textEditingController,
              onSubmitted: _handleSubmitted,
            ),
          ),
          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textEditingController.text)
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    DatabaseService(uid:widget.currentUser.uid).getUserInfoItem().then((val) {
      setState(() {
        userName = val['firstName'] + " " + val['lastName'];
      });
    });
   return new Column(
     children: <Widget>[
       new Flexible(
         child: new ListView.builder(
           padding: new EdgeInsets.all(8.0),
           reverse: true,
           itemBuilder: (
               _,
               int index) => _message[index],
           itemCount: _message.length,
         ),
       ),
       new Divider(height: 1.0),
       new Container(
         decoration: new BoxDecoration(
           color: Theme.of(context).cardColor,
         ),
         child: _textWidget(),
       )
     ],
   );
  }
}

