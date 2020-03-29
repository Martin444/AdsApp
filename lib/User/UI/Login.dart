import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:AdsApp/User/Bloc/bloc_user.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/Widgets/button_blue.dart';
import 'package:AdsApp/Widgets/button_custom.dart';
import 'package:AdsApp/Widgets/button_green.dart';


class Login extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50,bottom: 30),
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width * 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        image: AssetImage("assets/loginTrip.png")
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
            ),

            ButtonCustom(
              text: "Enter with Google",
              onPressed: (){
                userBloc.signOut();
                userBloc.signIn().then((FirebaseUser user){
                  userBloc.updateUserData(User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoURL: user.photoUrl
                  ));
                });
              },
              height: 45,),
            ButtonBlue(
              text: "Enter with Facebook",
              onPressed: (){
                print("Facebook");
              },
              height: 45,),

            ButtonGreen(
              text:"Enter with Number Phone",
              onPressed: (){
                print("Entrar con el numero de telefono");
              },
              height: 45,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 10,
                  left: 50.0,
                  right: 20.0,
                  bottom: 10.0
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      child: Text("Enter as guest",
                        style: TextStyle(
                            fontSize: 19
                        ),
                      ),
                      onPressed: (){
                      
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}