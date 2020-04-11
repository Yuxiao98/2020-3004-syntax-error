import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_fields_rental/Model/User.dart';
import '../Screens/Team_confirmation.dart';
import '../Screens/CreateATeam.dart';
import 'package:sports_fields_rental/Services/database.dart';
import 'package:sports_fields_rental/Field.dart';

class TimeSlots extends StatelessWidget {
  Field field;
  User currentUser;
  TimeSlots({this.field, this.currentUser});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text('Available Times:'),
      ),
      body: new SlotContainer(field: field, currentUser: currentUser),
    );
  }
}

class SlotContainer extends StatefulWidget {
  Field field;
  User currentUser;
  SlotContainer({this.field, this.currentUser});
  @override
  _SlotContainerState createState() => new _SlotContainerState();
}
class _SlotContainerState extends State<SlotContainer> {
@override
  Widget build(BuildContext context) {
    return new StreamBuilder(
        stream: Firestore.instance.collection('time').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return  SpinKitCubeGrid(
              color: Colors.white,
              size: 80.0,
            );
          }

            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: snapshot.data.documents.length,
              itemBuilder: /*1*/ (context, i) {

                return _buildRow(snapshot.data.documents.elementAt(i), context,i);
              }
          );
        }
    );
  }

    Widget _buildRow(var item, BuildContext context, var index){
      var color = Colors.green;
      if(item.data['colour']== 'yellow'){
        color  = Colors.yellow;
      }else if(item.data['colour']== 'grey'){
        color  = Colors.grey;
      }

        return  new RaisedButton(key:null, onPressed:()=> joinButtonPressed(index, item.data['colour'],item.data['timeSlots']),
                 color: color,
                 shape: new RoundedRectangleBorder(
                     borderRadius: new BorderRadius.circular(40.0)),
                 elevation: 7.0,
                 child:
                 new Text(
                   item.data['timeSlots'],
                   style: new TextStyle(fontSize:15.0,
                       color: const Color(0xFF000000),
                       fontWeight: FontWeight.w200,
                       fontFamily: "Roboto"),
                 )
             );
    }

  void joinButtonPressed (var index, String currentColor, String timeSlots) async{
    if(currentColor == "green"){
      await DatabaseService().changeTimeSLotColor(index.toString(), "yellow",timeSlots);
    }
    bool newItem = false;
    if(currentColor == 'green'){
      newItem = true;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Team_confirmation(field: widget.field, timeSlot: timeSlots, isNew: newItem, currentUser: widget.currentUser)),
    );

  }

  void buttonPressed(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateATeam()),
    );
  }

}