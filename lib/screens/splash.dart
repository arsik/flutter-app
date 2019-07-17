import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final String nextRoute;
  SplashScreen({this.nextRoute});
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 0),
      () { Navigator.of(context).pushReplacementNamed(widget.nextRoute); }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/splash.png', width: 800, fit: BoxFit.cover),
            Container(child: Text('You know what to do with your team'), margin: EdgeInsets.only(top: 40.0))
          ],
        ),
      ),
    );
  }
}
