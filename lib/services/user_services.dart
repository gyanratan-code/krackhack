import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUserProfile({
    required String username,
    required String bio,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently signed in.');
    }
    final uid = user.uid;

    // Query for a document where 'uid' equals the current user's uid.
    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .where('uid', isEqualTo: uid)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Update the found document.
      await querySnapshot.docs.first.reference.set({
        'username': username,
        'bio': bio,
      }, SetOptions(merge: true));
    } else {
      // If no document exists, create a new one with the uid field.
      await _firestore.collection('users').add({
        'uid': uid,
        'username': username,
        'bio': bio,
      });
    }
  }
}
