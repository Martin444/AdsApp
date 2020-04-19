import 'package:flutter/material.dart';


class FavoriteCard extends StatefulWidget {

  String _tag;

  FavoriteCard(this._tag);

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
     return InkWell(
                onTap: (){},
                child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
                
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            // Navigator.push(context,
                            //   new MaterialPageRoute(
                            //       builder: (BuildContext context) =>
                            //       // new ExploreDetails()
                            //   )
                          // );
                          },
                          child: Container(
                            child: Column(children: <Widget>[
                            Hero(
                              tag: widget._tag,
                              child: Image.network(
                                "https://media-cdn.tripadvisor.com/media/photo-s/14/d3/78/6f/vella-elegant-restaurant.jpg",
                                 fit: BoxFit.cover,
                                 width: 350,
                                 ),
                            ),
                          SizedBox(width: 12.0,),
                          RichText(
                            text: TextSpan(
                            text: 'Cocora Bar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              height: 2.5,
                            ),
                          ),
                          ),
                            ],),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
            ),
          ),
              );
  }
}