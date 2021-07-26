import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../views/auth/auth_page.dart';
import '../views/home/map_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var provider;

  @override
  void didChangeDependencies() {
    provider = Provider.of<AuthProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return provider.authcurrentUser == null ? AuthPage() : MapPage();
  }
}
