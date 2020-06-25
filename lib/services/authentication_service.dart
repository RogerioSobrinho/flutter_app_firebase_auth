import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthentaticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future singUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isLogged() async {
    var user = await _firebaseAuth.currentUser();
    return user != null;
  }

  Future signOut() async {
    await _firebaseAuth.signOut();
  }
}
