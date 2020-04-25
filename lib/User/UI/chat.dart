import 'dart:io';

import 'package:AdsApp/User/Bloc/bloc_user.dart';
import 'package:AdsApp/User/Models/Ads.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:AdsApp/User/Models/user.dart';

class Chat extends StatefulWidget {
  static const String id = "CHAT";
   User user;
   Ads ads;

  
  Chat({Key key, this.user, this.ads}) : super(key: key);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  String userId = "";
  String userName= "";
  File _image;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  UserBloc userBloc;


  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('messages').add({
        'chatID': widget.user.uid,
        'text': messageController.text,
        'from': widget.user.name,
        'date': DateTime.now().toIso8601String().toString(),
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return SafeArea(
        child: Center(
          child: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance.collection('users').document(widget.user.uid).snapshots(),
            builder: (context, snapshot){
              if (!snapshot.hasData || snapshot.hasError){
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 50.0
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("Esperando datos")
                      ],
                    ),
                  );
              }else{
                DocumentSnapshot userOwner = snapshot.data;
                if(snapshot.hasData){
                  print(userOwner.data['name']);
                  userId = userOwner.data['uid'];
                  userName = userOwner.data['name'];

                  return Scaffold(
                    appBar: AppBar(
                      title: Text("$userName"),
                    ),
                    body: SafeArea(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: StreamBuilder(
                  stream: _firestore
                      .collection('messages')
                      .where("chatID", isEqualTo: widget.user.uid)
                      .orderBy('date')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: Text("Pregunta si esta disponible"),
                      );

                    List<DocumentSnapshot> docs = snapshot.data.documents;   
                    List<Widget> messages = docs.map((doc) => Message(
                              from: doc.data['from'],
                              text: doc.data['text'],
                              me:  widget.user.name == doc.data['from'],
                            ))
                        .toList();

                    return ListView(
                      controller: scrollController,
                      children: <Widget>[
                        ...messages,
                      ],
                    );
                  },
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) => callback(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFe5e5e5),
                          border: InputBorder.none,
                          hintText: "Escribe un mensaje...",
                           enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                              borderRadius: BorderRadius.all(Radius.circular(9.0))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                              borderRadius: BorderRadius.all(Radius.circular(9.0))
                          ),
                          
                        ),
                        controller: messageController,
                      ),
                    ),
                     
                    Container(
                      width: 70.0,
                      margin: EdgeInsets.only(left: 10),
                      child: FlatButton(
                     
                      child: Text("Enviar"),
                      onPressed: callback,
                    ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),)
                    );
                }
              }
            }
            ,
          ),
        )
      );
  }
}

class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SendButton({Key key, this.text, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.orange,
      onPressed: callback,
      child: Text(text),
    );
  }
}

class Message extends StatelessWidget {
  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
            me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
          ),
          Material(
            color: me ? Colors.teal : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
                style: TextStyle(
                    color: me ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  )

              ),
            ),
          )
        ],
      ),
    );
  }
}