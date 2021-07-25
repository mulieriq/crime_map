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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> handleSignIn() async {
    setBusy(true);
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    try {
      await _auth.signInWithCredential(credential).then(((user) async {
        setBusy(false);
        print("Sign in value ============> $user");

        UserModel signedUser = UserModel(
            userEmail: user.user!.email, userName: user.user!.displayName);
        setCurrentUser(signedUser);
        FirebaseClient().saveUser(user.user!.uid, signedUser);
      }));
    } catch (e) {
      setBusy(false);
      print(e);
    }

    // setBusy(true);
    // try {
    //   await googleSignIn.signIn().then((value) {
    //     setBusy(false);
    //     print("Sign in value ============> $value");
    //     if (value == null) {
    //       setBusy(false);
    //     } else {
    //       UserModel signedUser =
    //           UserModel(userEmail: value.email, userName: value.displayName);
    //       setCurrentUser(signedUser);
    //       FirebaseClient().saveUser(value.id, signedUser);
    //     }
    //   });
    // } catch (error) {
    //   setBusy(false);
    //   print(error);
    // }
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
