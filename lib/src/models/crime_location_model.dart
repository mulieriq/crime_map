import 'package:cloud_firestore/cloud_firestore.dart';

class CrimeLocationModel {
  double? latitude;
  double? longitude;
  int? reportNumber;
  String? locationId;
  List<String>? crimeImages;

  CrimeLocationModel(
      {this.latitude,
      this.longitude,
      this.locationId,
      this.reportNumber,
      this.crimeImages});

  CrimeLocationModel.fromFirestore(DocumentSnapshot docs, String id) {
    latitude = docs['latitude'];
    longitude = docs['longitude'];
    reportNumber = docs['reportNumber'];
    locationId = id;
    crimeImages = docs['crimeImages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['reportNumber'] = this.reportNumber;
    data['crimeImages'] = this.crimeImages;
    data['locationId'] = this.locationId;

    return data;
  }
}
