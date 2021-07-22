import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

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

  Future<List<String>> uploadImageTest(
      {@required List<Uint8List>? assets}) async {
    List<String> uploadUrls = [];

    await Future.wait(
        assets!.map((asset) async {
          Reference reference = FirebaseStorage.instance
              .ref()
              .child(AppConstants.firebaseStorageBucket);
          UploadTask uploadTask = reference.putData(asset);
          TaskSnapshot storageTaskSnapshot;

          // Release the image data

          uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
            print(
                'Snapshot state: ${snapshot.state}'); // paused, running, complete
            print(
                'Progress: ${snapshot.totalBytes / snapshot.bytesTransferred}');
          }, onError: (Object e) {
            print(e);
          });

          uploadTask.then((TaskSnapshot snapshot) async {
            print('Upload complete!');
            storageTaskSnapshot = snapshot;
            final String downloadUrl =
                await storageTaskSnapshot.ref.getDownloadURL();
            uploadUrls.add(downloadUrl);
            print('Upload success');
          }).catchError((Object e) {
            print(e);
          });
        }),
        eagerError: true, cleanUp: (_) {
      print('eager cleaned up');
    });

    return uploadUrls;
  }
}
