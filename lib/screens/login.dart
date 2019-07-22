import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginScreen extends StatefulWidget {
  final String nextRoute;
  LoginScreen({ this.nextRoute });
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        title: Text('App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Text('Auth', style: TextStyle(fontSize: 20))
                ),
                Text('Sign in to get more stuff')
              ]
            ),
            GoogleSignInButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/Home');
              }, 
              darkMode: true, // default: false
              borderRadius: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
