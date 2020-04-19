import 'package:AdsApp/NotLogin/Screens/Home.dart';
import 'package:AdsApp/User/UI/Init.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:AdsApp/User/Bloc/bloc_user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData || snapshot.hasError) {
          print(snapshot.hasError);
          return HomeNotLogin();
        } else {
          return HomeLogin();
        }
      },
    );
  }
}
