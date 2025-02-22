import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  Future<String> createAccountWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ User Created: ${userCredential.user?.email}");
      return "Account created";
    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Auth Error: ${e.code} - ${e.message}");
      return e.message.toString();
    }
  }

  Future<String> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Login successful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<String> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return "Logout Successful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<bool> isLoggedIn() async {
    var user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  // add name in users collection
  Future<String> addName(String name, String uid) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    try {
      await users.add({'name': name, 'uid': uid});
      return "Name Updated.";
    } catch (error) {
      return "Error in updating name";
    }
  }
}
