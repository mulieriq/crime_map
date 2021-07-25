import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data/database/database_client.dart';
import '../models/user_model.dart';
import 'config/base_provider.dart';

class AuthProvider extends BaseProvider {
  AuthProvider() {
    onCurrentUserChanged();
  }
  GoogleSignInAccount? authcurrentUser;
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
        } else {
          UserModel signedUser =
              UserModel(userEmail: value.email, userName: value.displayName);
          setCurrentUser(signedUser);
          FirebaseClient().saveUser(value.id, signedUser);
        }
      });
    } catch (error) {
      setBusy(false);
      print(error);
    }
  }

  onCurrentUserChanged() {
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null) {
        setCurrentUser(
            UserModel(userEmail: account.email, userName: account.displayName));
      }
      authcurrentUser = account;
      print("Current user =============$authcurrentUser");
      notifyListeners();
    });
    googleSignIn.signInSilently();
  }

  Future<void> handleSignOut() => googleSignIn.disconnect();
}
