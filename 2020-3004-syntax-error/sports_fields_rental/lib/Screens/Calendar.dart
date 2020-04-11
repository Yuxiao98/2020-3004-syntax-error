import 'package:flutter/material.dart';
import 'package:sports_fields_rental/Model/User.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:sports_fields_rental/Field.dart';
import 'package:sports_fields_rental/timetable/TimeSlots.dart';

class Calendar extends StatefulWidget {
  Field field;
  User currentUser;
  Calendar({this.field, this.currentUser});
  getField(){
    return field;
  }
  @override
  _CalendarState createState() => _CalendarState();
}

// #docregion MyApp
class _CalendarState extends State<Calendar> {


  CalendarController _calendarController = CalendarController();
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text('Calendar'),
      ),
      body: new Column(
        children: <Widget>[
          new TableCalendar(
            calendarController: _calendarController,
          ),
          new RaisedButton(
            onPressed: () => {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimeSlots(field:widget.field, currentUser: widget.currentUser)),
            )},
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            child: new Text(
              "See Time Periods",
              //style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

}