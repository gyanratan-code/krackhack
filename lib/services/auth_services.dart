import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<String> createAccountWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await users.doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "profilePic": "assets/images/user.png",
        "joinedAt": FieldValue.serverTimestamp(),
        "bought": 0,
        "sold": 0,
        "pending": 0
      });

      // Save FCM Token after signup
      await saveFCMToken(userCredential.user!.uid);

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
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Save FCM Token after login
      await saveFCMToken(userCredential.user!.uid);

      return "Login successful";
    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Auth Error: ${e.code} - ${e.message}");
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

  // Save FCM Token to Firestore
  Future<void> saveFCMToken(String userId) async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();

      if (token == null) {
        print("⚠️ FCM Token is null, skipping update.");
        return;
      }

      await users.doc(userId).update({
        'fcmToken': token,
      });
      print("✅ FCM Token saved for user: $userId");

      // Start listening for token updates
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
        await users.doc(userId).update({
          'fcmToken': newToken,
        });
        print("🔄 Updated FCM Token: $newToken");
      }).onError((error) {
        print("❌ Error in token refresh: $error");
      });
    } catch (e) {
      print("❌ Error saving FCM Token: $e");
    }
  }

  Future<void> updateUserChatList({
    required String currentUid,
    required String receiverUid,
  }) async {
    try {
      DocumentReference currentUserRef = users.doc(currentUid);
      DocumentReference receiverUserRef = users.doc(receiverUid);

      // Add the receiver's UID to the current user's chat list.
      await currentUserRef.update({
        'chat': FieldValue.arrayUnion([receiverUid])
      });

      // Add the current user's UID to the receiver's chat list.
      await receiverUserRef.update({
        'chat': FieldValue.arrayUnion([currentUid])
      });
    } catch (e) {
      print("❌ Error updating chat list: $e");
    }
  }

  Future<void> removeUserFromChatList({
    required String currentUid,
    required String receiverUid,
  }) async {
    try {
      DocumentReference currentUserRef = users.doc(currentUid);
      DocumentReference receiverUserRef = users.doc(receiverUid);

      // Remove the receiver's UID from the current user's chat list.
      await currentUserRef.update({
        'chat': FieldValue.arrayRemove([receiverUid])
      });

      // Remove the current user's UID from the receiver's chat list.
      await receiverUserRef.update({
        'chat': FieldValue.arrayRemove([currentUid])
      });
    } catch (e) {
      print("❌ Error removing chat list entry: $e");
    }
  }
}
