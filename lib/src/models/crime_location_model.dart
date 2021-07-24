import 'package:cloud_firestore/cloud_firestore.dart';

class CrimeLocationModel {
  double? latitude;
  double? longitude;
  int? reportNumber;
  List<String>? crimeImages;

  CrimeLocationModel(
      {this.latitude, this.longitude, this.reportNumber, this.crimeImages});

  CrimeLocationModel.fromFirestore(DocumentSnapshot docs) {
    latitude = docs['latitude'];
    longitude = docs['longitude'];
    reportNumber = docs['reportNumber'];
    crimeImages = docs['crimeImages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['reportNumber'] = this.reportNumber;
    data['crimeImages'] = this.crimeImages;
    return data;
  }
}
