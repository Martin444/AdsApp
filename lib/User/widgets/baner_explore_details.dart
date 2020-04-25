import 'package:AdsApp/User/Models/Ads.dart';
import 'package:flutter/material.dart';
import 'package:AdsApp/User/Models/resturant.dart';
import 'package:AdsApp/User/widgets/stars.dart';

class BanerDetails extends StatelessWidget {

  Ads ads;
  BanerDetails(this.ads);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1 ,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(ads.urlImage),
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
          color: Colors.black54
        ),
        child: Container(
          margin:EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.7),
          alignment: Alignment.bottomCenter,
          height: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                ads.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                ),

                Text(
                ads.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
                ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 130),
                child: Stars(),
              )
            ],
          ),
        )
      )
    );
  }
}