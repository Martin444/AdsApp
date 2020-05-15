import 'package:AdsApp/User/Bloc/bloc_user.dart';
import 'package:AdsApp/User/UI/AllSection.dart';
import 'package:AdsApp/User/UI/FilterSection.dart';
import 'package:AdsApp/User/UI/Login.dart';

import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class HomeNotLogin extends StatefulWidget {
  @override
  _HomeNotLoginState createState() => _HomeNotLoginState();
}

class _HomeNotLoginState extends State<HomeNotLogin>  with SingleTickerProviderStateMixin{

    TabController tabController;
    UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfae532),
      body: Column(children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  new Login()
              )
          );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
            child: Row(
                children: <Widget>[
                  Text("Bright", style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: Color(0xFF030045)
                  ),),
                  Spacer(),
                  Icon(Icons.person, color: Colors.black, size: 9 * SizeConfig.imageSizeMultiplier,),
                ],
              ),
          ),
        ),

         TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
              indicatorWeight: 3.0,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text("Todo", style: TextStyle(
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
              height: 80,
              child: TabBarView(
                controller: tabController,
                  children: <Widget>[
                    AllSection(),
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