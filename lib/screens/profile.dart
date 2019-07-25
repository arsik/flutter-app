import 'dart:core';
import 'dart:async';
import 'dart:convert' show json;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:pinkman_app/components/profile_header.dart';
import 'package:pinkman_app/config/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class ProfileScreenArguments {
  final dynamic user;
  ProfileScreenArguments(this.user);
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<dynamic> _projects = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _requestProjects();
  }


  Future<void> _requestProjects() async {
    final http.Response response = await http.get('${baseURL}projects', headers: {
      'auth-token': authToken
    });
    List<dynamic> projects = json.decode(response.body);
    List<dynamic> favoriteProjects = [];

    for (var i = 0; i < projects.length; i++) {
      if (projects[i]['is_favorite']) {
        favoriteProjects.add(projects[i]);
      }
    }
    print(favoriteProjects);

    isLoading = false;

    setState(() {
      _projects = favoriteProjects;
    });
  }


  @override
  Widget build(BuildContext context) {

    final ProfileScreenArguments args = ModalRoute.of(context).settings.arguments;
    // print(args.user['settings']);

    final String tAcc = args.user['settings']['telegram_user_name'];

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // Image.asset('images/splash.png', width: 800, height: 300, fit: BoxFit.cover),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            color: Color.fromRGBO(30, 30, 30, 1),
          ),
          Container(margin: EdgeInsets.only(top: 240), child: ProfileHeader()),
          Container(
            margin: EdgeInsets.only(top: 210, left: 30),
            width: 100.0,
            height: 100.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(style: BorderStyle.solid, color: Colors.white, width: 3),
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(args.user['avatar_url'])
              )
            )
          ),
          Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 310),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Text(args.user['settings']['department']),
                  Text(args.user['display_name'], style: TextStyle(fontSize: 20)),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: InkWell(
                      child: Text(tAcc != null ? tAcc : '', style: TextStyle(color: Color.fromRGBO(237, 28, 128, 1))),
                      onTap: () => launch('https://t.me/$tAcc')
                    )
                  )
                ]),
                Row(children: <Widget>[
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star_half),
                  Icon(Icons.star_border),
                ])
              ])
            ),
            Container(
              child: Flexible(child: isLoading ? SpinKitPulse(color: Colors.grey) : ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: _projects.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return InkWell(child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(_projects[index]['name'])
                  ));
                })
              )
            )
          ])
        ],
      ),
    );
  }
}
