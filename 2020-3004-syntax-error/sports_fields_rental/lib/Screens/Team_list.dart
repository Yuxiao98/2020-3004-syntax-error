// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'Team_member.dart';

class Team_list extends StatefulWidget {
  @override
  _TeamlistState createState() => _TeamlistState();
}

// #docregion MyApp
class _TeamlistState extends State<StatefulWidget> {
  final List<String> entries = <String>['Start Platinum', 'Crazy Diamond', 'Gold Experience', 'Heaven\'s Door', 'Hierophant Green', 'Sex Pistols'];
  final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text('Manage My Teams'),
      ),
      body: new ListView.builder(
          /*padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('${entries[index]}')),
            );
          }*/
          itemCount: entries == null ? 0 : entries.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector( //You need to make my child interactive
              onTap: () => {
                Navigator.push(
                context, MaterialPageRoute(builder: (context) => Team_member()),)
              },
              child: new Card( //I am the clickable child
                child: new Container(
                  height: 50,
                  color: Colors.amber[colorCodes[index]],
                  child: Center(child: Text('${entries[index]}')),
                ),),
            );
          }

      ),
    );
  }// #enddocregion build
}
