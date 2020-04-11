import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math' show Random;

class CreateATeam extends StatelessWidget {
  //get team_name => 'A New Team';

  get start_time => '15:00';

  get end_time => '19:00';

  get phone_number => '337345818';

  get team_capacity => 10;

  get sports_type => 'Basket Ball';

  final myController = TextEditingController();

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
                    'Carleton University',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Ottawa, Ontario, Canada',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          //CreateWidget(),
        ],
      ),
    );

    Color color = Theme
        .of(context)
        .primaryColor;

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

    final _text = TextEditingController();
    _text.text = WordPair
        .random()
        .asString;
    bool _validate = false;


    Widget textFieldSection = Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 15),
              child: TextField(
                controller: _text,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Your Team Name',
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                ),

              ),),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 15),
              child: RaisedButton(
                  onPressed: () {},
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0)),
                  elevation: 7.0,
                  child: Text('Submit'),
              ),
            )

          ],)

    );

    Widget textSection = Container(
      padding: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 15, bottom: 20),
      child: Text(
        'Sports Type: ''$sports_type\n'
            'Start Time: ''$start_time\n'
            'End Time: ''$end_time\n'
            'Team Capacity: ''$team_capacity\n'
            'Contact Number: ''$phone_number',

        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Create Your Team',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Your Team'),
            backgroundColor: Colors.black
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textFieldSection,
            textSection,
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