import 'package:flutter/material.dart';
import 'package:sports_fields_rental/FieldType.dart';
import 'package:sports_fields_rental/Model/User.dart';
import 'Chat_Home.dart';
import 'package:sports_fields_rental/Field.dart';

class Team_confirmation extends StatelessWidget {
  Field field;
  String timeSlot;
  bool isNew;
  User currentUser;
  Team_confirmation({this.field, this.timeSlot, this.isNew, this.currentUser});
  get team_name => 'A New Team';

  get start_time => this.timeSlot;

  get phone_number => this.field.information.telephoneNumber;

  get team_capacity => 10;

  get sports_type => getSportsType(field.type);


  getSportsType(FieldType type){
    switch(type){
      case FieldType.baseball:
        return 'Basket Ball';
      case FieldType.soccer:
        return 'Soccer';
      case FieldType.football:
        return 'Football';
      case FieldType.baseball:
        return 'Base Ball';
      case FieldType.tennis:
        return 'Tennis';
      case FieldType.hockey:
        return 'Hockey';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    field.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  field.information.address,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          JoinWidget(isNew: isNew),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );




    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
            'Team Name: ''$team_name\n'
            'Sports Type: ''$sports_type\n'
            'Time: ''$start_time\n'
            'Team Capacity: ''$team_capacity\n'
            'Contact Number: ''$phone_number',

        softWrap: true,
      ),
    );

    void onclickButton(context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatHome(currentUser: currentUser)),
      );

    }



    Widget chatSection = Container(
          padding: EdgeInsets.only(left: 120, right: 50, bottom: 32),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Flexible(
                child: new RaisedButton(
                  onPressed: () => onclickButton(context),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0)),
                  elevation: 7.0,
                  child: Text(
                      'GROUP CHAT',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),
            ],
          ),
    );


    return MaterialApp(
      title: 'Please Confirm Your Team',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Team Confirmation'),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/' +field.imageUrl,
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            chatSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }


}

// #docregion FavoriteWidget
class JoinWidget extends StatefulWidget {
  bool isNew;
  JoinWidget({this.isNew});
  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}
// #enddocregion FavoriteWidget

// #docregion _FavoriteWidgetState, _FavoriteWidgetState-fields, _FavoriteWidgetState-build
class _JoinWidgetState extends State<JoinWidget> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isJoined = false;
  int _JoinedCount = 8;
  int _maxCount = 10;
  bool _teamFull = false;

  @override
  void initState() {
    super.initState();
    if(widget.isNew){
      _JoinedCount = 0;
    }
  }
  // #enddocregion _FavoriteWidgetState-fields
  // #docregion _toggleFavorite
  void _toggleJoin() {
    setState(() {
      if (_isJoined) {
        _JoinedCount -= 1;
        _isJoined = false;
      }
      else {
        _JoinedCount += 1;
        _isJoined = true;
          Widget continueButton = FlatButton(
            child: Text("OK"),
            onPressed:  () {
              Navigator.of(context, rootNavigator: true).pop();},
          );

          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Confirmation Alert"),
            content: Text("You are now in your selected team."),
            actions: [
              continueButton,
            ],
          );

          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        }


      if(_JoinedCount<_maxCount)
        _teamFull = true;
    });
  }
  // #enddocregion _toggleFavorite

  // #docregion _FavoriteWidgetState-build
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isJoined ? Icon(Icons.cancel) : Icon(Icons.group_add)),
            color: Colors.blue[800],
            onPressed: _toggleJoin,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_JoinedCount'),
          ),
        ),
      ],
    );
  }
// #docregion _FavoriteWidgetState-fields



}

