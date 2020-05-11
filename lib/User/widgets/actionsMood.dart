import 'package:AdsApp/User/Bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/UI/Profile.dart';
import 'package:AdsApp/User/widgets/card_action.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class MyActions extends StatefulWidget {
  User user;
  
  MyActions(this.user);
  @override
  _MyActionsState createState() => _MyActionsState();
}

class _MyActionsState extends State<MyActions> {
  UserBloc userBloc;
  List<bool> isSeled = List.generate(2, (_) => false);

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: <Widget>[ ToggleButtons(
        selectedBorderColor: Colors.purple,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            // height: 61,
            child: Column(
              children: <Widget>[
              Icon(Icons.explore, size: 38),
              Text("Explorar")
            ],),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 40, right: 40),
          //   child: Column(children: <Widget>[
          //   Icon(Icons.hotel, size: 38),
          //   Text("Hotel")
          // ],),
          // ),
          Container(
            padding: EdgeInsets.all(19),
            child: Column(children: <Widget>[
              Icon(Icons.exit_to_app, size: 38),
              Text("Cerrar sesion")
            ],),
          ),
        ],
        isSelected: isSeled,
        onPressed: (int index){
          isSeled[index] = !isSeled[index]; 
          if(index == 0 ){
            Navigator.pop(context);
          }else if(index == 1 ){

            userBloc.signOut();
            Navigator.pop(context);
            
            // showModalBottomSheet(
            // backgroundColor: Colors.transparent,
            // context: context,
            // builder: (context){
            //   return Container(
            //     height: 150,
            //     color: Colors.white,
            //     child: Column(
            //       children: <Widget>[
            //           Container(
                    
            //           margin: EdgeInsets.only(top: 10),
            //           child: Center(
            //             child: Text(
            //               "¿Para cuantas personas estas buscando?",
            //               style: TextStyle(
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //         ),

            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: <Widget>[
            //           Container(
            //               height: 58,
            //               width: 60,
            //               margin: EdgeInsets.only(top: 0, left: 16),
            //               child: FlatButton(
                            
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: <Widget>[
            //                     Icon(Icons.perm_identity),
            //                     Text("Uno")
            //                   ],
            //                 ),
            //                 color: Colors.black12,
            //                 onPressed: (){
                                    
            //                 },
            //               ),
            //             ),

            //           Container(
            //               height: 58,
            //               width: 60,
            //               margin: EdgeInsets.only(top: 12, left: 16),
            //               child: FlatButton(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: <Widget>[
            //                     Icon(Icons.group),
            //                     Text("Dos")
            //                   ],
            //                 ),
            //                 color: Colors.black12,
            //                 onPressed: (){
                                  
            //                 },
            //               ),
            //             ),

            //           Container(
            //               height: 58,
            //               width: 60,
            //               margin: EdgeInsets.only(top: 12, left: 16),
            //               child: FlatButton(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: <Widget>[
            //                     Icon(Icons.group_add),
            //                     Text("Más")
            //                   ],
            //                 ),
            //                 color: Colors.black12,
            //                 onPressed: (){
                                  
            //                 },
            //               ),
            //             )
            //         ],)
            //       ],
            //     ),
            //   );
            // });
         
          
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
                                  
                                }),
                                CardAction("Sushi", 'assets/sushi.jpg', (){
                                 
                                }),
                                CardAction("Italiana", 'assets/italiana.png', (){
                                  
                                })

                              ],
                            ),
                            Column(
                              children: <Widget>[
                                CardAction("Steakhouse", 'assets/Steakhouse.jpg', (){
                                  
                                }),
                                CardAction("Seafood", 'assets/Seafood.jpg', (){
                               
                                }),
                                CardAction("Asiática", 'assets/asiatica.jpg', (){
                                 
                                })
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                CardAction("Healthy", 'assets/restaurant1.jpg', (){
                                  
                                }),
                                CardAction("Americana", 'assets/restaurant1.jpg', (){
                              
                                }),
                                CardAction("Argentina", 'assets/restaurant1.jpg', (){
                                  
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