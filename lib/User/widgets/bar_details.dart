import 'package:flutter/material.dart';

class BarDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 65,
      left: 10,
      right: 18
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              "530 hotels founds",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700
              ),
            ),
          
          Container(
            child: Row(
              children: <Widget>[
                Text(
                    "Filter",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700 
                    ),
                  ),

                InkWell(
                    child: Icon(
                      Icons.filter_list,
                      size: 28,
                      ),
                  ),
              ],
            )
          ),

          


        ],
      ),
    );
  }
}