import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userName;
  String? userEmail;

  UserModel({this.userName, this.userEmail});

  UserModel.fromFireStore(DocumentSnapshot docs) {
    userName = docs['userName'];
    userEmail = docs['userEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    return data;
  }
}
