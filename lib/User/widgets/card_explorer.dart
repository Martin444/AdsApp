import 'package:flutter/material.dart';
import 'package:AdsApp/User/Models/resturant.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/UI/Explore_details.dart';

class CardExplore extends StatefulWidget {
  Restaurant restaurant;
  User user;
  CardExplore(this.restaurant, this.user);

  @override
  _CardExploreState createState() => _CardExploreState();
}

class _CardExploreState extends State<CardExplore> {
  @override
    Widget build(BuildContext context) {
    return InkWell(
      child: Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 11.0,
              offset: Offset(0.0, 4.4)
              )
          ],
          color: Colors.white
      ),

      child: Row(
        children: <Widget>[
          Image.network(widget.restaurant.photoPortail, scale: 3),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10, bottom: 2),
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget.restaurant.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                        ),

                         Text(
                            widget.restaurant.textprev,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                            ),
                            textAlign: TextAlign.center,
                          ),

                       
                    ],
                  )
                ),
              ],
            )
        ],
      ),
    ),
      onTap: (){
        print("Tambien me voy a los detalles");
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