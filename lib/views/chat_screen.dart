import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/messaging_services.dart';

class ChatScreen extends StatefulWidget {
  final String receiverId;
  ChatScreen({required this.receiverId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final MessagingServices _messagingServices = MessagingServices();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    _syncMessages();
  }

  String getChatId(String user1, String user2) {
    List<String> ids = [user1, user2];
    ids.sort();
    return ids.join("_");
  }

  void _syncMessages() async {
    User? currentUser = _auth.currentUser;
    if (currentUser == null) return;

    List<Map<String, dynamic>> fetchedMessages = await _messagingServices
        .fetchMessages(currentUser.uid, widget.receiverId);

    setState(() {
      messages = fetchedMessages;
    });
  }

  void sendMessage() async {
    String messageText = _messageController.text.trim();
    if (messageText.isEmpty) return;

    User? currentUser = _auth.currentUser;
    if (currentUser == null) return;

    String chatId = getChatId(currentUser.uid, widget.receiverId);

    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'senderId': currentUser.uid,
      'receiverId': widget.receiverId,
      'message': messageText,
      'timestamp': FieldValue.serverTimestamp(),
    });

    await _firestore.collection('chats').doc(chatId).set({
      'user1': currentUser.uid,
      'user2': widget.receiverId,
      'lastMessage': messageText,
      'lastMessageTimestamp': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    _messageController.clear();

    _syncMessages(); // Refresh messages after sending
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat"), backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = messages[index];
                  return ListTile(
                    title: Text(data['message']),
                    subtitle: Text(data['senderId'] == _auth.currentUser!.uid
                        ? "You"
                        : "Friend"),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(hintText: "Type a message"),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
