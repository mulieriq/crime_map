import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class BaseProvider with ChangeNotifier {
  bool appBusy = false;
  UserModel? _user;
  UserModel? get currentUser => _user;
  setBusy(value) {
    appBusy = value;
    notifyListeners();
  }

  setCurrentUser(UserModel currentUser) {
    _user = currentUser;
    notifyListeners();
  }
}
