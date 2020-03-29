import 'package:flutter/material.dart';


class Avatar extends StatelessWidget {

  String pathImage = 'assets/img/illustration_1.png';
  String named = "Alejandro";

  Avatar(this.pathImage, this.named);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: 80.0,
      width: 80.0,
      margin: EdgeInsets.only(
          top: 70.0,
          left: 20.0
      ),

      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(pathImage)
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 7.0,
                offset: Offset(0.0, 0.3)
            )
          ]
      ),
    );

    final name = Container(
      margin: EdgeInsets.only(top:70, left: 20),
      child: Text(
        "Hi $named",
        style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            fontFamily: "Lato",
            color: Colors.white
        ),
      ),
    );

    return Row(
      children: <Widget>[
        card,
        name
      ],
    );
  }

}