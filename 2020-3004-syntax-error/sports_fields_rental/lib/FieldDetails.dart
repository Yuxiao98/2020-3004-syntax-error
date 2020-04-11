import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Field.dart';
import 'package:sports_fields_rental/timetable/Timetable.dart';
import 'package:sports_fields_rental/Screens/Calendar.dart';
import 'package:sports_fields_rental/Model/User.dart';

class FieldDetails extends StatelessWidget {
  Field field;
  User currentUser;
  FieldDetails(Field field, User user) {
    this.field = field;
    this.currentUser = user;
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Field detail:"),
      ),
     body: fieldsDetails(field, context)

    );
  }

  Widget fieldsDetails(Field field, BuildContext context) {
    var assetsImage = new AssetImage(
      'assets/images/' + field.imageUrl
    );
    var image = new Image(image:assetsImage, fit: BoxFit.contain);
//    return image;

    return ListView(
        children: [
       image,
          new Text('Address:  ' + field.information.address, style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),),
          new Text('Phone Number:  ' + field.information.telephoneNumber, style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          )),
          new Row(
          children:[ Text('Time Slots: ', style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          )),

            RaisedButton(
              onPressed: () => onclickButton(context),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              elevation: 7.0,
              child:  Text('Check', style: TextStyle(fontSize: 20)),

          ),
          //new Text('Capacity:' + field.information.capacity)
          ],
          )
    ]);
  }
  void onclickButton(context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Calendar(field:field,currentUser: currentUser)),
    );
  }
}
