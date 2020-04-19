import 'package:AdsApp/User/Models/Ads.dart';
import 'package:AdsApp/User/widgets/build_card_section.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../SizeConfig.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              home: AllSection(),
            );
          },
        );
      },
    );
  }
}

class AllSection extends StatefulWidget {
  AllSection({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _AllSectionState createState() => _AllSectionState();
}

class _AllSectionState extends State<AllSection> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('ads').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
         print(snapshot.data.documents.length);

        List<BuildCardSection> cardSection = new List<BuildCardSection>();

          snapshot.data.documents.forEach((f){
                  var datos = Ads(
                    id: f.documentID,
                    name: f['name'],
                    description: f['description'],
                    urlImage: f['urlImage'],
                    category: f['category'],
                    price: f['price'],
                    likes: f['likes'],
                  );
                    print(datos.description);
                    cardSection.add(BuildCardSection(datos));
                });

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: cardSection,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

        );
      }
    );
  }

  _buildFruitCard(String name, String asset, String rate, int color, int color2) {
    return Container(
      width: 42.5 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Color(color2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add, color: Colors.grey,),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              asset,
            fit: BoxFit.contain,
            height: 30 * SizeConfig.imageSizeMultiplier,
              width: 30 * SizeConfig.imageSizeMultiplier,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(name, style: TextStyle(
              fontFamily: 'OpenSans-Bold',
              fontWeight: FontWeight.bold,
              fontSize: 2.5 * SizeConfig.textMultiplier
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text("Gurugram Mandi Haryana", style: TextStyle(
                fontFamily: 'OpenSans-Bold',
                fontWeight: FontWeight.bold,
                fontSize: 1.5 * SizeConfig.textMultiplier
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(rate, style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 2.5 * SizeConfig.textMultiplier
                    ),),
                    Text("Per quintel", style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 1.3 * SizeConfig.textMultiplier
                    ),),
                  ],
                ),
                Spacer(),
                Text("View Prices", style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 1.3 * SizeConfig.textMultiplier
                ),),
              ],
            ),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier,)
        ],
      ),
    );
  }
}
