import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:AdsApp/User/Models/resturant.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/Widgets/button_blue.dart';

class ReserveButtons extends StatefulWidget {
  Restaurant restaurant;
  User user;
  

  ReserveButtons(this.restaurant,this.user);

  @override
  _ReserveButtonsState createState() => _ReserveButtonsState();
}

class _ReserveButtonsState extends State<ReserveButtons> {

  DateTime selectDate = DateTime.now();
  TimeOfDay selectedHours = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.15,),
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 14.0,
              )
          ]
      ),

      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: ButtonBlue(
            width: 130,
            height: 50, 
          onPressed: ()async{
            var selectedeDate = await createAlertDialog(context);
            if(selectedeDate == null) return;
            var selectedtimer = await selectedTimer(context); 
            if(selectedtimer == null) return;

            setState(() {
              this.selectDate = DateTime(
                selectedeDate.year,
                selectedeDate.month,
                selectedeDate.day,
                selectedtimer.hour,
                selectedtimer.minute
              ).add(Duration(seconds: 23));
            });

            print(selectDate);
           await Firestore.instance.collection('reservations').add({
              'date' : selectDate,
              'userOwner' : '${widget.user.uid}',
              'commerce' : Firestore.instance.document('restaurants/${widget.restaurant.restid}'),
              'nameUser' : widget.user.name,
              'commerceName' : widget.restaurant.name,
              'commercePhoto' : widget.restaurant.photoPortail
            }).whenComplete((){
               Scaffold.of(context).showSnackBar(
                SnackBar(
                content: Text('Reservado'),
            ));
            });
            
            }, text: "Reservar",),
            ),
            
                      widget.restaurant.delivery ? 
                      Container(
                        height: 48,
                        width: 60,
                        margin: EdgeInsets.only(top: 12,bottom: 8),
                        child: FlatButton(
                          color: Colors.black12,
                          child: Icon(Icons.time_to_leave),
                          onPressed: (){
                             
                          },
                        ),
                      )
                      : SizedBox(height: 30),
            
                      Container(
                        height: 48,
                        width: 60,
                        margin: EdgeInsets.only(top: 12,bottom: 8, left: 16),
                        child: FlatButton(
                          child: Icon(Icons.location_on),
                          color: Colors.black12,
                          onPressed: (){
                                  Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text("Buscando"),
                                          )
                                        );
                          },
                        ),
                      )
                    ],
                  ),
                );
              }
}
            
          Future<TimeOfDay> selectedTimer(BuildContext context){
            final now = DateTime.now();
              return showTimePicker(context: context, 
              initialTime: TimeOfDay(hour: now.hour, minute: now.minute)
              );
          }
           Future<DateTime>  createAlertDialog(BuildContext context) {
               var now = DateTime.now();
              return showDatePicker(
                context: context,
                initialDate: now,
                firstDate: now,
                lastDate: DateTime(2030)
              );
          }