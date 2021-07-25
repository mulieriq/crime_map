import 'package:crime_map/src/models/user_model.dart';
import 'package:flutter/material.dart';

class BaseProvider with ChangeNotifier {
  bool appBusy = false;
  UserModel? _user;
  UserModel? get user => _user;
  setBusy(value) {
    appBusy = value;
    notifyListeners();
  }

  setCurrentUser(UserModel currentUser) {
    _user = currentUser;
    notifyListeners();
  }
}
