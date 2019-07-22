import 'dart:core';
// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinkman_app/components/profile_header.dart';
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

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final ProfileScreenArguments args = ModalRoute.of(context).settings.arguments;
    print(args.user['settings']);

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
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Text(args.user['settings']['department']),
                Text(args.user['display_name'], style: TextStyle(fontSize: 20)),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: InkWell(
                    child: Text(tAcc != null ? tAcc : '', style: TextStyle(color: Color.fromRGBO(237, 28, 128, 1))),
                    onTap: () => launch('https://t.me/$tAcc')
                  )
                )
              ])
            ),
          ])
        ],
      ),
    );
  }
}