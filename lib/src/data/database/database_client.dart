import 'package:cloud_firestore/cloud_firestore.dart';

import '../../helpers/common/app_constants.dart';

class FirebaseClient {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future saveUser(String userId, Map<String, dynamic> user) => _firestore
      .collection(AppConstants.usersCollections)
      .doc(userId)
      .set(user);
  void saveCrimeLocation(Map<String, dynamic> data) =>
      _firestore.collection(AppConstants.usersCollections).add(data);
  Stream<QuerySnapshot>? getCrimeLocations() =>
      _firestore.collection(AppConstants.crimesLocationCollections).snapshots();
}
