import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthService {
  Future<String> createAccountWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "profilePic": "assets/images/user.png",
        "joinedAt": FieldValue.serverTimestamp(),
        "bought": 0,
        "sold": 0,
        "pending": 0
      });

      print("User Created: ${userCredential.user?.email}");
      return "Account created";
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.code} - ${e.message}");
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
  Future<String> addName(String name, String uid, String email) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    try {
      await users.add({'name': name, 'uid': uid, 'email': email});
      try {
        await saveFCMToken(uid);
      } catch (error) {
        return "Error in FCM token";
      }
      return "Name Updated.";
    } catch (error) {
      return "Error in updating name";
    }
  }

  // save FCM Token
  Future<void> saveFCMToken(String userId) async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'fcmToken': token,
      });
    }
  }
}
