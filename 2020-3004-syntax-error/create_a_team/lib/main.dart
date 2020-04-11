// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// https://github.com/flutter-devs/flutter_profileview_demo

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:create_a_team/Constant/Constant.dart';
import 'package:create_a_team/Screens/SplashScreen.dart';
import 'package:create_a_team/Screens/ProfilePage.dart';
import 'package:create_a_team/Screens/Team_confirmation.dart';

main() {
  runApp(new MaterialApp(
    title: 'Fluter Profile Page',
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        primaryColor: Color(0xff0082CD),

        primaryColorDark: Color(0xff0082CD)),
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      //SPLASH_SCREEN: (BuildContext context) => new MapScreen(),
      PROFILE: (BuildContext context) => new ProfilePage(),
      TEAM_CONFIRMATION: (BuildContext context) => new Team_confirmation(),
    },
  ));
}
