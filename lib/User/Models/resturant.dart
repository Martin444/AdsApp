import 'package:flutter/material.dart';

class Restaurant {
  final String restid;
  final String name;
  final String subname;
  final String description;
  final String photoPortail;
  final String textprev;
  final String houropen;
  final String hourclose;
  final String direction;
  final num favorite;
  final bool delivery;
  //final List<Order> myOrders;



  Restaurant({
    Key key,
    @required this.restid,
    @required this.name,
    @required this.subname,
    @required this.description,
    @required this.photoPortail,
    @required this.textprev,
    @required this.houropen,
    @required this.hourclose,
    @required this.direction,
    @required this.delivery,
    @required this.favorite
    //this.myOrders,
  });
}