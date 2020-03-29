import 'package:flutter/material.dart';


class BarTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            child: Container(
              alignment: Alignment.topCenter,
              height: 40,
              width: 40,
              child: Icon(
              Icons.arrow_back_ios,
              size: 36,
              ),
            ),
            onTap: (){
              Navigator.pop(context);
            },

          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3.45, top: 5),
            child: Text(
              "Explore",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
            
          // Container(
          //   padding: EdgeInsets.only(left: 75),
          //   child: InkWell(
          //       child: Icon(
          //               Icons.favorite_border,
          //               size: 28,
          //               ),
          //           ),
          // ),

          // Container(
          //   alignment: Alignment.topRight,
          //   padding: EdgeInsets.only(right: 10),
          //   child: InkWell(
          //       child: Icon(
          //               Icons.person,
          //               size: 32,
          //               ),
          //               onTap: (){
          //                 Navigator.push(context, 
          //                 new MaterialPageRoute(
          //                   builder: (BuildContext context) => new ProfileDetails()
          //                 ));
          //               },
          //           ),
          // ),
        ],
      ),
    );
  }
}