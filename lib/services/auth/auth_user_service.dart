import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
//instance of auth and firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//get our current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

//sign in
  Future<UserCredential> signInWEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//sing up

  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      //create new user
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      //store user info in a separated doc if it doesnt exist
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }
//error handling
}
