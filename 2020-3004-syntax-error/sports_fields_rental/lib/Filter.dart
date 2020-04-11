import 'package:flutter/material.dart';
import 'package:sports_fields_rental/FieldType.dart';
import 'package:sports_fields_rental/AvailableField.dart';
import 'package:sports_fields_rental/Services/auth.dart';
import 'package:sports_fields_rental/Screens/ProfileLoader.dart';
import 'package:sports_fields_rental/Model/User.dart';

class Filter extends StatefulWidget {
  final User currentUser;
  Filter({this.currentUser});
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter>{

  bool soccer = false;
  bool tennis = false;
  bool hockey = false;
  bool basketball = false;
  bool baseball = false;
  bool football = false;
  final AuthService authSvc = AuthService();
  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
  void _value1Changed(bool value) => setState(() => soccer = value);

  void _value2Changed(bool value) => setState(() => tennis = value);
  void _value3Changed(bool value) => setState(() => hockey = value);
  void _value4Changed(bool value) => setState(() => basketball = value);

  void _value5Changed(bool value) => setState(() => baseball = value);
  void _value6Changed(bool value) => setState(() => football = value);

  @override
  Widget build(BuildContext context) {
   print( widget.currentUser.uid);
    return new Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text('Choose your sports'),
        elevation:0.0,
        actions:<Widget>[
          FlatButton.icon(
            icon:Icon(Icons.face),
            color: Colors.white,
            label:Text("view profile"),
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: () async{
              Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) => ProfileLoader(currentUser: widget.currentUser)),
             );
            },

          ),

          FlatButton.icon(
            icon:Icon(Icons.person),
            color: Colors.white,
            label:Text("log out"),
            onPressed: () async{
              await authSvc.signOut();
            },
            
          )
        ]
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new ListView(
          padding: new EdgeInsets.all(32.0),
          children:<Widget>[
            new Column(
              children: <Widget>[
                new CheckboxListTile(
                  value: soccer,
                  onChanged: _value1Changed,
                  title: new Text('Soccer'),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.orange,
                ),
              ],
            ),
            new Column(
              children: <Widget>[
                new CheckboxListTile(
                  value: tennis,
                  onChanged: _value2Changed,
                  title: new Text('tennis'),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.orange,
                ),
                new Column(
                  children: <Widget>[
                    new CheckboxListTile(
                      value: hockey,
                      onChanged: _value3Changed,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: new Text('hockey'),
                      activeColor: Colors.orange,
                    ),
                    new CheckboxListTile(
                      value: basketball,
                      onChanged: _value4Changed,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: new Text('basketball'),
                      activeColor: Colors.orange,
                    ),
                    new CheckboxListTile(
                      value: baseball,
                      onChanged: _value5Changed,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: new Text('baseball'),
                      activeColor: Colors.orange,
                    ),
                    new CheckboxListTile(
                      value: football,
                      onChanged: _value6Changed,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: new Text('football'),
                      activeColor: Colors.orange,
                    ),
                    new RaisedButton(
                      onPressed: () => onclickButton(),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                      elevation: 7.0,
                      child: Text(
                          'Confirm',
                          style: TextStyle(fontSize: 20)
                      ),
                    ),
                  ],
                ),

              ],

            ),


          ]
      ),
    );
  }

  void onclickButton(){
    List<FieldType> list = new List<FieldType>();
    if(soccer){
      list.add(FieldType.soccer);
    }
    if(tennis){
      list.add(FieldType.tennis);
    }
    if(hockey){
      list.add(FieldType.hockey);
    }
    if(basketball){
      list.add(FieldType.basketball);
    }
    if(baseball){
      list.add(FieldType.baseball);
    }
    if(football){
      list.add(FieldType.football);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AvailableField(selectedList: list,currentUser: widget.currentUser)),
    );

  }
}
