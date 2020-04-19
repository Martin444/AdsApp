import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:AdsApp/User/Models/resturant.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/widgets/hero.dart';

import 'card_explorer.dart';

class ExploreList extends StatelessWidget {
  User user;

  ExploreList(this.user);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('restaurants').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasData){
          AsyncSnapshot image = snapshot;
          List<CardExplore> cards = new List<CardExplore>();
            List<HeroExplore> hero = new List<HeroExplore>();
          image.data.documents.forEach((f){
            var restaurant = Restaurant(
              restid: f.documentID,
              name: f['name'],
              subname: f['subname'],
              description: f['description'],
              photoPortail: f['photoPortail'],
              textprev: f['textprev'],
              hourclose: f['hourclose'],
              houropen: f['houropen'],
              direction: f['direction'],
              delivery: f['delivery'],
              favorite: f['favorites']
            );
              
              cards.add(CardExplore(restaurant, user));
              restaurant.favorite >= 10 ?
              hero.add(HeroExplore(restaurant, user))
              : null;
            });
            
          return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Column(
                        children: hero,
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        children: cards,
                      )
                    )
                  ],
                );
        }
    });
  }
}