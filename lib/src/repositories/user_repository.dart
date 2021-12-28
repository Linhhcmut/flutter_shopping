import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ??
            GoogleSignIn(scopes: <String>[
              'email',
              'https://www.googleapis.com/auth/contacts.readonly'
            ]);

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(), password: password);
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleSignIn = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignIn.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _firebaseAuth.signInWithCredential(authCredential);
    final currentUser = _firebaseAuth.currentUser();
    return currentUser;
  }

  Future<bool> isSignedIn() async{
    return await _firebaseAuth.currentUser() != null;
  }

  Future<void> getUser() async{
    return await _firebaseAuth.currentUser();
  }

  Future<void> isSignedOut() async{
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

}
