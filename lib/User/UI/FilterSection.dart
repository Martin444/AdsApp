import 'package:AdsApp/User/Models/Ads.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/widgets/build_card_section.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class FilterSection extends StatefulWidget {


  User user;
  FilterSection({Key key, @required this.title, this.user}) : super(key: key);


  final String title;

  @override
  _AllSectionState createState() => _AllSectionState();
}

class _AllSectionState extends State<FilterSection> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('ads').where("category", isEqualTo: widget.title).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.none:
            return Center(child: Text("No se encontraron publicaciones de esta categoria"));
          case ConnectionState.active:
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
                            cardSection.add(BuildCardSection(datos, widget.user));
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
                
          case ConnectionState.done:

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
                            cardSection.add(BuildCardSection(datos, widget.user));
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
            

                default:
        }


      }
    );
  }
}
