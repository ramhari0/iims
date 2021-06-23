import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iimsapp/models/user.dart';
import 'package:iimsapp/my_args.dart';

class InstaHome extends StatefulWidget {
  final MyArguments myArguments;

  InstaHome({required this.myArguments});

  static const String routeName = '/insta_home';

  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  //final String jsonString = "{'user_name': 'IIMS', 'email': 'jitenbasnet@gmail.com'}";
  late User user;
  late Map<String, dynamic> jsonResponseMap;

  @override
  void initState() {
    super.initState();

    jsonResponseMap = {"user_name": "IIMS", "email": "jitenbasnet@gmail.com"};

    user = User.fromJson(jsonResponseMap);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Instagram"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop("you have been logged out");
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Text("WELCOME TO INSTAGRAM ${widget.myArguments.userName}"),
              Text("STATUS:  ${widget.myArguments.status}"),
            ],
          ),
        ),
      ),
    );
  }
}
