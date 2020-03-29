import 'package:AdsApp/User/Repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:AdsApp/User/Models/user.dart';
import 'package:AdsApp/User/Repository/cloud_firestore_repository.dart';


class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos = Streams
  //Stream - firebase

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Casos uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
  }

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  //Future<void> updateOrderDate(Order order) => _cloudFirestoreRepository.updateOrderDate(order);
  //Creamos un streeam que está escuchando los pedidos y me los trae en tiempo real.
  //Stream<QuerySnapshot> orderListStream = Firestore.instance.collection(CloudFirestoreAPI().ORDERS).snapshots();
  //Stream<QuerySnapshot> get ordersStream => orderListStream;



  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {

  }
}