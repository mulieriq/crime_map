import 'package:firebase_auth/firebase_auth.dart';

import 'config/base_provider.dart';

class AuthProvider extends BaseProvider {
  User? userIsAuthenticated() => FirebaseAuth.instance.currentUser;
}
