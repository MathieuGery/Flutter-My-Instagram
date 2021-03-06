import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> logIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (err) {
      return err.message;
    }
  }

  Future<String?> signUp(String name, String username, String email,
      String password, String confirmPassword, String biography) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot usernameCheck =
        await users.where('username', isEqualTo: username).get();
    QuerySnapshot emailCheck =
        await users.where('email', isEqualTo: email).get();

    if (usernameCheck.docs.isEmpty) {
      return ("User with this username already exists.");
    }
    if (emailCheck.docs.isEmpty) {
      return ("User with this email already exists.");
    }
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final userID = FirebaseAuth.instance.currentUser!.uid;

      await users.doc(userID).set({
        'name': name,
        'username': username,
        'email': email,
        'biography': biography
      }).catchError((error) => print("Failed to add user $error"));
      return "Registered in";
    } on FirebaseAuthException catch (err) {
      return err.message;
    }
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}