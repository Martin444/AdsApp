import 'package:AdsApp/User/Bloc/bloc_user.dart';
import 'package:AdsApp/User/Models/resturant.dart';
import 'package:AdsApp/User/widgets/favorite_card.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:AdsApp/User/Models/reservation.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/UI/utils.dart';
import 'package:AdsApp/User/widgets/actionsMood.dart';
import 'package:AdsApp/User/widgets/reserveCard.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'Profile.dart';


class ProfileDetails extends StatefulWidget {

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {

  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData || snapshot.hasError){
           return Scaffold(
                  body: Stack(
                        children: <Widget>[
                          ListView(
                            children: <Widget>[
                              Text(
                                  "Usuario no logeado.Haz Login",
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                );
        }else{
        var user = User(
                    uid: snapshot.data.uid,
                    name: snapshot.data.displayName,
                    email: snapshot.data.email,
                    photoURL: snapshot.data.photoUrl
                );
           return Scaffold(
              body: SingleChildScrollView(  
                child: Container( 
                  width: MediaQuery.of(context).size.width,
                  color: mainBackgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topCenter,
                        overflow: Overflow.visible,
                        children: <Widget>[
                          _backCover(),
                          _greetings(user),
                          _bottomHolder(user),
                        ],

                      ),

                      SizedBox(height: 70.0),

                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // _buildNotificationCard(user),
                            _buildYourDriverDesigned(),
                            _buildYourDriverDesignedCard(user),
                            // _buildTourFavoritePlaces(),
                          ]
                        ),
                      )
                    ],
                  ),
                ),   
                
              ),
              
            );
        }
      },
    );

    
  }

    Container _backCover() {
    return Container(
                  padding: EdgeInsets.all(20.0),
                  height: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)
                      ),    
                     gradient: LinearGradient(
                       colors: <Color>[
                       mainC,midC,lightC,
                     ],
                     stops: [0.0,0.5,0.9],
                     begin: Alignment.centerLeft,
                     end: Alignment.centerRight,
                     ),
                  ),
                  
                   
                  
                

                );
  }

    Positioned _greetings(user){
        return Positioned(
          left: 20,
          bottom: 80,
          child: JelloIn(
            delay: Duration(milliseconds: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hola ${user.name}!',
                  style: TextStyle(
                    fontSize: 33,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    
                  ),
                ),
                SizedBox(height: 6.0,),
                Text(
                  'Que quieres encontrar hoy?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
        );
  }

    Positioned _bottomHolder(User user){

    return Positioned(
      left: 10,
      right: 10,
      top: 200,

      child: JelloIn(
        delay: Duration(milliseconds: 1000),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius: 5.5,
              blurRadius: 5.5,
            )]
          ),
          child: MyActions(user),
        ),
      ),
    );
  }

 
   _buildNotificationCard(User user){
      return JelloIn(
        delay: Duration(milliseconds: 2000),
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: lightC,
            borderRadius: BorderRadius.circular(20)
          ),
          child: ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: Colors.white,
              size: 32,
            ),
            title: Text("La opórtunidad de anunciarte es hoy",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
            ),
            trailing: OutlineButton(
              onPressed: (){
                userBloc.signOut();
                // Navigator.push(context,
                //      MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //        ProfileUser(user)
                //     )
                // );
              },
              color: Colors.transparent,
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.0
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26)
              ),
              child: Text("Descargar",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
              ),
          ),
        ),
      );
    }
  
     _buildYourDriverDesigned(){
      return JelloIn(
        delay: Duration(milliseconds: 3000),
        child: Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Mis conversaciones",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87
                ),
                )
            ],
          ),
        ),
      );
    }

    _buildYourDriverDesignedCard(User user) {
          return StreamBuilder(
            stream: Firestore.instance.collection('reservations').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.hasData){
                AsyncSnapshot reserva = snapshot;
                List<ReserveCard> reserv = new List<ReserveCard>();
                
                reserva.data.documents.forEach((f){
                  var datos = Reservation(
                    reserID: f.documentID,
                    commerce: f['commerce'].toString(),
                    commerceName: f['commerceName'],
                    commercePhoto: f['commercePhoto'],
                    userOwner: f['userOwner'],
                    nameUser: f['nameUser'],
                    date: f['date'],
                    );
                    print(datos.reserID);
                    reserv.add(ReserveCard(datos));
                });

              return JelloIn(
                delay: Duration(milliseconds: 3000),
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    
                    child: Column(
                      children: reserv,
                    ),
                  ),
                ),
              );
           
              }else{
                return _buildNotificationCard(user);
              }
            }
          );
}

     _buildTourFavoritePlaces(){
            return StreamBuilder(
              stream: Firestore.instance.collection('restaurants').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                print(snapshot.data.documents.length);

                 List<FavoriteCard> favorite = new List<FavoriteCard>();

                 snapshot.data.documents.forEach((f){
                  var datos = Restaurant(
                    restid: f.documentID,
                    name: f['name'].toString(),
                    subname: f['subname'],
                    description: f['description'],
                    photoPortail: f['photoPortail'],
                    textprev: f['textprev'],
                    houropen: f['houropen'],
                    hourclose: f['hourclose'],
                    direction: f['direction'],
                    favorite: f['favorite'],
                    delivery: f['delivery'],
                    );
                    print(datos.restid);
                    favorite.add(FavoriteCard("datos"));
                });

                return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text(
                              "Favoritos",
                            style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87
                            ),
                          )
                      ],
                    ),
                    ),
                    Column(
                      children: favorite,
                    )
                ],
                );
              }
            );
    }


}
