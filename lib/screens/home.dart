import 'dart:core';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String nextRoute;
  HomeScreen({this.nextRoute});
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Home")
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Home')
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.mail),
           title: new Text('Messages')
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         )
       ],
     )
    );
  }
}
