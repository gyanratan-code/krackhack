// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:iit_marketing/constants/colors.dart';
// // import 'package:iit_marketing/views/footer.dart';
// // import 'chat_screen.dart'; // Import the chat screen
// //
// // class Chats extends StatefulWidget {
// //   final String uid;
// //   const Chats({super.key, required this.uid});
// //
// //   @override
// //   State<Chats> createState() => _ChatPageState();
// // }
// //
// // class _ChatPageState extends State<Chats> {
// //   @override
// //   Widget build(BuildContext context) {
// //     print("⚡ Fetching chats for user UID: ${widget.uid}");
// //
// //     return Scaffold(
// //       backgroundColor: kBackgroundColor,
// //       appBar: AppBar(
// //         scrolledUnderElevation: 0,
// //         elevation: 0,
// //         backgroundColor: kBackgroundColor,
// //         title:
// //             const Text("Chats", style: TextStyle(fontWeight: FontWeight.bold)),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: StreamBuilder<DocumentSnapshot>(
// //               stream: FirebaseFirestore.instance
// //                   .collection('users')
// //                   .doc(widget.uid)
// //                   .snapshots(),
// //               builder: (context, snapshot) {
// //                 if (snapshot.connectionState == ConnectionState.waiting) {
// //                   print("⏳ Firestore is still loading...");
// //                   return const Center(child: CircularProgressIndicator());
// //                 }
// //
// //                 if (!snapshot.hasData || !snapshot.data!.exists) {
// //                   print("❌ No user document found.");
// //                   return const Center(child: Text("No chats right now"));
// //                 }
// //
// //                 var userData = snapshot.data!;
// //                 // Extract the chat list from the user document.
// //                 List<dynamic> chatList = userData['chat'] ?? [];
// //
// //                 if (chatList.isEmpty) {
// //                   print("❌ Chat list is empty.");
// //                   return const Center(child: Text("No chats right now"));
// //                 }
// //
// //                 return ListView.builder(
// //                   itemCount: chatList.length,
// //                   itemBuilder: (context, index) {
// //                     String receiverId = chatList[index];
// //                     print("🔍 Fetching details for Receiver ID: $receiverId");
// //
// //                     return FutureBuilder<DocumentSnapshot>(
// //                       future: FirebaseFirestore.instance
// //                           .collection('users')
// //                           .doc(receiverId)
// //                           .get(),
// //                       builder: (context, userSnapshot) {
// //                         if (userSnapshot.connectionState ==
// //                             ConnectionState.waiting) {
// //                           return const Center(
// //                               child: CircularProgressIndicator());
// //                         }
// //                         if (!userSnapshot.hasData ||
// //                             !userSnapshot.data!.exists) {
// //                           return const SizedBox();
// //                         }
// //
// //                         var receiverData = userSnapshot.data!;
// //                         String name = receiverData['name'] ?? 'Unknown';
// //                         String profilePic = receiverData['profilePic'];
// //
// //                         return ListTile(
// //                           leading: CircleAvatar(
// //                             backgroundImage: profilePic.startsWith('http')
// //                                 ? NetworkImage(profilePic)
// //                                 : AssetImage(profilePic) as ImageProvider,
// //                           ),
// //                           title: Text(name),
// //                           subtitle: const Text("Tap to chat"),
// //                           trailing: const Text(
// //                               "20:50"), // Placeholder for last message time
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                 builder: (context) =>
// //                                     ChatScreen(receiverId: receiverId),
// //                               ),
// //                             );
// //                           },
// //                         );
// //                       },
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //           const FooterWidget(selectedIndex: 3),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:iit_marketing/constants/colors.dart';
// import 'package:iit_marketing/views/footer.dart';
// import 'chat_screen.dart';
// import 'package:intl/intl.dart'; // For formatting timestamps
//
// class Chats extends StatefulWidget {
//   final String uid;
//   const Chats({super.key, required this.uid});
//
//   @override
//   State<Chats> createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<Chats> {
//   @override
//   Widget build(BuildContext context) {
//     print("⚡ Fetching chats for user UID: ${widget.uid}");
//
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         elevation: 0,
//         backgroundColor: kBackgroundColor,
//         title:
//         const Text("Chats", style: TextStyle(fontWeight: FontWeight.bold)),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<DocumentSnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('users')
//                   .doc(widget.uid)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   print("⏳ Firestore is still loading...");
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 if (!snapshot.hasData || !snapshot.data!.exists) {
//                   print("❌ No user document found.");
//                   return const Center(child: Text("No chats right now"));
//                 }
//
//                 var userData = snapshot.data!;
//                 List<dynamic> chatList = userData['chat'] ?? [];
//
//                 if (chatList.isEmpty) {
//                   print("❌ Chat list is empty.");
//                   return const Center(child: Text("No chats right now"));
//                 }
//
//                 return ListView.builder(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   itemCount: chatList.length,
//                   itemBuilder: (context, index) {
//                     String receiverId = chatList[index];
//                     print("🔍 Fetching details for Receiver ID: $receiverId");
//
//                     return FutureBuilder<DocumentSnapshot>(
//                       future: FirebaseFirestore.instance
//                           .collection('users')
//                           .doc(receiverId)
//                           .get(),
//                       builder: (context, userSnapshot) {
//                         if (userSnapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return const SizedBox(); // Avoid showing a loader here
//                         }
//                         if (!userSnapshot.hasData ||
//                             !userSnapshot.data!.exists) {
//                           return const SizedBox();
//                         }
//
//                         var receiverData = userSnapshot.data!;
//                         String name = receiverData['name'] ?? 'Unknown';
//                         String profilePic = receiverData['profilePic'];
//                         // String lastMessage = receiverData['lastMessage'] ?? "Tap to chat";
//                         // Timestamp? lastMessageTimestamp = receiverData['lastMessageTimestamp'];
//
//                         // Formatting timestamp
//                         // String formattedTime = lastMessageTimestamp != null
//                         //     ? DateFormat('hh:mm a').format(lastMessageTimestamp.toDate())
//                         //     : "";
//
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     ChatScreen(receiverId: receiverId),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(12),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black12,
//                                   blurRadius: 5,
//                                   spreadRadius: 1,
//                                   offset: Offset(0, 2),
//                                 )
//                               ],
//                             ),
//                             child: Row(
//                               children: [
//                                 // Profile Picture
//                                 CircleAvatar(
//                                   radius: 28,
//                                   backgroundImage: profilePic.startsWith('http')
//                                       ? NetworkImage(profilePic)
//                                       : AssetImage(profilePic) as ImageProvider,
//                                   backgroundColor: Colors.transparent,
//                                 ),
//                                 const SizedBox(width: 12),
//
//                                 // Chat Info
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         name,
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Text(
//                                         "lastMessage",
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.grey[600],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 // Timestamp
//                                 Text(
//                                   "formattedTime",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey[500],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
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
import 'chat_screen.dart';
import 'package:intl/intl.dart';

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
        title: const Text("Chats", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .where(Filter.or(
                Filter('user1', isEqualTo: widget.uid),
                Filter('user2', isEqualTo: widget.uid),
              ))
                  .snapshots(),

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("⏳ Firestore is still loading...");
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  print("❌ No chats found.");
                  return const Center(child: Text("No chats right now"));
                }

                var chatDocs = snapshot.data!.docs;

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: chatDocs.length,
                  itemBuilder: (context, index) {
                    var chatData = chatDocs[index];
                    String receiverId = chatData['user2'];
                    String lastMessage = chatData['lastMessage'] ?? "Tap to chat";
                    Timestamp? lastMessageTimestamp = chatData['lastMessageTimestamp'];

                    String formattedTime = lastMessageTimestamp != null
                        ? DateFormat('hh:mm a').format(lastMessageTimestamp.toDate())
                        : "";

                    print("🔍 Fetching details for Receiver ID: $receiverId");

                    return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance.collection('users').doc(receiverId).get(),
                      builder: (context, userSnapshot) {
                        if (userSnapshot.connectionState == ConnectionState.waiting) {
                          return const SizedBox();
                        }
                        if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
                          return const SizedBox();
                        }

                        var receiverData = userSnapshot.data!;
                        String name = receiverData['name'] ?? 'Unknown';
                        String profilePic = receiverData['profilePic'] ?? '';

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(receiverId: receiverId),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage: profilePic.startsWith('http')
                                      ? NetworkImage(profilePic)
                                      : AssetImage(profilePic) as ImageProvider,
                                  backgroundColor: Colors.transparent,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        lastMessage,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  formattedTime,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
