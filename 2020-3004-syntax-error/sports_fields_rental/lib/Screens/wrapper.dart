import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Screens/Authenticate/Authenticate.dart';
import 'package:provider/provider.dart';
import 'package:sports_fields_rental/Model/User.dart';
import 'package:sports_fields_rental/Filter.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null){
      return Authenticate();
    }else{
      print("****** this is user" + user.uid);

      //THis is the project Home
      return Filter(currentUser:user);
    }
    //return either home or authenticate widget
  }
}


