import 'package:flutter/material.dart';

import 'package:sports_fields_rental/Screens/Wrapper.dart';
import 'package:provider/provider.dart';
import 'package:sports_fields_rental/Model/User.dart';
import 'package:sports_fields_rental/Services/auth.dart';




main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
   @override
   Widget build(BuildContext context){

     return StreamProvider<User>.value(
       value: AuthService().user,
       child: MaterialApp(
         home: Wrapper()
       )
     );
   }

}



