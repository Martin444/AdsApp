import 'package:AdsApp/User/Bloc/bloc_user.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/UI/FilterSection.dart';
import 'package:AdsApp/User/UI/Profile_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';
import 'AllSection.dart';

class HomeLogin extends StatefulWidget {

  HomeLogin({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomeLoginState createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin>  with SingleTickerProviderStateMixin{

    TabController tabController;
    UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot){
       if(!snapshot.hasData || snapshot.hasError){
         return Scaffold(
                  body: Stack(
                        children: <Widget>[
                          Center(
                            child:
                              Text(
                                  "Cargando...",
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
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
          backgroundColor: Colors.white,
          body: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40, bottom: 10),
              child: Row(
                  children: <Widget>[
                    // Icon(Icons.menu, color: Colors.black, size: 6 * SizeConfig.imageSizeMultiplier,),
                    Spacer(),
                    // Icon(Icons.person, color: Colors.black, size: 6 * SizeConfig.imageSizeMultiplier,)
                    GestureDetector(
                      onTap: (){
                          Navigator.push(context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  new ProfileDetails()
                              )
                          );
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL),
                      ),
                    )

                  ],
                ),
            ),

             TabBar(  
                controller: tabController,
                indicatorColor: Colors.green,
                  indicatorWeight: 3.0,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      child: Text("Todos", style: TextStyle(
                        fontSize: 2.5 * SizeConfig.textMultiplier,
                        fontFamily: 'OpenSans'
                      ),),
                    ),
                    Tab(
                      child: Text("Autos", style: TextStyle(
                          fontSize: 2.5 * SizeConfig.textMultiplier,
                          fontFamily: 'OpenSans'
                      ),),
                    ),
                    Tab(
                      child: Text("Alquileres", style: TextStyle(
                          fontSize: 2.5 * SizeConfig.textMultiplier,
                          fontFamily: 'OpenSans'
                      ),),
                    ),
                    Tab(
                      child: Text("Comida", style: TextStyle(
                          fontSize: 2.5 * SizeConfig.textMultiplier,
                          fontFamily: 'OpenSans'
                      ),),
                    ),
                  ]),
                   Expanded(
                child: Container(
                  child: TabBarView(
                    controller: tabController,
                      children: <Widget>[
                        AllSection(user: user,),
                        FilterSection(title: "Autos",),
                        FilterSection(title: "Alquileres",),
                        FilterSection(title: "Comida",)
                        
                  ]),
                ),
              )
          ],),
        );
       }
     
      }
    );
  }
}