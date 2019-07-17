// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:pinkman_app/screens/splash.dart';
import 'package:pinkman_app/screens/home.dart';
import 'package:pinkman_app/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  final routes = <String, WidgetBuilder>{
    // Путь, по которому создаётся Home Screen
    '/Home': (BuildContext context) => HomeScreen(),
    '/Login': (BuildContext context) => LoginScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: SplashScreen(nextRoute: '/Login'),
      routes: routes,
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.lightBlue[800],
        accentColor: Color.fromRGBO(237, 28, 128, 1)
      ),
    );
  }
}