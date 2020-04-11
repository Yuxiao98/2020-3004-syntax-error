import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Screens/Authenticate/Login.dart';
import 'package:sports_fields_rental/Screens/Authenticate/SignUp.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleSignIn(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return Login(toggleView : toggleSignIn);
    }else{
      return SignUp(toggleView : toggleSignIn);
    }
  }
}
