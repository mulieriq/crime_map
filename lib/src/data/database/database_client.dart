import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../helpers/common/app_constants.dart';
import '../../models/crime_location_model.dart';

class FirebaseClient {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future saveUser(String userId, Map<String, dynamic> user) => _firestore
      .collection(AppConstants.usersCollections)
      .doc(userId)
      .set(user);
  Future<void> saveCrimeLocation(CrimeLocationModel data) => _firestore
      .collection(AppConstants.crimesLocationCollections)
      .add(data.toJson());

  Future<void> updateCrimeLocation(CrimeLocationModel data) => _firestore
      .collection(AppConstants.crimesLocationCollections)
      .doc(data.locationId)
      .update(data.toJson());
  Stream<QuerySnapshot>? getCrimeLocations() =>
      _firestore.collection(AppConstants.crimesLocationCollections).snapshots();

  Future<List<String>> uploadFiles(List<Asset> _images) async {
    var imageUrls =
        await Future.wait(_images.map((_image) => uploadFile(_image)));
    print(imageUrls);
    return imageUrls;
  }

  Future<String> uploadFile(Asset _image) async {
    ByteData byteData = await _image.getByteData();
    Uint8List imageData = byteData.buffer.asUint8List();
    Reference reference = FirebaseStorage.instance.ref().child(
        AppConstants.firebaseStorageBucket + "/${DateTime.now().toString()}");
    UploadTask uploadTask = reference.putData(imageData);

    await uploadTask.then((TaskSnapshot snapshot) {
      print('Upload complete!');
    });
    return await reference.getDownloadURL();
  }
}
