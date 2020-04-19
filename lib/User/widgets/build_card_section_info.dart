import 'package:AdsApp/User/Models/Ads.dart';
import 'package:AdsApp/Widgets/floating_action_button_green.dart';
import 'package:flutter/material.dart';


class BuildCardSectionInfo extends StatelessWidget {

  Ads ads;

  BuildCardSectionInfo(this.ads);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 1.3;

    final place = Text(
      this.ads.name,
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
    );

    final placeInfo = Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10.0
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*Text(
                this.place.name,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold
                ),
              ),*/
              Text(
                this.ads.description,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold
                ),
              )
            ]
        )
    );

    final steps = Text(
      'Precio: ${this.ads.price}',
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber
      ),
    );

    final card = Container(
      width: screenWidth * 1.1,
      height: screenWidth * 1,
      margin: EdgeInsets.only(bottom:30),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(this.ads.urlImage)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
      child: Container(
        decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),

            ),
        child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                place,
                placeInfo,
                steps
              ],
            )
        ),
      ),
    );

    return Stack(
      alignment: Alignment(0.8, 0.90),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(iconData: Icons.favorite, onPressed: () {},)
      ],
    );
  }

}