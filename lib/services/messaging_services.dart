import 'package:cloud_firestore/cloud_firestore.dart';

class MessagingServices {
  Future<List<Map<String, dynamic>>> fetchMessages(
      String userId1, String userId2) async {
    String chatId1 = "${userId1}_$userId2";
    String chatId2 = "${userId2}_$userId1"; // other case

    QuerySnapshot<Map<String, dynamic>> snapshot;
    if ((await FirebaseFirestore.instance
            .collection("chats")
            .doc(chatId1)
            .get())
        .exists) {
      snapshot = await FirebaseFirestore.instance
          .collection("chats")
          .doc(chatId1)
          .collection("messages")
          .orderBy("timestamp", descending: true) // Latest first
          .get();
    } else if ((await FirebaseFirestore.instance
            .collection("chats")
            .doc(chatId2)
            .get())
        .exists) {
      snapshot = await FirebaseFirestore.instance
          .collection("chats")
          .doc(chatId2)
          .collection("messages")
          .orderBy("timestamp", descending: true)
          .get();
    } else {
      return []; // No messages found
    }
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  // add chat uid to user collection
  Future<void> addChatToUser(String userId, String chatUserId) async {
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection("users").doc(userId);

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot userSnapshot = await transaction.get(userDoc);

      if (userSnapshot.exists) {
        List<String> chatList =
            List<String>.from(userSnapshot.get("chats") ?? []);
        if (!chatList.contains(chatUserId)) {
          chatList.add(chatUserId);
          transaction.update(userDoc, {"chats": chatList});
        }
      } else {
        transaction.set(userDoc, {
          "chats": [chatUserId]
        });
      }
    });
  }

  // delete chat uid to user collection
  Future<void> removeChatFromUser(String userId, String chatUserId) async {
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection("users").doc(userId);

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot userSnapshot = await transaction.get(userDoc);

      if (userSnapshot.exists) {
        List<String> chatList =
            List<String>.from(userSnapshot.get("chats") ?? []);
        if (chatList.contains(chatUserId)) {
          chatList.remove(chatUserId);
          transaction.update(userDoc, {"chats": chatList});
        }
      }
    });
  }
}
