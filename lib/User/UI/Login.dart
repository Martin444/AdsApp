import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:AdsApp/User/Bloc/bloc_user.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/Widgets/button_blue.dart';
import 'package:AdsApp/Widgets/button_custom.dart';
import 'package:AdsApp/Widgets/button_green.dart';


class Login extends StatefulWidget {

  String textButton = "Registrate con Google";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width * 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        image: AssetImage("assets/loginTrip.png")
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
            ),

            ButtonCustom(
              text: widget.textButton,
              onPressed: (){
                setState(() {
                  widget.textButton = "Espere..";
                });

                userBloc.signOut();
                userBloc.signIn().then((FirebaseUser user){
                  userBloc.updateUserData(User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoURL: user.photoUrl
                  ));

                  Navigator.pop(context);
                });
              },
              height: 45,),

          ],
        ),
      ),
    );
  }
}