import 'dart:core';
import 'dart:async';
import 'dart:convert' show json;
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:pinkman_app/components/top_bar.dart';
import 'package:pinkman_app/config/constants.dart';
import 'package:pinkman_app/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  final String nextRoute;
  HomeScreen({ this.nextRoute });
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  // final List<Widget> _children = [];
  List<dynamic> _users = [];

  @override
  void initState() {
    super.initState();

    // get users
    _requestUsers();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _requestUsers() async {

    final http.Response response = await http.get('${baseURL}users', headers: {
      'auth-token': authToken
    });

    // (response.statusCode != 200)
    // 
    final List<dynamic> users = json.decode(response.body);

    // final List<dyna> generatedNames = [];
    // for (var i = 0; i < users.length; i++) {
    //   generatedNames.add(users[i]);
    // }

    // print(users[0]['avatar_url']);
    // print(users[0]['settings']['telegram_user_name']);

    setState(() {
      _users = users;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('App'),
      // ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.only(top: 120),
            itemCount: _users.length,
            itemBuilder: (BuildContext ctx, int index) {
              return InkWell(
                splashColor: Colors.pink.withAlpha(30),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                    settings: RouteSettings(
                      arguments: ProfileScreenArguments(_users[index])
                    )
                  ));
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // padding: new EdgeInsets.all(16.0),
                    children: <Widget>[
                      // Image.network(, width: 40, height: 40),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(_users[index]['avatar_url'])
                          )
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text(_users[index]['display_name'])
                      )
                    ]
                  )
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopBar(
              title: 'App'
            )
          )
        ]
      ),
      // body: Center(
      //   child: ListView.builder(
      //     itemCount: _users.length,
      //     itemBuilder: (BuildContext ctx, int index) {
      //       return InkWell(
      //         splashColor: Colors.pink.withAlpha(30),
      //         onTap: () {
      //           print('Card tapped.');
      //         },
      //         child: Container(
      //           padding: EdgeInsets.all(10.0),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             // padding: new EdgeInsets.all(16.0),
      //             children: <Widget>[
      //               // Image.network(, width: 40, height: 40),
      //               Container(
      //                 width: 40.0,
      //                 height: 40.0,
      //                 decoration: new BoxDecoration(
      //                   shape: BoxShape.circle,
      //                   image: new DecorationImage(
      //                       fit: BoxFit.fill,
      //                       image: new NetworkImage(_users[index]['avatar_url'])
      //                   )
      //                 )
      //               ),
      //               Container(
      //                 margin: EdgeInsets.only(left: 10.0),
      //                 child: Text(_users[index]['display_name'])
      //               )
      //             ]
      //           )
      //         ),
      //       );
      //     },
      //   )
      // ),
      bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped,
       currentIndex: _currentIndex,
       backgroundColor: Color.fromRGBO(30, 30, 30, 1),
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
