import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:AdsApp/User/Bloc/bloc_user.dart';
import 'package:AdsApp/User/UI/Home.dart';

import 'SizeConfig.dart';

void main(){

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey,
    statusBarBrightness: Brightness.dark
  ));

  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Home(),
              );
            }
          );
        }
      ),
      bloc: UserBloc(),
    );
  }
}


