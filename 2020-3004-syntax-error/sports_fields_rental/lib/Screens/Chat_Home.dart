import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Model/User.dart';
import 'package:sports_fields_rental/Screens/Chat_1.dart';

class ChatHome extends StatelessWidget{
  @override
  User currentUser;
  ChatHome({this.currentUser});

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GROUP CHAT"),
        backgroundColor: Colors.black,
      ),
      body: new Chat(currentUser: currentUser));
  }
}