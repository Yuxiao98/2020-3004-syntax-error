import 'package:flutter/material.dart';
import 'package:sports_fields_rental/FieldType.dart';
import 'package:sports_fields_rental/ItemList.dart';
import 'package:sports_fields_rental/Model/User.dart';

class AvailableField extends StatelessWidget {
  List<FieldType> selectedList;
  User currentUser;
  AvailableField({this.selectedList, this.currentUser});

  @override

  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text("Available fields"),
        backgroundColor: Colors.black,
      ),
      body: ItemList(this.selectedList,this.currentUser)
    );
  }
}
