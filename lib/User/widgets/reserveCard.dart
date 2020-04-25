import 'package:flutter/material.dart';
import 'package:AdsApp/User/Models/reservation.dart';
import 'package:AdsApp/Widgets/button_custom.dart';

class ReserveCard extends StatelessWidget {
  Reservation reservation;

  ReserveCard(this.reservation);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18)
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(reservation.commercePhoto),
                        radius: 36,
                      ),
                      SizedBox(width: 11.0,),
                      RichText(text: TextSpan(
                        text: reservation.commerceName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800, 
                          color: Colors.black,
                          height: 2.5
                        ),
                      )),
                    ],
                  ),
                ),
                      ButtonCustom(
                        text: 'Contactar', 
                        height: 40,
                        width: 80,
                        onPressed: (){})

              ],
            )
          ],
        ),
      )
    );
  }
}