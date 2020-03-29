import 'package:AdsApp/User/Models/user.dart';
import 'cloud_firestore_api.dart';


class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);
//Future<void> updateOrderDate(Order order) => _cloudFirestoreAPI.updateOrderDate(order);



}