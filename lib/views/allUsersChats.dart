// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:iit_marketing/constants/colors.dart';
// import 'package:iit_marketing/views/footer.dart';
// import 'chat_screen.dart'; // Import the chat screen
//
// class Chats extends StatefulWidget {
//   final String uid; // Pass UID to fetch user's chats
//   const Chats({super.key, required this.uid});
//
//   @override
//   State<Chats> createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<Chats> {
//   @override
//   Widget build(BuildContext context) {
//     print("⚡ Fetching chats for user UID: ${widget.uid}"); // Debug print
//
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         elevation: 0,
//         backgroundColor: kBackgroundColor,
//         title:
//             const Text("Chats", style: TextStyle(fontWeight: FontWeight.bold)),
//         actions: const [
//           CircleAvatar(
//             backgroundColor: Colors.transparent,
//             backgroundImage: AssetImage("assets/images/i2.png"),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('users')
//                   .where('uid',
//                       isEqualTo: widget.uid.toString()) // Ensure it's a string
//                   .limit(1)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 print(
//                     "widget.uid = '${widget.uid}' (type: ${widget.uid.runtimeType})");
//
//                 // ✅ Show loading indicator while fetching data
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   print("⏳ Firestore is still loading...");
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 // ✅ Check if snapshot has data
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   print(
//                       "❌ Firestore Error: No data found for user UID ${widget.uid}");
//                   return const Center(child: Text("No chats available"));
//                 }
//
//                 var userData = snapshot.data!.docs.first;
//                 print("✅ Firestore data found for UID: ${widget.uid}");
//
//                 var chatList = userData['chats'] as List<dynamic>? ?? [];
//                 print("📩 User's Chat List: $chatList");
//
//                 if (chatList.isEmpty) {
//                   return const Center(child: Text("No active chats"));
//                 }
//
//                 return ListView.builder(
//                   itemCount: chatList.length,
//                   itemBuilder: (context, index) {
//                     String receiverId =
//                         chatList[index].toString(); // Ensure string
//                     print("🔍 Fetching details for Receiver ID: $receiverId");
//                     return FutureBuilder<QuerySnapshot>(
//                       future: FirebaseFirestore.instance
//                           .collection('users')
//                           .where('uid', isEqualTo: receiverId.toString())
//                           .limit(1)
//                           .get(),
//                       builder: (context, userSnapshot) {
//                         if (userSnapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           print("⏳ Firestore is still loading...");
//                           return const Center(
//                               child: CircularProgressIndicator());
//                         }
//                         if (!userSnapshot.hasData ||
//                             userSnapshot.data!.docs.isEmpty) {
//                           print(
//                               "❌ No user data found for Receiver ID $receiverId");
//                           return const SizedBox();
//                         }
//
//                         var receiverData = userSnapshot.data!.docs.first;
//                         String name = receiverData['name'] ?? 'Unknown';
//                         String profilePic = receiverData['profilePic'] ??
//                             'assets/images/i1.png';
//
//                         print("✅ Found user: $name (Receiver ID: $receiverId)");
//
//                         return ListTile(
//                           leading: CircleAvatar(
//                             backgroundImage: NetworkImage(profilePic),
//                           ),
//                           title: Text(name),
//                           subtitle: const Text("Tap to chat"),
//                           trailing: const Text(
//                               "20:50"), // Placeholder for last message time
//                           onTap: () {
//                             print(
//                                 "📲 Navigating to ChatScreen with Receiver ID: $receiverId");
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     ChatScreen(receiverId: receiverId),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           const FooterWidget(selectedIndex: 3),
//         ],
//       ),
//     );
//   }
// }


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
    print("⚡ Fetching chats for user UID: ${widget.uid}"); // Debug print

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: const Text("Chats", style: TextStyle(fontWeight: FontWeight.bold)),
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
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.uid) // Reference the document directly
                  .collection('chats') // Access the 'chats' collection
                  .snapshots(),
              builder: (context, snapshot) {
                print("widget.uid = '${widget.uid}' (type: ${widget.uid.runtimeType})");

                // ✅ Show loading indicator while fetching data
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("⏳ Firestore is still loading...");
                  return const Center(child: CircularProgressIndicator());
                }

                // ✅ If no chat documents exist, show "No chats right now"
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  print("❌ No chat documents found.");
                  return const Center(child: Text("No chats right now"));
                }

                var chatDocs = snapshot.data!.docs;
                print("📩 Found ${chatDocs.length} chat documents");

                return ListView.builder(
                  itemCount: chatDocs.length,
                  itemBuilder: (context, index) {
                    String receiverId = chatDocs[index].id; // Each chat doc ID is the receiver's UID
                    print("🔍 Fetching details for Receiver ID: $receiverId");

                    return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance.collection('users').doc(receiverId).get(),
                      builder: (context, userSnapshot) {
                        if (userSnapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
                          return const SizedBox();
                        }

                        var receiverData = userSnapshot.data!;
                        String name = receiverData['name'] ?? 'Unknown';
                        String profilePic = receiverData['profilePic'] ?? 'assets/images/i1.png';

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(profilePic),
                          ),
                          title: Text(name),
                          subtitle: const Text("Tap to chat"),
                          trailing: const Text("20:50"), // Placeholder for last message time
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(receiverId: receiverId),
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
