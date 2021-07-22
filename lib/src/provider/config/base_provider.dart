import 'package:flutter/material.dart';

class BaseProvider with ChangeNotifier {
  bool appBusy = false;

  setBusy(value) {
    appBusy = value;
    notifyListeners();
  }
}
