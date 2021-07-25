import 'package:cloud_firestore/cloud_firestore.dart';

class CrimeLocationUpdateModel {
  double? latitude;
  double? longitude;
  int? reportNumber;
  String? locationId;

  CrimeLocationUpdateModel({
    this.locationId,
    this.reportNumber,
  });

  CrimeLocationUpdateModel.fromFirestore(DocumentSnapshot docs, String id) {
    reportNumber = docs['reportNumber'];
    locationId = id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reportNumber'] = this.reportNumber;
    data['locationId'] = this.locationId;
    return data;
  }
}
