import 'package:flutter/material.dart';

class Team_confirmation extends StatelessWidget {
  get team_name => 'A New Team';

  get start_time => '15:00';

  get end_time => '19:00';

  get phone_number => '337345818';

  get team_capacity => 10;

  get sports_type => 'Basket Ball';

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
          JoinWidget(),
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
            'Start Time: ''$start_time\n'
            'End Time: ''$end_time\n'
            'Team Capacity: ''$team_capacity\n'
            'Contact Number: ''$phone_number',

        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Please Confirm Your Team',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Team Confirmation'),
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

// #docregion FavoriteWidget
class JoinWidget extends StatefulWidget {
  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}
// #enddocregion FavoriteWidget

// #docregion _FavoriteWidgetState, _FavoriteWidgetState-fields, _FavoriteWidgetState-build
class _JoinWidgetState extends State<JoinWidget> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isJoined = true;
  int _JoinedCount = 8;
  int _maxCount = 10;
  bool _teamFull = false;
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