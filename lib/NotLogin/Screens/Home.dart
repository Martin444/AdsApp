import 'package:AdsApp/User/UI/AllSection.dart';
import 'package:AdsApp/User/UI/Profile_details.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class HomeNotLogin extends StatefulWidget {
  @override
  _HomeNotLoginState createState() => _HomeNotLoginState();
}

class _HomeNotLoginState extends State<HomeNotLogin>  with SingleTickerProviderStateMixin{

    TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50),
          child: Row(
              children: <Widget>[
                // Icon(Icons.menu, color: Colors.black, size: 6 * SizeConfig.imageSizeMultiplier,),
                Icon(Icons.person, color: Colors.black, size: 6 * SizeConfig.imageSizeMultiplier,),
                Spacer(),
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
                    ProfileDetails(),
                    ProfileDetails(),
                    ProfileDetails(),
                    
              ]),
            ),
          )
      ],),
    );
  }
}