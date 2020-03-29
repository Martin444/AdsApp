import 'package:flutter/material.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/widgets/background.dart';
import 'package:AdsApp/User/widgets/bar_top.dart';
import 'package:AdsApp/User/widgets/explore_list.dart';

class ProfileUser extends StatefulWidget {
  User user;

  ProfileUser(this.user);
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
        children: <Widget>[
        ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ExploreList(widget.user),
                        ],
                      ),
                    ],
                  ),
                ]
            ),
        GradientBack(height: 50,),
        BarTop(),
      ],),
      )
    );
  }
}
