import 'dart:core';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String nextRoute;
  HomeScreen({this.nextRoute});
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
            Text(_currentIndex.toString())
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped,
       currentIndex: _currentIndex,
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.people),
           title: new Text('Users')
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.show_chart),
           title: new Text('Rating')
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.settings),
           title: Text('Settings')
         )
       ],
     )
    );
  }
}
