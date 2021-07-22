import 'package:crime_map/src/provider/config/base_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends BaseProvider {
  User? userIsAuthenticated() => FirebaseAuth.instance.currentUser;
}
