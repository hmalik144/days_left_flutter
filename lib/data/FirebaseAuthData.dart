// import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthData {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User getUser() {
    return firebaseAuth.currentUser;
  }

  String getUid() {
    return getUser()?.uid;
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) {
    return firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signIn(String email, String password) {
    return firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> resetPassword(String email) {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() {
    return firebaseAuth.signOut();
  }

  Future<void> updateUsername(String newEmail) {
    return getUser().updateEmail(newEmail);
  }

  Future<void> updatePassword(
      String email, String password, String newPassword) async {
    UserCredential credentials = await signIn(email, password);
    return credentials.user.updatePassword(newPassword);
  }

  Future<void> updateProfile({String displayName, String photoURL}) {
    return getUser()
        .updateProfile(displayName: displayName, photoURL: photoURL);
  }
}
