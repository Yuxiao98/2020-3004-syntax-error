// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Chat_Home.dart';
import 'dart:math';

class Team_member extends StatefulWidget {
  @override
  _TeammemberState createState() => _TeammemberState();
}

// #docregion MyApp
class _TeammemberState extends State<StatefulWidget> {
  static List<String> allMembers = <String>['Joseph', 'Jonathan','Jotaro','Josuke','Giorno','Dio','Cesar','Kakyoin','Rohan','Mista'];

  static List shuffle(List items) {
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {

      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  final selectedMembers = shuffle(allMembers).sublist(0,5);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: new Text('Team Memebers'),
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
          itemCount: selectedMembers == null ? 0 : selectedMembers.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector( //You need to make my child interactive
              onTap: () => {

                /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatHome()),)*/
              },
              child: new Card( //I am the clickable child
                child: new Container(
                  height: 50,
                  child: Center(child: Text('${allMembers[index]}')),
                ),),
            );
          }

      ),
    );
  }// #enddocregion build
}
