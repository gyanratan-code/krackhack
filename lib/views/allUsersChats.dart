import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iit_marketing/constants/colors.dart';
import 'package:iit_marketing/views/footer.dart';
import 'chat_screen.dart'; // Import the chat screen

class Chats extends StatefulWidget {
  final String uid;
  const Chats({super.key, required this.uid});

  @override
  State<Chats> createState() => _ChatPageState();
}

class _ChatPageState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    print("⚡ Fetching chats for user UID: ${widget.uid}");

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title:
            const Text("Chats", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/images/i2.png"),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("⏳ Firestore is still loading...");
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || !snapshot.data!.exists) {
                  print("❌ No user document found.");
                  return const Center(child: Text("No chats right now"));
                }

                var userData = snapshot.data!;
                // Extract the chat list from the user document.
                List<dynamic> chatList = userData['chat'] ?? [];

                if (chatList.isEmpty) {
                  print("❌ Chat list is empty.");
                  return const Center(child: Text("No chats right now"));
                }

                return ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    String receiverId = chatList[index];
                    print("🔍 Fetching details for Receiver ID: $receiverId");

                    return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(receiverId)
                          .get(),
                      builder: (context, userSnapshot) {
                        if (userSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (!userSnapshot.hasData ||
                            !userSnapshot.data!.exists) {
                          return const SizedBox();
                        }

                        var receiverData = userSnapshot.data!;
                        String name = receiverData['name'] ?? 'Unknown';
                        String profilePic = receiverData['profilePic'];

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: profilePic.startsWith('http')
                                ? NetworkImage(profilePic)
                                : AssetImage(profilePic) as ImageProvider,
                          ),
                          title: Text(name),
                          subtitle: const Text("Tap to chat"),
                          trailing: const Text(
                              "20:50"), // Placeholder for last message time
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatScreen(receiverId: receiverId),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          const FooterWidget(selectedIndex: 3),
        ],
      ),
    );
  }
}
