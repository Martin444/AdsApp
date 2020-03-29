
import 'package:flutter/material.dart';

class ButtonBlue extends StatefulWidget {

  final String text ;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed;

  ButtonBlue({Key key, @required this.text, @required this.onPressed, this.height, this.width});

  @override
  _ButtonBlueState createState() => _ButtonBlueState();
}

class _ButtonBlueState extends State<ButtonBlue> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
        ),
        width: widget.width ,
        height: widget.height ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
                colors: [
                  Color(0xFF1976d3),//arriba
                  Color(0xFF2196f3)//abajo
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp
            )
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Lato",
                color: Colors.white
            ),
          ),
        ),
      ),
    );;
  }
}