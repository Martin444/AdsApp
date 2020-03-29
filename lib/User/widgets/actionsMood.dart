import 'package:flutter/material.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/UI/Profile.dart';
import 'package:AdsApp/User/widgets/card_action.dart';
import 'package:AdsApp/User/widgets/explore_list_filter.dart';

class MyActions extends StatefulWidget {
  User user;
  
  MyActions(this.user);
  @override
  _MyActionsState createState() => _MyActionsState();
}

class _MyActionsState extends State<MyActions> {
List<bool> isSeled = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: <Widget>[ ToggleButtons(
        selectedBorderColor: Colors.purple,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          Column(
            children: <Widget>[
            Icon(Icons.explore, size: 38),
            Text("Explorar")
          ],),
          Container(
            margin: EdgeInsets.only(left: 40, right: 40),
            child: Column(children: <Widget>[
            Icon(Icons.hotel, size: 38),
            Text("Hotel")
          ],),
          ),
          Column(children: <Widget>[
            Icon(Icons.restaurant, size: 38),
            Text("Restaurantes")
          ],),
        ],
        isSelected: isSeled,
        onPressed: (int index){
          isSeled[index] = !isSeled[index]; 
          if(index == 0 ){
            Navigator.push(context,
                   MaterialPageRoute(
                      builder: (BuildContext context) =>
                     ProfileUser(widget.user)
                  )
              );
          }else if(index == 1 ){
            showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context){
              return Container(
                height: 150,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                      Container(
                    
                      margin: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text(
                          "Para",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                      Container(
                          height: 58,
                          width: 60,
                          margin: EdgeInsets.only(top: 0, left: 16),
                          child: FlatButton(
                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.perm_identity),
                                Text("Uno")
                              ],
                            ),
                            color: Colors.black12,
                            onPressed: (){
                                    
                            },
                          ),
                        ),

                      Container(
                          height: 58,
                          width: 60,
                          margin: EdgeInsets.only(top: 12, left: 16),
                          child: FlatButton(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.group),
                                Text("Dos")
                              ],
                            ),
                            color: Colors.black12,
                            onPressed: (){
                                  
                            },
                          ),
                        ),

                      Container(
                          height: 58,
                          width: 60,
                          margin: EdgeInsets.only(top: 12, left: 16),
                          child: FlatButton(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.group_add),
                                Text("Más")
                              ],
                            ),
                            color: Colors.black12,
                            onPressed: (){
                                  
                            },
                          ),
                        )
                    ],)
                  ],
                ),
              );
            });
          }else{
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context){
                return Container(
                  height: 450,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text(
                            "Cuales son tus favoritos?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                CardAction("Mexican", 'assets/mexican.jpg', (){
                                   Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Mexican", widget.user)
                                        )
                                    );
                                }),
                                CardAction("Sushi", 'assets/sushi.jpg', (){
                                   Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Sushi", widget.user)
                                        )
                                    );
                                }),
                                CardAction("Italiana", 'assets/italiana.png', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Italiana", widget.user)
                                        )
                                    );
                                })

                              ],
                            ),
                            Column(
                              children: <Widget>[
                                CardAction("Steakhouse", 'assets/Steakhouse.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Steakhouse", widget.user)
                                        )
                                    );
                                }),
                                CardAction("Seafood", 'assets/Seafood.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Seafood",widget.user)
                                        )
                                    );
                                }),
                                CardAction("Asiática", 'assets/asiatica.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Asiática", widget.user)
                                        )
                                    );
                                })
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                CardAction("Healthy", 'assets/restaurant1.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Healthy", widget.user)
                                        )
                                    );
                                }),
                                CardAction("Americana", 'assets/restaurant1.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Americana", widget.user)
                                        )
                                    );
                                }),
                                CardAction("Argentina", 'assets/restaurant1.jpg', (){
                                  Navigator.push(context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                            new ExploreListFilter("Argentina",widget.user)
                                        )
                                    );
                                })
                              ],
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                );}
          );
          }
          print(index);
        },
      ),

      ]
    );
  }
}