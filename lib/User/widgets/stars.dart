import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.amber,
            size: 18,
            ),

          Icon(
            Icons.star,
            color: Colors.amber,
            size: 18,
            ),

            Icon(
            Icons.star,
            color: Colors.amber,
            size: 18,
            ),

            Icon(
            Icons.star,
            color: Colors.amber,
            size: 18,
            ),

            Icon(
            Icons.star_half,
            color: Colors.amber,
            size: 18,
            )
        ],
      ),
    );
  }
}