import 'package:flutter/material.dart';

class Ads {

  String id;
  String name;
  String description;
  String urlImage;
  String category;
  String price;
  int likes;
  bool liked;
  //User userOwner;

  Ads({
    Key key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    @required this.category,
    @required this.price,
    @required this.likes,
    this.liked,
    this.id
    //@required this.userOwner
  });
}