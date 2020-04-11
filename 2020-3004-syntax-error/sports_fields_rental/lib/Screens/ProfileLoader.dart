import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Screens/ProfilePage.dart';
import 'package:sports_fields_rental/Services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_fields_rental/Model/User.dart';
import 'package:provider/provider.dart';

class ProfileLoader extends StatefulWidget{
  User currentUser;
  ProfileLoader({this.currentUser});
  @override
  State createState() => new ProfileLoaderState();

}

class ProfileLoaderState extends State<ProfileLoader>{


  @override
  Widget build(BuildContext context){
   return  StreamProvider<QuerySnapshot>.value(
      value:DatabaseService(uid:widget.currentUser.uid).users,
      child:ProfilePage(currentUser: widget.currentUser)
    );
  }
}