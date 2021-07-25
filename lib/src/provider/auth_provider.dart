import 'package:crime_map/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'config/base_provider.dart';

class AuthProvider extends BaseProvider {
  AuthProvider() {
    onCurrentUserChanged();
  }
  GoogleSignInAccount? _currentUser;
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  User? userIsAuthenticated() => FirebaseAuth.instance.currentUser;

  Future<void> handleSignIn() async {
    setBusy(true);
    try {
      await googleSignIn.signIn().then((value) {
        setBusy(false);
        print("Sign in value ============> $value");
        if (value == null) {
          setBusy(false);
        } else {}
      });
    } catch (error) {
      setBusy(false);
      print(error);
    }
  }

  onCurrentUserChanged() {
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      _currentUser = account;
      print("Current user =============$_currentUser");
      notifyListeners();
    });
    googleSignIn.signInSilently();
  }

  Future<void> handleSignOut() => googleSignIn.disconnect();
}
