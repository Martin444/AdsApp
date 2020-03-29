import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:AdsApp/User/Models/user.dart';




class CloudFirestoreAPI {

  final String USERS = "users";
  //final String ORDERS = "order";

  final Firestore _db = Firestore.instance;
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid' : user.uid,
      'name' : user.name,
      'email' : user.email,
      'photoURL' : user.photoURL,
      //'myOrders' : user.myOrders,
      'lastSignIn' : DateTime.now()
    }, merge: true);
  }

/*Future<void> updateOrderDate(Order order) async{
    CollectionReference refOrders = _db.collection(ORDERS);
    await _auth.currentUser().then((FirebaseUser user){
      refOrders.add({
        'cantidadRemera': order.cantidadRemera,
        'plancharRemeta': order.plancharRemeta,
        'cantidadJeans': order.cantidadJeans,
        'plancharJeans': order.plancharJeans,
        'cantidadMedias': order.cantidadMedias,
        'plancharMedias': order.plancharMedias,
        'cantidadInterior': order.cantidadInterior,
        'plancharInterior': order.plancharInterior,
        'cantidadShorst': order.cantidadShorst,
        'plancharShorts': order.plancharShorts,
        'cantidadBuzo': order.cantidadBuzo,
        'plancharBuzo': order.plancharBuzo,
        'cantidadSweater': order.cantidadSweater,
        'plancharSweater': order.plancharSweater,
        'cantidadPantalonAlg': order.cantidadPantalonAlg,
        'plancharPantalonAlg': order.plancharPantalonAlg,
        'cantidadChomba': order.cantidadChomba,
        'plancharChomba': order.plancharChomba,
        'cantidadPantalonVestir': order.cantidadPantalonVestir,
        'plancharPantalonVestir': order.plancharPantalonVestir,
        'cantidadCamisa': order.cantidadCamisa,
        'plancharCamisa': order.plancharCamisa,
        'cantidadCalza': order.cantidadCalza,
        'plancharCalza': order.plancharCalza,
        'cantidadCorpino': order.cantidadCorpino,
        'plancharCorpino': order.plancharCorpino,
        'cantidadCamperaAlg': order.cantidadCamperaAlg,
        'plancharCamperaAlg': order.plancharCamperaAlg,
        'cantidadRemeraSport': order.cantidadRemeraSport,
        'plancharRemeraSport': order.plancharRemeraSport,
        'cantidadCampera': order.cantidadCampera,
        'plancharCampera': order.plancharCampera,
        'cantidadJersey': order.cantidadJersey,
        'plancharJersey': order.plancharJersey,
        'cantidadPollera': order.cantidadPollera,
        'plancharPollera': order.plancharPollera,
        'cantidadVestido': order.cantidadVestido,
        'plancharVestido': order.plancharVestido,
        'cantidadUniforme': order.cantidadUniforme,
        'plancharUniforme': order.plancharUniforme,
        'cantidadTrajeBano': order.cantidadTrajeBano,
        'cantidadBufanda': order.cantidadBufanda,
        'plancharBufanda': order.plancharBufanda,
        'cantidadGuantes': order.cantidadGuantes,
        'plancharGuantes': order.plancharGuantes,
        'cantidadChaleco': order.cantidadChaleco,
        'plancharChaleco': order.plancharChaleco,
        'cantidadFalda': order.cantidadFalda,
        'plancharFalda': order.plancharFalda,
        'cantidadTop': order.cantidadTop,
        'plancharTop': order.plancharTop,
        'cantidadBody': order.cantidadBody,
        'plancharBody': order.plancharBody,
        'cantidadCancanes': order.cantidadCancanes,
        'plancharCancanes': order.plancharCancanes,
        'cantidadToallas': order.cantidadToallas,
        'plancharToallas': order.plancharToallas,
        'cantidadBlusa': order.cantidadBlusa,
        'plancharBlusa': order.plancharBlusa,
        'cantidadZapatilla': order.cantidadZapatilla,
        'cantidadSabanas': order.cantidadSabanas,
        'plancharSabanas': order.plancharSabanas,
        'priceTotal': order.priceTotal,
        'type' : order.type,
        'typePayment': order.typePayment,
        'description': order.description,
        'userOwner' : _db.document("$USERS/${user.uid}"),
        'state': order.state,
        'location': order.direction,
        'neighborhood': order.neighborhood,
        'recolectionStart':order.recolectionStart,
        'finalDelivery': order.finalDelivery,
      }).then((DocumentReference dr){
        dr.get().then((DocumentSnapshot snapshot){
          DocumentReference refUsers = _db.collection(USERS).document(user.uid);
          refUsers.updateData({
            'myOrders' : FieldValue.arrayUnion([_db.document("$USERS/${snapshot.documentID}")])
          });
        });
      });
    });
  }*/


}