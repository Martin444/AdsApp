import 'package:AdsApp/User/Models/Ads.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/widgets/baner_explore_details.dart';
import 'package:AdsApp/User/widgets/bartop_explore_details.dart';
import 'package:AdsApp/User/widgets/reserve_buttons.dart';
import 'package:flutter/material.dart';


class Second extends StatelessWidget {
  Ads ads;
  User user;
  Second(this.ads, this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(bottom: 100.0),
            children: <Widget>[
              Column(
                children: <Widget>[
                    BanerDetails(ads),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                      child: Text(
                        ads.description,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.left,
                        ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 1.8, top: 15,),
                    //   child: Row(
                    //     children: <Widget>[
                    //       Icon(
                    //         Icons.timer,
                    //         size: 21,
                    //       ),
                    //       Text(
                    //         "${restaurant.houropen} - ${restaurant.hourclose}",
                    //         style:TextStyle(fontWeight: FontWeight.w700),
                    //         textAlign: TextAlign.center,
                    //         textDirection: TextDirection.ltr,
                    //         )
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.only(top: 15),
                    //   alignment: Alignment.center,
                    //   child: Column(
                    //     children: <Widget>[
                    //       Text(
                    //         "Dirección",
                    //         style:TextStyle(
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 21),
                    //           textAlign: TextAlign.left,
                    //         ),

                    //         Text(
                    //         restaurant.direction,
                    //         style:TextStyle(
                    //           fontWeight: FontWeight.w400,
                    //           fontSize: 19),
                    //         )
                    //     ],
                    //   ),
                    // )
                ],
              ),
            ],
          ),
          BarTopDetails(ads, user),
          ReserveButtons(ads, user),
        ],
      ),
    );
  }
}