import 'package:flutter/material.dart';
import 'package:pinkman_app/screens/profile.dart';
import 'package:pinkman_app/screens/splash.dart';
import 'package:pinkman_app/screens/home.dart';
import 'package:pinkman_app/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  final routes = <String, WidgetBuilder>{
    // Путь, по которому создаётся Home Screen
    '/Home': (BuildContext context) => HomeScreen(),
    '/Login': (BuildContext context) => LoginScreen(),
    '/Profile': (BuildContext context) => ProfileScreen(),
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