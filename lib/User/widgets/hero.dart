import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:AdsApp/User/Models/resturant.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/UI/Explore_details.dart';

class HeroExplore extends StatefulWidget {
  Restaurant restaurant;
  User user;

  HeroExplore(this.restaurant, this.user);
  @override
  _HeroExploreState createState() => _HeroExploreState();
}

class _HeroExploreState extends State<HeroExplore> {

    @override
  Widget build(BuildContext context) {
   

        return InkWell(
          child: Container(
          margin: EdgeInsets.only(top: 59),
          width: MediaQuery.of(context).size.width * 1 ,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/restaurant1.jpg'),
                fit: BoxFit.cover
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 14.0,
                  )
              ]
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black26
            ),
            child: Container(
              margin:EdgeInsets.only(top: 70),
              alignment: Alignment.bottomCenter,
              height: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.restaurant.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                    ),

                    Text(
                    widget.restaurant.textprev,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                    ),
                ],
              ),
            )
          )
        ),
      onTap: (){
        Navigator.push(context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  new ExploreDetails(widget.restaurant, widget.user)
              )
          );
      },

    );
    
      }
  }
