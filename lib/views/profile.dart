// // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:iit_marketing/views/footer.dart';
// // // // // // // // //
// // // // // // // // // class ProfilePage extends StatefulWidget {
// // // // // // // // //   final String userId; // Accept userId when navigating
// // // // // // // // //
// // // // // // // // //   const ProfilePage({super.key, required this.userId});
// // // // // // // // //
// // // // // // // // //   @override
// // // // // // // // //   _ProfilePageState createState() => _ProfilePageState();
// // // // // // // // // }
// // // // // // // // //
// // // // // // // // // class _ProfilePageState extends State<ProfilePage> {
// // // // // // // // //   late String loggedInUserId;
// // // // // // // // //   bool isCurrentUser = false;
// // // // // // // // //
// // // // // // // // //   @override
// // // // // // // // //   void initState() {
// // // // // // // // //     super.initState();
// // // // // // // // //     loggedInUserId = FirebaseAuth.instance.currentUser!.uid;
// // // // // // // // //   }
// // // // // // // // //
// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return Scaffold(
// // // // // // // // //       backgroundColor: Colors.white,
// // // // // // // // //       body: Column(
// // // // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //         children: [
// // // // // // // // //           Padding(
// // // // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// // // // // // // // //             // child: const Head(), // Keeps header aligned properly
// // // // // // // // //           ),
// // // // // // // // //           Expanded(
// // // // // // // // //             child: StreamBuilder<DocumentSnapshot>(
// // // // // // // // //               stream: FirebaseFirestore.instance.collection("users").doc(widget.userId).snapshots(),
// // // // // // // // //               builder: (context, snapshot) {
// // // // // // // // //                 if (!snapshot.hasData) {
// // // // // // // // //                   return const Center(child: CircularProgressIndicator());
// // // // // // // // //                 }
// // // // // // // // //
// // // // // // // // //                 var userData = snapshot.data!.data() as Map<String, dynamic>?;
// // // // // // // // //
// // // // // // // // //                 if (userData == null) {
// // // // // // // // //                   return const Center(child: Text("User not found"));
// // // // // // // // //                 }
// // // // // // // // //
// // // // // // // // //                 isCurrentUser = loggedInUserId == widget.userId;
// // // // // // // // //
// // // // // // // // //                 return NestedScrollView(
// // // // // // // // //                   headerSliverBuilder: (context, innerBoxIsScrolled) {
// // // // // // // // //                     return [
// // // // // // // // //                       SliverToBoxAdapter(child: _buildProfileHeader(userData)),
// // // // // // // // //                       SliverPersistentHeader(
// // // // // // // // //                         pinned: true,
// // // // // // // // //                         delegate: _StickyHeaderDelegate(
// // // // // // // // //                           child: _buildStickyButtons(),
// // // // // // // // //                           height: 50,
// // // // // // // // //                         ),
// // // // // // // // //                       ),
// // // // // // // // //                       SliverToBoxAdapter(child: _buildTabBar()),
// // // // // // // // //                     ];
// // // // // // // // //                   },
// // // // // // // // //                   body: _buildUserNewsList(), // ✅ Fetches news of that user
// // // // // // // // //                 );
// // // // // // // // //               },
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //
// // // // // // // // //       bottomNavigationBar: const FooterWidget(selectedIndex: 4),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // //   Widget _buildProfileHeaderMain(){
// // // // // // // // //     return IconButton(
// // // // // // // // //       icon: const Icon(Icons.arrow_back),
// // // // // // // // //       onPressed: () {
// // // // // // // // //         Navigator.pop(context); // Go back to the previous page
// // // // // // // // //       },
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // //   Widget _buildProfileHeader(Map<String, dynamic> userData) {
// // // // // // // // //     return Padding(
// // // // // // // // //       padding: const EdgeInsets.only(top: 8.0, bottom: 16.0, left: 8, right: 8),
// // // // // // // // //       child: Column(
// // // // // // // // //         crossAxisAlignment: CrossAxisAlignment.center,
// // // // // // // // //         children: [
// // // // // // // // //           CircleAvatar(
// // // // // // // // //             radius: 40,
// // // // // // // // //             backgroundImage: userData["profile_pic"] != null && userData["profile_pic"].isNotEmpty
// // // // // // // // //                 ? NetworkImage(userData["profile_pic"])
// // // // // // // // //                 : const AssetImage("assets/images/news3.png") as ImageProvider,
// // // // // // // // //           ),
// // // // // // // // //           const SizedBox(height: 8),
// // // // // // // // //           Text(
// // // // // // // // //             userData["username"] ?? "Unknown User",
// // // // // // // // //             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // // // // // //           ),
// // // // // // // // //           const SizedBox(height: 8),
// // // // // // // // //           Row(
// // // // // // // // //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // // // //             children: [
// // // // // // // // //               _buildStatColumn(userData["nNews"]?.toString() ?? "0", "Posts"),
// // // // // // // // //               _buildStatColumn(userData["nfollowers"]?.toString() ?? "0", "Followers"),
// // // // // // // // //               _buildStatColumn(userData["nfollowings"]?.toString() ?? "0", "Following"),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //           const SizedBox(height: 10),
// // // // // // // // //           Text(
// // // // // // // // //             userData["bio"] ?? "No bio available",
// // // // // // // // //             textAlign: TextAlign.center,
// // // // // // // // //             style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w700),
// // // // // // // // //           ),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // //
// // // // // // // // //   Widget _buildStickyButtons() {
// // // // // // // // //     return Container(
// // // // // // // // //       color: Colors.white,
// // // // // // // // //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
// // // // // // // // //       child: Row(
// // // // // // // // //         children: [
// // // // // // // // //           Expanded(
// // // // // // // // //             child: _buildProfileButton(
// // // // // // // // //               isCurrentUser ? "Edit Profile" : "Follow",
// // // // // // // // //               isCurrentUser ? Colors.grey.shade200 : Colors.black,
// // // // // // // // //               isCurrentUser ? Colors.black : Colors.white,
// // // // // // // // //               isCurrentUser ? 1 : 2,
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // //
// // // // // // // // //   Widget _buildStatColumn(String count, String label) {
// // // // // // // // //     return Column(
// // // // // // // // //       children: [
// // // // // // // // //         Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // // // // // // // //         const SizedBox(height: 2),
// // // // // // // // //         Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
// // // // // // // // //       ],
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // //
// // // // // // // // //   Widget _buildProfileButton(String text, Color bgColor, Color textColor, int num) {
// // // // // // // // //     return ElevatedButton(
// // // // // // // // //       onPressed: () {
// // // // // // // // //         if (num == 1) {
// // // // // // // // //           Navigator.pushNamed(context, "/edit_profile");
// // // // // // // // //         }
// // // // // // // // //       },
// // // // // // // // //       style: ElevatedButton.styleFrom(
// // // // // // // // //         backgroundColor: bgColor,
// // // // // // // // //         foregroundColor: textColor,
// // // // // // // // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// // // // // // // // //         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
// // // // // // // // //       ),
// // // // // // // // //       child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // //
// // // // // // // // //   // Widget _buildTabBar() {
// // // // // // // // //   //   return Column(
// // // // // // // // //   //     children: [
// // // // // // // // //   //       Row(
// // // // // // // // //   //         mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // //   //         children: [
// // // // // // // // //   //           Expanded(
// // // // // // // // //   //             child: GestureDetector(
// // // // // // // // //   //               onTap: () {},
// // // // // // // // //   //               child: const Padding(
// // // // // // // // //   //                 padding: EdgeInsets.symmetric(vertical: 8.0),
// // // // // // // // //   //                 child: Column(
// // // // // // // // //   //                   children: [
// // // // // // // // //   //                     Icon(Icons.grid_on, size: 28, color: Colors.black),
// // // // // // // // //   //                   ],
// // // // // // // // //   //                 ),
// // // // // // // // //   //               ),
// // // // // // // // //   //             ),
// // // // // // // // //   //           ),
// // // // // // // // //   //           Expanded(
// // // // // // // // //   //             child: GestureDetector(
// // // // // // // // //   //               onTap: () {},
// // // // // // // // //   //               child: const Column(
// // // // // // // // //   //                 children: [
// // // // // // // // //   //                   Icon(Icons.person_pin, size: 28, color: Colors.black),
// // // // // // // // //   //                 ],
// // // // // // // // //   //               ),
// // // // // // // // //   //             ),
// // // // // // // // //   //           ),
// // // // // // // // //   //         ],
// // // // // // // // //   //       ),
// // // // // // // // //   //       const SizedBox(height: 12),
// // // // // // // // //   //     ],
// // // // // // // // //   //   );
// // // // // // // // //   // }
// // // // // // // // //   int selectedTab = 0; // 0 = Grid, 1 = ProfilePin
// // // // // // // // //
// // // // // // // // //   Widget _buildTabBar() {
// // // // // // // // //     double screenWidth = MediaQuery.of(context).size.width;
// // // // // // // // //
// // // // // // // // //     return Column(
// // // // // // // // //       children: [
// // // // // // // // //         Stack(
// // // // // // // // //           children: [
// // // // // // // // //             // Icons Row
// // // // // // // // //             Row(
// // // // // // // // //               mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // //               children: [
// // // // // // // // //                 Expanded(
// // // // // // // // //                   child: GestureDetector(
// // // // // // // // //                     onTap: () {
// // // // // // // // //                       setState(() {
// // // // // // // // //                         selectedTab = 0;
// // // // // // // // //                       });
// // // // // // // // //                     },
// // // // // // // // //                     child: Column(
// // // // // // // // //                       children: [
// // // // // // // // //                         Icon(Icons.grid_on, size: 28, color: selectedTab == 0 ? Colors.black : Colors.grey),
// // // // // // // // //                         const SizedBox(height: 6), // Space between icon & underline
// // // // // // // // //                       ],
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //                 Expanded(
// // // // // // // // //                   child: GestureDetector(
// // // // // // // // //                     onTap: () {
// // // // // // // // //                       setState(() {
// // // // // // // // //                         selectedTab = 1;
// // // // // // // // //                       });
// // // // // // // // //                     },
// // // // // // // // //                     child: Column(
// // // // // // // // //                       children: [
// // // // // // // // //                         Icon(Icons.person_pin, size: 28, color: selectedTab == 1 ? Colors.black : Colors.grey),
// // // // // // // // //                         const SizedBox(height: 6), // Space between icon & underline
// // // // // // // // //                       ],
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //               ],
// // // // // // // // //             ),
// // // // // // // // //
// // // // // // // // //             // Underline Animation (with spacing)
// // // // // // // // //             Positioned(
// // // // // // // // //               bottom: -2, // Moves underline down slightly
// // // // // // // // //               child: AnimatedContainer(
// // // // // // // // //                 duration: const Duration(milliseconds: 250),
// // // // // // // // //                 curve: Curves.easeInOut,
// // // // // // // // //                 width: screenWidth / 2, // Half the screen width
// // // // // // // // //                 height: 3, // Underline height
// // // // // // // // //                 color: Colors.black,
// // // // // // // // //                 transform: Matrix4.translationValues(selectedTab * (screenWidth / 2), 0, 0), // Move underline
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //           ],
// // // // // // // // //         ),
// // // // // // // // //         const SizedBox(height: 12),
// // // // // // // // //       ],
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // //
// // // // // // // // //   // ✅ Fetch and display user's news
// // // // // // // // //   // Widget _buildUserNewsList() {
// // // // // // // // //   //   return StreamBuilder<QuerySnapshot>(
// // // // // // // // //   //     stream: FirebaseFirestore.instance
// // // // // // // // //   //         .collection("users")
// // // // // // // // //   //         .doc(widget.userId)
// // // // // // // // //   //         .collection("news")
// // // // // // // // //   //         .orderBy("timestamp", descending: true)
// // // // // // // // //   //         .snapshots(),
// // // // // // // // //   //     builder: (context, snapshot) {
// // // // // // // // //   //       if (!snapshot.hasData) {
// // // // // // // // //   //         return const Center(child: CircularProgressIndicator());
// // // // // // // // //   //       }
// // // // // // // // //   //
// // // // // // // // //   //       var newsDocs = snapshot.data!.docs;
// // // // // // // // //   //
// // // // // // // // //   //       if (newsDocs.isEmpty) {
// // // // // // // // //   //         return const Center(child: Text("No news posted yet"));
// // // // // // // // //   //       }
// // // // // // // // //   //
// // // // // // // // //   //       return ListView.builder(
// // // // // // // // //   //         padding: EdgeInsets.zero,
// // // // // // // // //   //         itemCount: newsDocs.length,
// // // // // // // // //   //         itemBuilder: (context, index) {
// // // // // // // // //   //           var newsData = newsDocs[index].data() as Map<String, dynamic>;
// // // // // // // // //   //
// // // // // // // // //   //           return _buildNewsItem(newsData);
// // // // // // // // //   //         },
// // // // // // // // //   //       );
// // // // // // // // //   //     },
// // // // // // // // //   //   );
// // // // // // // // //   // }
// // // // // // // // //   Widget _buildUserNewsList() {
// // // // // // // // //     return StreamBuilder<QuerySnapshot>(
// // // // // // // // //       stream: FirebaseFirestore.instance
// // // // // // // // //           .collection("users")
// // // // // // // // //           .doc(widget.userId)
// // // // // // // // //           .collection("news")
// // // // // // // // //           .orderBy("timestamp", descending: true)
// // // // // // // // //           .snapshots(),
// // // // // // // // //       builder: (context, snapshot) {
// // // // // // // // //         if (!snapshot.hasData) {
// // // // // // // // //           return const Center(child: CircularProgressIndicator());
// // // // // // // // //         }
// // // // // // // // //
// // // // // // // // //         var newsDocs = snapshot.data!.docs;
// // // // // // // // //
// // // // // // // // //         if (newsDocs.isEmpty) {
// // // // // // // // //           return const Center(child: Text("No news posted yet"));
// // // // // // // // //         }
// // // // // // // // //
// // // // // // // // //         return ListView.builder(
// // // // // // // // //           padding: EdgeInsets.zero,
// // // // // // // // //           itemCount: newsDocs.length,
// // // // // // // // //           itemBuilder: (context, index) {
// // // // // // // // //             var newsDoc = newsDocs[index]; // Firestore document
// // // // // // // // //             var newsData = newsDoc.data() as Map<String, dynamic>;
// // // // // // // // //             String newsId = newsDoc.id; // ✅ Get news ID
// // // // // // // // //
// // // // // // // // //             // return _buildNewsItem(newsData, newsId);
// // // // // // // // //           },
// // // // // // // // //         );
// // // // // // // // //       },
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // //
// // // // // // // // //   // Widget _buildNewsItem(Map<String, dynamic> newsData) {
// // // // // // // // //   //   return Container(
// // // // // // // // //   //     margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
// // // // // // // // //   //     padding: const EdgeInsets.all(8),
// // // // // // // // //   //     decoration: BoxDecoration(
// // // // // // // // //   //       color: Colors.grey.shade200,
// // // // // // // // //   //       borderRadius: BorderRadius.circular(12),
// // // // // // // // //   //     ),
// // // // // // // // //   //     child: Column(
// // // // // // // // //   //       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //   //       children: [
// // // // // // // // //   //         ClipRRect(
// // // // // // // // //   //           borderRadius: BorderRadius.circular(10),
// // // // // // // // //   //           child: newsData["imageUrl"] != null && newsData["imageUrl"].isNotEmpty
// // // // // // // // //   //               ? Image.network(
// // // // // // // // //   //             newsData["imageUrl"],
// // // // // // // // //   //             width: double.infinity,
// // // // // // // // //   //             height: 180,
// // // // // // // // //   //             fit: BoxFit.cover,
// // // // // // // // //   //           )
// // // // // // // // //   //               : Image.asset(
// // // // // // // // //   //             "assets/images/news1.png",
// // // // // // // // //   //             width: double.infinity,
// // // // // // // // //   //             height: 180,
// // // // // // // // //   //             fit: BoxFit.cover,
// // // // // // // // //   //           ),
// // // // // // // // //   //         ),
// // // // // // // // //   //         const SizedBox(height: 8),
// // // // // // // // //   //         Text(
// // // // // // // // //   //           newsData["title"] ?? "Untitled",
// // // // // // // // //   //           maxLines: 1,
// // // // // // // // //   //           overflow: TextOverflow.ellipsis,
// // // // // // // // //   //           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // // // // // // //   //         ),
// // // // // // // // //   //       ],
// // // // // // // // //   //     ),
// // // // // // // // //   //   );
// // // // // // // // //   // }
// // // // // // // // //
// // // // // // // // //   // Widget _buildNewsItem(Map<String, dynamic> newsData, String newsId) {
// // // // // // // // //   //   return GestureDetector(
// // // // // // // // //   //     onTap: () {
// // // // // // // // //   //       // Navigate to NewsDetailPage with newsId and userId
// // // // // // // // //   //       Navigator.push(
// // // // // // // // //   //         context,
// // // // // // // // //   //         MaterialPageRoute(
// // // // // // // // //   //           builder: (context) => NewsDetail(
// // // // // // // // //   //             newsId: newsId,
// // // // // // // // //   //             userId: widget.userId, // The profile owner
// // // // // // // // //   //           ),
// // // // // // // // //   //         ),
// // // // // // // // //   //       );
// // // // // // // // //   //     },
// // // // // // // // //   //     child: Container(
// // // // // // // // //   //       margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
// // // // // // // // //   //       padding: const EdgeInsets.all(8),
// // // // // // // // //   //       decoration: BoxDecoration(
// // // // // // // // //   //         color: Colors.grey.shade200,
// // // // // // // // //   //         borderRadius: BorderRadius.circular(12),
// // // // // // // // //   //       ),
// // // // // // // // //   //       child: Column(
// // // // // // // // //   //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //   //         children: [
// // // // // // // // //   //           // ✅ News Image (Clickable)
// // // // // // // // //   //           ClipRRect(
// // // // // // // // //   //             borderRadius: BorderRadius.circular(10),
// // // // // // // // //   //             child: newsData["imageUrl"] != null && newsData["imageUrl"].isNotEmpty
// // // // // // // // //   //                 ? Image.network(
// // // // // // // // //   //               newsData["imageUrl"],
// // // // // // // // //   //               width: double.infinity,
// // // // // // // // //   //               height: 180,
// // // // // // // // //   //               fit: BoxFit.cover,
// // // // // // // // //   //             )
// // // // // // // // //   //                 : Image.asset(
// // // // // // // // //   //               "assets/images/news1.png",
// // // // // // // // //   //               width: double.infinity,
// // // // // // // // //   //               height: 180,
// // // // // // // // //   //               fit: BoxFit.cover,
// // // // // // // // //   //             ),
// // // // // // // // //   //           ),
// // // // // // // // //   //           const SizedBox(height: 8),
// // // // // // // // //   //           // ✅ News Title (Clickable)
// // // // // // // // //   //           Text(
// // // // // // // // //   //             newsData["title"] ?? "Untitled",
// // // // // // // // //   //             maxLines: 1,
// // // // // // // // //   //             overflow: TextOverflow.ellipsis,
// // // // // // // // //   //             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // // // // // // //   //           ),
// // // // // // // // //   //         ],
// // // // // // // // //   //       ),
// // // // // // // // //   //     ),
// // // // // // // // //   //   );
// // // // // // // // //   // }
// // // // // // // // //
// // // // // // // // // }
// // // // // // // // //
// // // // // // // // // class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
// // // // // // // // //   final Widget child;
// // // // // // // // //   final double height;
// // // // // // // // //
// // // // // // // // //   _StickyHeaderDelegate({required this.child, required this.height});
// // // // // // // // //
// // // // // // // // //   @override
// // // // // // // // //   double get minExtent => height;
// // // // // // // // //   @override
// // // // // // // // //   double get maxExtent => height;
// // // // // // // // //   @override
// // // // // // // // //   bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) => false;
// // // // // // // // //
// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
// // // // // // // // //     return child;
// // // // // // // // //   }
// // // // // // // // // }
// // // // // // // //
// // // // // // // //
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // //
// // // // // // // // class ProfilePage extends StatelessWidget {
// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Scaffold(
// // // // // // // //       appBar: AppBar(
// // // // // // // //         title: Text("yourbrandname", style: TextStyle(fontWeight: FontWeight.bold)),
// // // // // // // //         actions: [
// // // // // // // //           IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //       body: SingleChildScrollView(
// // // // // // // //         child: Column(
// // // // // // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // // // // // //           children: [
// // // // // // // //             // Profile Header
// // // // // // // //             Padding(
// // // // // // // //               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // // // // // //               child: Row(
// // // // // // // //                 children: [
// // // // // // // //                   CircleAvatar(
// // // // // // // //                     radius: 40,
// // // // // // // //                     backgroundColor: Colors.grey.shade300,
// // // // // // // //                     child: Icon(Icons.person, size: 40, color: Colors.white),
// // // // // // // //                   ),
// // // // // // // //                   SizedBox(width: 16),
// // // // // // // //                   Expanded(
// // // // // // // //                     child: Column(
// // // // // // // //                       children: [
// // // // // // // //                         Row(
// // // // // // // //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // // //                           children: [
// // // // // // // //                             profileStat("212", "Posts"),
// // // // // // // //                             profileStat("14.2K", "Followers"),
// // // // // // // //                             profileStat("88", "Following"),
// // // // // // // //                           ],
// // // // // // // //                         ),
// // // // // // // //                         SizedBox(height: 10),
// // // // // // // //                         Row(
// // // // // // // //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // // //                           children: [
// // // // // // // //                             ElevatedButton(onPressed: () {}, child: Text("Follow")),
// // // // // // // //                             OutlinedButton(onPressed: () {}, child: Text("Message")),
// // // // // // // //                             IconButton(icon: Icon(Icons.share), onPressed: () {}),
// // // // // // // //                           ],
// // // // // // // //                         ),
// // // // // // // //                       ],
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //                 ],
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //
// // // // // // // //             // Bio Section
// // // // // // // //             Padding(
// // // // // // // //               padding: EdgeInsets.symmetric(horizontal: 16),
// // // // // // // //               child: Column(
// // // // // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //                 children: [
// // // // // // // //                   Text(
// // // // // // // //                     "Your Brand Name",
// // // // // // // //                     style: TextStyle(fontWeight: FontWeight.bold),
// // // // // // // //                   ),
// // // // // // // //                   Text("🌟 A short bio to describe your brand"),
// // // // // // // //                   Text("📌 Emojis are supported"),
// // // // // // // //                   InkWell(
// // // // // // // //                     onTap: () {},
// // // // // // // //                     child: Text(
// // // // // // // //                       "yourbrandwebsite.com",
// // // // // // // //                       style: TextStyle(color: Colors.blue),
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //                 ],
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //
// // // // // // // //             SizedBox(height: 10),
// // // // // // // //
// // // // // // // //             // Highlights
// // // // // // // //             Container(
// // // // // // // //               height: 90,
// // // // // // // //               child: ListView(
// // // // // // // //                 scrollDirection: Axis.horizontal,
// // // // // // // //                 padding: EdgeInsets.symmetric(horizontal: 16),
// // // // // // // //                 children: List.generate(
// // // // // // // //                   6,
// // // // // // // //                       (index) => Padding(
// // // // // // // //                     padding: EdgeInsets.symmetric(horizontal: 8),
// // // // // // // //                     child: Column(
// // // // // // // //                       children: [
// // // // // // // //                         CircleAvatar(
// // // // // // // //                           radius: 30,
// // // // // // // //                           backgroundColor: Colors.grey.shade300,
// // // // // // // //                           child: Icon(Icons.add, size: 30, color: Colors.white),
// // // // // // // //                         ),
// // // // // // // //                         SizedBox(height: 5),
// // // // // // // //                         Text("Highlight", style: TextStyle(fontSize: 12)),
// // // // // // // //                       ],
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //
// // // // // // // //             Divider(),
// // // // // // // //
// // // // // // // //             // Posts Grid
// // // // // // // //             GridView.builder(
// // // // // // // //               shrinkWrap: true,
// // // // // // // //               physics: NeverScrollableScrollPhysics(),
// // // // // // // //               padding: EdgeInsets.all(2),
// // // // // // // //               itemCount: 24,
// // // // // // // //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // // // // // // //                 crossAxisCount: 3,
// // // // // // // //                 crossAxisSpacing: 2,
// // // // // // // //                 mainAxisSpacing: 2,
// // // // // // // //               ),
// // // // // // // //               itemBuilder: (context, index) {
// // // // // // // //                 return Container(
// // // // // // // //                   color: Colors.grey.shade300,
// // // // // // // //                   child: Icon(Icons.image, color: Colors.white),
// // // // // // // //                 );
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //           ],
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // //
// // // // // // // //   Widget profileStat(String count, String label) {
// // // // // // // //     return Column(
// // // // // // // //       children: [
// // // // // // // //         Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
// // // // // // // //         Text(label, style: TextStyle(color: Colors.grey)),
// // // // // // // //       ],
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }
// // // // // // //
// // // // // // //
// // // // // // // import 'package:flutter/material.dart';
// // // // // // //
// // // // // // // class ProfilePage extends StatefulWidget {
// // // // // // //   @override
// // // // // // //   _ProfilePageState createState() => _ProfilePageState();
// // // // // // // }
// // // // // // //
// // // // // // // class _ProfilePageState extends State<ProfilePage> {
// // // // // // //   bool isBuySelected = true; // Tracks the selected tab
// // // // // // //
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       appBar: AppBar(
// // // // // // //         actions: [
// // // // // // //           IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       body: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.center,
// // // // // // //         children: [
// // // // // // //           // Profile Header
// // // // // // //           Padding(
// // // // // // //             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // // // // //             child: Row(
// // // // // // //               children: [
// // // // // // //                 CircleAvatar(
// // // // // // //                   radius: 40,
// // // // // // //                   backgroundColor: Colors.grey.shade300,
// // // // // // //                   child: Icon(Icons.person, size: 40, color: Colors.white),
// // // // // // //                 ),
// // // // // // //                 SizedBox(width: 16),
// // // // // // //                 Expanded(
// // // // // // //                   child: Column(
// // // // // // //                     children: [
// // // // // // //                       Row(
// // // // // // //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // //                         children: [
// // // // // // //                           profileStat("212", "Posts"),
// // // // // // //                           profileStat("14.2K", "Followers"),
// // // // // // //                           profileStat("88", "Following"),
// // // // // // //                         ],
// // // // // // //                       ),
// // // // // // //                       SizedBox(height: 10),
// // // // // // //                       // Follow Button (Full width, black, shorter height)
// // // // // // //                       SizedBox(
// // // // // // //                         width: double.infinity,
// // // // // // //                         child: ElevatedButton(
// // // // // // //                           onPressed: () {},
// // // // // // //                           style: ElevatedButton.styleFrom(
// // // // // // //                             padding: EdgeInsets.symmetric(vertical: 10), // Shorter height
// // // // // // //                             shape: RoundedRectangleBorder(
// // // // // // //                               borderRadius: BorderRadius.circular(6),
// // // // // // //                             ),
// // // // // // //                             backgroundColor: Colors.black, // Black color
// // // // // // //                           ),
// // // // // // //                           child: Text(
// // // // // // //                             "Follow",
// // // // // // //                             style: TextStyle(fontSize: 16, color: Colors.white),
// // // // // // //                           ),
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                     ],
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //
// // // // // // //           // Bio Section
// // // // // // //           Padding(
// // // // // // //             padding: EdgeInsets.symmetric(horizontal: 16),
// // // // // // //             child: Column(
// // // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //               children: [
// // // // // // //                 Text(
// // // // // // //                   "Your Brand Name",
// // // // // // //                   style: TextStyle(fontWeight: FontWeight.bold),
// // // // // // //                 ),
// // // // // // //                 Text("🌟 A short bio to describe your brand"),
// // // // // // //                 Text("📌 Emojis are supported"),
// // // // // // //                 InkWell(
// // // // // // //                   onTap: () {},
// // // // // // //                   child: Text(
// // // // // // //                     "yourbrandwebsite.com",
// // // // // // //                     style: TextStyle(color: Colors.blue),
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //
// // // // // // //           SizedBox(height: 16), // Added padding before Buy/Sell toggle
// // // // // // //
// // // // // // //           // Buy & Sell Toggle
// // // // // // //           Row(
// // // // // // //             children: [
// // // // // // //               Expanded(
// // // // // // //                 child: GestureDetector(
// // // // // // //                   onTap: () {
// // // // // // //                     setState(() {
// // // // // // //                       isBuySelected = true;
// // // // // // //                     });
// // // // // // //                   },
// // // // // // //                   child: Column(
// // // // // // //                     children: [
// // // // // // //                       Text("Buy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // // // // //                       SizedBox(height: 6), // Added padding before underline
// // // // // // //                       Container(
// // // // // // //                         height: 3,
// // // // // // //                         width: MediaQuery.of(context).size.width / 2,
// // // // // // //                         color: isBuySelected ? Colors.black : Colors.transparent,
// // // // // // //                       ),
// // // // // // //                     ],
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               Expanded(
// // // // // // //                 child: GestureDetector(
// // // // // // //                   onTap: () {
// // // // // // //                     setState(() {
// // // // // // //                       isBuySelected = false;
// // // // // // //                     });
// // // // // // //                   },
// // // // // // //                   child: Column(
// // // // // // //                     children: [
// // // // // // //                       Text("Sell", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // // // // //                       SizedBox(height: 6), // Added padding before underline
// // // // // // //                       Container(
// // // // // // //                         height: 3,
// // // // // // //                         width: MediaQuery.of(context).size.width / 2,
// // // // // // //                         color: !isBuySelected ? Colors.black : Colors.transparent,
// // // // // // //                       ),
// // // // // // //                     ],
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //
// // // // // // //           Divider(),
// // // // // // //
// // // // // // //           // Posts Grid
// // // // // // //           Expanded(
// // // // // // //             child: GridView.builder(
// // // // // // //               padding: EdgeInsets.all(2),
// // // // // // //               itemCount: 9,
// // // // // // //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // // // // // //                 crossAxisCount: 3,
// // // // // // //                 crossAxisSpacing: 2,
// // // // // // //                 mainAxisSpacing: 2,
// // // // // // //               ),
// // // // // // //               itemBuilder: (context, index) {
// // // // // // //                 return Container(
// // // // // // //                   color: Colors.grey.shade300,
// // // // // // //                   child: Icon(Icons.image, color: Colors.white),
// // // // // // //                 );
// // // // // // //               },
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // //
// // // // // // //   Widget profileStat(String count, String label) {
// // // // // // //     return Column(
// // // // // // //       children: [
// // // // // // //         Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
// // // // // // //         Text(label, style: TextStyle(color: Colors.grey)),
// // // // // // //       ],
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // //
// // // // // //
// // // // // // import 'package:flutter/material.dart';
// // // // // //
// // // // // // class ProfilePage extends StatefulWidget {
// // // // // //   @override
// // // // // //   _ProfilePageState createState() => _ProfilePageState();
// // // // // // }
// // // // // //
// // // // // // class _ProfilePageState extends State<ProfilePage> {
// // // // // //   bool isBuySelected = true; // Tracks selected tab
// // // // // //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         actions: [
// // // // // //           IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
// // // // // //         ],
// // // // // //       ),
// // // // // //       body: Column(
// // // // // //         crossAxisAlignment: CrossAxisAlignment.center,
// // // // // //         children: [
// // // // // //           // Profile Header
// // // // // //           Padding(
// // // // // //             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // // // // //             child: Column(
// // // // // //               mainAxisAlignment: MainAxisAlignment.center,
// // // // // //               children: [
// // // // // //                 CircleAvatar(
// // // // // //                   radius: 40,
// // // // // //                   backgroundImage: AssetImage("assets/images/i3.png"),
// // // // // //                 ),
// // // // // //                 SizedBox(width: 16),
// // // // // //                 Expanded(
// // // // // //                   child: Column(
// // // // // //                     children: [
// // // // // //                       Row(
// // // // // //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // //                         children: [
// // // // // //                           profileStat("2", "Pending"),
// // // // // //                           profileStat("4", "buys"),
// // // // // //                           profileStat("3", "Sells"),
// // // // // //                         ],
// // // // // //                       ),
// // // // // //                       SizedBox(height: 10),
// // // // // //                       // Follow Button
// // // // // //                       SizedBox(
// // // // // //                         width: double.infinity,
// // // // // //                         // child: ElevatedButton(
// // // // // //                         //   onPressed: () {},
// // // // // //                         //   style: ElevatedButton.styleFrom(
// // // // // //                         //     padding: EdgeInsets.symmetric(vertical: 8),
// // // // // //                         //     shape: RoundedRectangleBorder(
// // // // // //                         //       borderRadius: BorderRadius.circular(8),
// // // // // //                         //     ),
// // // // // //                         //     backgroundColor: Colors.black,
// // // // // //                         //   ),
// // // // // //                         //   child: Text("Follow", style: TextStyle(fontSize: 16, color: Colors.white)),
// // // // // //                         // ),
// // // // // //                       ),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //
// // // // // //           // Bio Section
// // // // // //           Padding(
// // // // // //             padding: EdgeInsets.symmetric(horizontal: 1),
// // // // // //             child: Column(
// // // // // //               crossAxisAlignment: CrossAxisAlignment.center,
// // // // // //               // mainAxisAlignment: MainAxisAlignment.start,
// // // // // //               children: [
// // // // // //                 Text("Naman Shah(B23218)", style: TextStyle(fontWeight: FontWeight.bold)),
// // // // // //                 Text("🌟 A short bio to describe yourself"),
// // // // // //                 Text("📌 Emojis are supported"),
// // // // // //                 InkWell(
// // // // // //                   onTap: () {},
// // // // // //                   child: Text(
// // // // // //                     "yourbrandwebsite.com",
// // // // // //                     style: TextStyle(color: Colors.blue),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //
// // // // // //           SizedBox(height: 10),
// // // // // //
// // // // // //           // Buy & Sell Toggle
// // // // // //           Row(
// // // // // //             children: [
// // // // // //               Expanded(
// // // // // //                 child: GestureDetector(
// // // // // //                   onTap: () {
// // // // // //                     setState(() {
// // // // // //                       isBuySelected = true;
// // // // // //                     });
// // // // // //                   },
// // // // // //                   child: Column(
// // // // // //                     children: [
// // // // // //                       Text("Buy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // // // //                       SizedBox(height: 8), // Padding before underline
// // // // // //                       Container(
// // // // // //                         height: 3,
// // // // // //                         width: MediaQuery.of(context).size.width / 2,
// // // // // //                         color: isBuySelected ? Colors.black : Colors.transparent,
// // // // // //                       ),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               Expanded(
// // // // // //                 child: GestureDetector(
// // // // // //                   onTap: () {
// // // // // //                     setState(() {
// // // // // //                       isBuySelected = false;
// // // // // //                     });
// // // // // //                   },
// // // // // //                   child: Column(
// // // // // //                     children: [
// // // // // //                       Text("Sell", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // // // //                       SizedBox(height: 8), // Padding before underline
// // // // // //                       Container(
// // // // // //                         height: 3,
// // // // // //                         width: MediaQuery.of(context).size.width / 2,
// // // // // //                         color: !isBuySelected ? Colors.black : Colors.transparent,
// // // // // //                       ),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //
// // // // // //           Divider(),
// // // // // //
// // // // // //           // Posts Grid
// // // // // //           Expanded(
// // // // // //             child: GridView.builder(
// // // // // //               padding: EdgeInsets.all(2),
// // // // // //               itemCount: 9,
// // // // // //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // // // // //                 crossAxisCount: 3,
// // // // // //                 crossAxisSpacing: 2,
// // // // // //                 mainAxisSpacing: 2,
// // // // // //               ),
// // // // // //               itemBuilder: (context, index) {
// // // // // //                 return Container(
// // // // // //                   color: Colors.grey.shade300,
// // // // // //                   child: Icon(Icons.image, color: Colors.white),
// // // // // //                 );
// // // // // //               },
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // //
// // // // // //   Widget profileStat(String count, String label) {
// // // // // //     return Column(
// // // // // //       children: [
// // // // // //         Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
// // // // // //         Text(label, style: TextStyle(color: Colors.grey, fontSize: 15)),
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // //
// // // // //
// // // // // import 'package:flutter/material.dart';
// // // // //
// // // // // class ProfilePage extends StatefulWidget {
// // // // //   @override
// // // // //   _ProfilePageState createState() => _ProfilePageState();
// // // // // }
// // // // //
// // // // // class _ProfilePageState extends State<ProfilePage> {
// // // // //   bool isBuySelected = true; // Tracks selected tab
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     double screenWidth = MediaQuery.of(context).size.width;
// // // // //
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         actions: [
// // // // //           IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
// // // // //         ],
// // // // //       ),
// // // // //       body: SingleChildScrollView(
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // // //           children: [
// // // // //             // Profile Header
// // // // //
// // // // //               Column(
// // // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // // //                 children: [
// // // // //                   CircleAvatar(
// // // // //                     radius: 60,
// // // // //                     backgroundImage: AssetImage("assets/images/i3.png"),
// // // // //                   ),
// // // // //                   SizedBox(height: 16),
// // // // //                   Row(
// // // // //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // //                     children: [
// // // // //                       profileStat("2", "Pending"),
// // // // //                       profileStat("4", "Buys"),
// // // // //                       profileStat("3", "Sells"),
// // // // //                     ],
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //
// // // // //             // Bio Section
// // // // //             Padding(
// // // // //               padding: EdgeInsets.symmetric(horizontal: 16),
// // // // //               child: Column(
// // // // //                 crossAxisAlignment: CrossAxisAlignment.center,
// // // // //                 children: [
// // // // //                   Text("Naman Shah (B23218)", style: TextStyle(fontWeight: FontWeight.bold)),
// // // // //                   Text("🌟 A short bio to describe yourself"),
// // // // //                   Text("📌 Emojis are supported"),
// // // // //                   InkWell(
// // // // //                     onTap: () {},
// // // // //                     child: Text(
// // // // //                       "yourbrandwebsite.com",
// // // // //                       style: TextStyle(color: Colors.blue),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //
// // // // //             SizedBox(height: 10),
// // // // //
// // // // //             // Buy & Sell Toggle
// // // // //             Stack(
// // // // //               alignment: Alignment.bottomCenter,
// // // // //               children: [
// // // // //                 Row(
// // // // //                   children: [
// // // // //                     Expanded(
// // // // //                       child: GestureDetector(
// // // // //                         onTap: () {
// // // // //                           setState(() {
// // // // //                             isBuySelected = true;
// // // // //                           });
// // // // //                         },
// // // // //                         child: Column(
// // // // //                           children: [
// // // // //                             Text("Buy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // // //                             SizedBox(height: 8), // Padding before underline
// // // // //                           ],
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                     Expanded(
// // // // //                       child: GestureDetector(
// // // // //                         onTap: () {
// // // // //                           setState(() {
// // // // //                             isBuySelected = false;
// // // // //                           });
// // // // //                         },
// // // // //                         child: Column(
// // // // //                           children: [
// // // // //                             Text("Sell", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // // //                             SizedBox(height: 8), // Padding before underline
// // // // //                           ],
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //                 AnimatedContainer(
// // // // //                   duration: Duration(milliseconds: 300),
// // // // //                   curve: Curves.easeInOut,
// // // // //                   width: screenWidth / 3, // Reduce width of underline
// // // // //                   height: 3,
// // // // //                   margin: EdgeInsets.only(bottom: 0), // Adjust bottom margin
// // // // //                   color: Colors.black,
// // // // //                   transform: Matrix4.translationValues(isBuySelected ? 0 : screenWidth / 2, 0, 0),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //
// // // // //             Divider(),
// // // // //
// // // // //             // Posts Grid
// // // // //             Expanded(
// // // // //               child: GridView.builder(
// // // // //                 padding: EdgeInsets.all(2),
// // // // //                 itemCount: 9,
// // // // //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // // // //                   crossAxisCount: 3,
// // // // //                   crossAxisSpacing: 2,
// // // // //                   mainAxisSpacing: 2,
// // // // //                 ),
// // // // //                 itemBuilder: (context, index) {
// // // // //                   return Container(
// // // // //                     color: Colors.grey.shade300,
// // // // //                     child: Icon(Icons.image, color: Colors.white),
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // //
// // // // //   Widget profileStat(String count, String label) {
// // // // //     return Column(
// // // // //       children: [
// // // // //         Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
// // // // //         Text(label, style: TextStyle(color: Colors.grey, fontSize: 15)),
// // // // //       ],
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // //
// // // // import 'package:flutter/material.dart';
// // // //
// // // // class ProfilePage extends StatefulWidget {
// // // //   @override
// // // //   _ProfilePageState createState() => _ProfilePageState();
// // // // }
// // // //
// // // // class _ProfilePageState extends State<ProfilePage> {
// // // //   bool isBuySelected = true; // Tracks selected tab
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     double screenWidth = MediaQuery.of(context).size.width;
// // // //
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         actions: [
// // // //           IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
// // // //         ],
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.center,
// // // //           children: [
// // // //             // Profile Header
// // // //             Column(
// // // //               mainAxisAlignment: MainAxisAlignment.center,
// // // //               children: [
// // // //                 CircleAvatar(
// // // //                   radius: 60,
// // // //                   backgroundImage: AssetImage("assets/images/i3.png"), // Fixed Image Path
// // // //                 ),
// // // //                 SizedBox(height: 16),
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // //                   children: [
// // // //                     profileStat("2", "Pending"),
// // // //                     profileStat("4", "Buys"),
// // // //                     profileStat("3", "Sells"),
// // // //                   ],
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //
// // // //             // Bio Section
// // // //             Padding(
// // // //               padding: EdgeInsets.symmetric(horizontal: 16),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.center,
// // // //                 children: [
// // // //                   Text("Naman Shah (B23218)", style: TextStyle(fontWeight: FontWeight.bold)),
// // // //                   Text("🌟 A short bio to describe yourself"),
// // // //                   Text("📌 Emojis are supported"),
// // // //                   InkWell(
// // // //                     onTap: () {},
// // // //                     child: Text(
// // // //                       "yourbrandwebsite.com",
// // // //                       style: TextStyle(color: Colors.blue),
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //
// // // //             SizedBox(height: 10),
// // // //
// // // //             // Buy & Sell Toggle
// // // //             Stack(
// // // //               alignment: Alignment.bottomCenter,
// // // //               children: [
// // // //                 Row(
// // // //                   children: [
// // // //                     Expanded(
// // // //                       child: GestureDetector(
// // // //                         onTap: () {
// // // //                           setState(() {
// // // //                             isBuySelected = true;
// // // //                           });
// // // //                         },
// // // //                         child: Column(
// // // //                           children: [
// // // //                             Text("Buy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // //                             SizedBox(height: 8), // Padding before underline
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                     Expanded(
// // // //                       child: GestureDetector(
// // // //                         onTap: () {
// // // //                           setState(() {
// // // //                             isBuySelected = false;
// // // //                           });
// // // //                         },
// // // //                         child: Column(
// // // //                           children: [
// // // //                             Text("Sell", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // // //                             SizedBox(height: 8), // Padding before underline
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 Container(
// // // //                   color: Colors.red,
// // // //                 )
// // // //               ],
// // // //             ),
// // // //
// // // //             Divider(),
// // // //
// // // //             // Posts Grid (Fixed)
// // // //             SizedBox(
// // // //               height: 300, // Constrain the height of the GridView
// // // //               child: GridView.builder(
// // // //                 padding: EdgeInsets.all(2),
// // // //                 shrinkWrap: true, // Prevents infinite height error
// // // //                 physics: NeverScrollableScrollPhysics(), // Disables GridView scrolling
// // // //                 itemCount: 9,
// // // //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // // //                   crossAxisCount: 3,
// // // //                   crossAxisSpacing: 2,
// // // //                   mainAxisSpacing: 2,
// // // //                 ),
// // // //                 itemBuilder: (context, index) {
// // // //                   return Container(
// // // //                     color: Colors.grey.shade300,
// // // //                     child: Icon(Icons.image, color: Colors.white),
// // // //                   );
// // // //                 },
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget profileStat(String count, String label) {
// // // //     return Column(
// // // //       children: [
// // // //         Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
// // // //         Text(label, style: TextStyle(color: Colors.grey, fontSize: 15)),
// // // //       ],
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // // import 'package:flutter/material.dart';
// // //
// // // class ProfilePage extends StatefulWidget {
// // //   @override
// // //   _ProfilePageState createState() => _ProfilePageState();
// // // }
// // //
// // // class _ProfilePageState extends State<ProfilePage> {
// // //   bool isBuySelected = true; // Tracks selected tab
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     double screenWidth = MediaQuery.of(context).size.width;
// // //
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         actions: [
// // //           IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
// // //         ],
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           children: [
// // //             // Profile Header
// // //             Column(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 CircleAvatar(
// // //                   radius: 60,
// // //                   backgroundImage: AssetImage("assets/images/i3.png"),
// // //                 ),
// // //                 SizedBox(height: 16),
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                   children: [
// // //                     profileStat("2", "Pending"),
// // //                     profileStat("4", "Buys"),
// // //                     profileStat("3", "Sells"),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //
// // //             // Bio Section
// // //             Padding(
// // //               padding: EdgeInsets.symmetric(horizontal: 16),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.center,
// // //                 children: [
// // //                   Text("Naman Shah (B23218)", style: TextStyle(fontWeight: FontWeight.bold)),
// // //                   Text("🌟 A short bio to describe yourself"),
// // //                   Text("📌 Emojis are supported"),
// // //                   InkWell(
// // //                     onTap: () {},
// // //                     child: Text(
// // //                       "yourbrandwebsite.com",
// // //                       style: TextStyle(color: Colors.blue),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //
// // //             SizedBox(height: 10),
// // //
// // //             // Buy & Sell Toggle with Animated Underline
// // //             Stack(
// // //               alignment: Alignment.bottomCenter,
// // //               children: [
// // //                 Row(
// // //                   children: [
// // //                     Expanded(
// // //                       child: GestureDetector(
// // //                         onTap: () {
// // //                           setState(() {
// // //                             isBuySelected = true;
// // //                           });
// // //                         },
// // //                         child: Column(
// // //                           children: [
// // //                             Text("Buy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // //                             SizedBox(height: 8),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     Expanded(
// // //                       child: GestureDetector(
// // //                         onTap: () {
// // //                           setState(() {
// // //                             isBuySelected = false;
// // //                           });
// // //                         },
// // //                         child: Column(
// // //                           children: [
// // //                             Text("Sell", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // //                             SizedBox(height: 8),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 AnimatedContainer(
// // //                   duration: Duration(milliseconds: 300),
// // //                   curve: Curves.easeInOut,
// // //                   width: screenWidth / 2,
// // //                   height: 3,
// // //                   margin: EdgeInsets.only(bottom: 0),
// // //                   color: Colors.black,
// // //                   transform: Matrix4.translationValues(isBuySelected ? 0 : screenWidth / 2, 0, 0),
// // //                 ),
// // //               ],
// // //             ),
// // //
// // //             Divider(),
// // //
// // //             // Posts List (Full Width, Card Layout)
// // //             ListView.builder(
// // //               padding: EdgeInsets.all(8),
// // //               shrinkWrap: true,
// // //               physics: NeverScrollableScrollPhysics(),
// // //               itemCount: 9,
// // //               itemBuilder: (context, index) {
// // //                 return Card(
// // //                   margin: EdgeInsets.symmetric(vertical: 8),
// // //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       Container(
// // //                         height: 200, // Fixed Height for Image
// // //                         width: double.infinity,
// // //                         decoration: BoxDecoration(
// // //                           borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
// // //                           color: Colors.grey.shade300,
// // //                         ),
// // //                         child: Icon(Icons.image, color: Colors.white, size: 50),
// // //                       ),
// // //                       Padding(
// // //                         padding: EdgeInsets.all(10),
// // //                         child: Text(
// // //                           "Post Title ${index + 1}",
// // //                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget profileStat(String count, String label) {
// // //     return Column(
// // //       children: [
// // //         Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
// // //         Text(label, style: TextStyle(color: Colors.grey, fontSize: 15)),
// // //       ],
// // //     );
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// //
// // class ProfilePage extends StatefulWidget {
// //   @override
// //   _ProfilePageState createState() => _ProfilePageState();
// // }
// //
// // class _ProfilePageState extends State<ProfilePage> {
// //   bool isBuySelected = true; // Tracks selected tab
// //
// //   // Sample Data
// //   final List<String> buyPosts = List.generate(5, (index) => "Buy Item ${index + 1}");
// //   final List<String> sellPosts = List.generate(5, (index) => "Sell Item ${index + 1}");
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.only(top: 64.0, bottom: 18),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             // Profile Header
// //             Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 CircleAvatar(
// //                   radius: 60,
// //                   backgroundImage: AssetImage("assets/images/i3.png"),
// //                 ),
// //                 SizedBox(height: 16),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [
// //                     profileStat("2", "Pending"),
// //                     profileStat("4", "Buys"),
// //                     profileStat("3", "Sells"),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //
// //             // Bio Section
// //             Padding(
// //               padding: EdgeInsets.symmetric(horizontal: 16),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   Text("Naman Shah (B23218)", style: TextStyle(fontWeight: FontWeight.bold)),
// //                   Text("🌟 A short bio to describe yourself"),
// //                   Text("📌 Emojis are supported"),
// //                   InkWell(
// //                     onTap: () {},
// //                     child: Text(
// //                       "yourbrandwebsite.com",
// //                       style: TextStyle(color: Colors.blue),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //
// //             SizedBox(height: 10),
// //
// //             // Buy & Sell Toggle with Underline
// //             Container(
// //               width: screenWidth,
// //               child: Column(
// //                 children: [
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: GestureDetector(
// //                           onTap: () {
// //                             setState(() {
// //                               isBuySelected = true;
// //                             });
// //                           },
// //                           child: Column(
// //                             children: [
// //                               Text("Buy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //                               SizedBox(height: 8),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                       Expanded(
// //                         child: GestureDetector(
// //                           onTap: () {
// //                             setState(() {
// //                               isBuySelected = false;
// //                             });
// //                           },
// //                           child: Column(
// //                             children: [
// //                               Text("Sell", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //                               SizedBox(height: 8),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   Stack(
// //                     children: [
// //                       Container(
// //                         width: screenWidth,
// //                         height: 3,
// //                         color: Colors.grey.shade300,
// //                       ),
// //                       AnimatedContainer(
// //                         duration: Duration(milliseconds: 300),
// //                         curve: Curves.easeInOut,
// //                         width: screenWidth / 2,
// //                         height: 3,
// //                         color: Colors.black,
// //                         transform: Matrix4.translationValues(isBuySelected ? 0 : screenWidth / 2, 0, 0),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //
// //             Divider(),
// //
// //             // Posts List (Filtered by Buy/Sell)
// //             Expanded(
// //               child: ListView.builder(
// //                 padding: EdgeInsets.all(8),
// //                 itemCount: isBuySelected ? buyPosts.length : sellPosts.length,
// //                 itemBuilder: (context, index) {
// //                   String title = isBuySelected ? buyPosts[index] : sellPosts[index];
// //                   return Card(
// //                     margin: EdgeInsets.symmetric(vertical: 8),
// //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Container(
// //                           height: 200,
// //                           width: double.infinity,
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
// //                             color: Colors.grey.shade300,
// //                           ),
// //                           child: Icon(Icons.image, color: Colors.white, size: 50),
// //                         ),
// //                         Padding(
// //                           padding: EdgeInsets.all(10),
// //                           child: Text(
// //                             title,
// //                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget profileStat(String count, String label) {
// //     return Column(
// //       children: [
// //         Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
// //         Text(label, style: TextStyle(color: Colors.grey, fontSize: 15)),
// //       ],
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:iit_marketing/views/footer.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   bool isBuySelected = true; // Tracks selected tab
//
//   // Sample Data
//   final List<String> buyPosts = List.generate(5, (index) => "Buy Item ${index + 1}");
//   final List<String> sellPosts = List.generate(5, (index) => "Sell Item ${index + 1}");
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 64.0, bottom: 18),
//               child: Column(
//                 children: [
//                   // Profile Header
//                   CircleAvatar(
//                     radius: 60,
//                     backgroundImage: AssetImage("assets/images/i3.png"),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       profileStat("2", "Pending"),
//                       profileStat("4", "Buys"),
//                       profileStat("3", "Sells"),
//                     ],
//                   ),
//                   SizedBox(height: 18,),
//
//                   // Bio Section
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text("Naman Shah (B23218)", style: TextStyle(fontWeight: FontWeight.bold)),
//                         Text("🌟 A short bio to describe yourself"),
//                         Text("📌 Emojis are supported"),
//                         InkWell(
//                           onTap: () {},
//                           child: Text(
//                             "yourbrandwebsite.com",
//                             style: TextStyle(color: Colors.blue),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: 10),
//
//                   // Buy & Sell Toggle with Underline
//                   Container(
//                     width: screenWidth,
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     isBuySelected = true;
//                                   });
//                                 },
//                                 child: Column(
//                                   children: [
//                                     Text("Buy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                                     SizedBox(height: 8),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     isBuySelected = false;
//                                   });
//                                 },
//                                 child: Column(
//                                   children: [
//                                     Text("Sell", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                                     SizedBox(height: 8),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Stack(
//                           children: [
//                             Container(
//                               width: screenWidth,
//                               height: 3,
//                               color: Colors.grey.shade300,
//                             ),
//                             AnimatedContainer(
//                               duration: Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                               width: screenWidth / 2,
//                               height: 3,
//                               color: Colors.black,
//                               transform: Matrix4.translationValues(isBuySelected ? 0 : screenWidth / 2, 0, 0),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   Divider(),
//                 ],
//               ),
//             ),
//
//             // Posts List (Scrollable)
//             ListView.builder(
//               physics: NeverScrollableScrollPhysics(), // Disable ListView scrolling
//               shrinkWrap: true, // Allow ListView to fit inside SingleChildScrollView
//               padding: EdgeInsets.all(8),
//               itemCount: isBuySelected ? buyPosts.length : sellPosts.length,
//               itemBuilder: (context, index) {
//                 String title = isBuySelected ? buyPosts[index] : sellPosts[index];
//                 return Card(
//                   margin: EdgeInsets.symmetric(vertical: 8),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 200,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//                           color: Colors.grey.shade300,
//                         ),
//                         child: Icon(Icons.image, color: Colors.white, size: 50),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           title,
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget profileStat(String count, String label) {
//     return Column(
//       children: [
//         Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
//         Text(label, style: TextStyle(color: Colors.grey, fontSize: 15)),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:iit_marketing/views/footer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isBuySelected = true; // Tracks selected tab

  // Sample Data
  final List<String> buyPosts = List.generate(5, (index) => "Buy Item ${index + 1}");
  final List<String> sellPosts = List.generate(5, (index) => "Sell Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Matches UI
        elevation: 0, // Removes shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.menu, color: Colors.black, size: 32,),
            ), // 3 horizontal lines icon
            onPressed: () {
              // Add functionality here (e.g., open drawer or menu)
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        children: [
                          // Profile Header
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage("assets/images/user.png"),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              profileStat("2", "Items Pending"),
                              profileStat("4", "Items Bought"),
                              profileStat("3", "Items Sold"),
                            ],
                          ),
                          SizedBox(height: 18),

                          // Bio Section
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Naman Shah (B23218)", style: TextStyle(fontWeight: FontWeight.bold)),
                                Text("🌟 A short bio to describe yourself"),
                                Text("📌 Emojis are supported"),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "yourbrandwebsite.com",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 10),

                          // Buy & Sell Toggle with Underline
                          Container(
                            width: screenWidth,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isBuySelected = true;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Text("Buy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                            SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isBuySelected = false;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Text("Sell", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                            SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: screenWidth,
                                      height: 3,
                                      color: Colors.grey.shade300,
                                    ),
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      width: screenWidth / 2,
                                      height: 3,
                                      color: Colors.black,
                                      transform: Matrix4.translationValues(isBuySelected ? 0 : screenWidth / 2, 0, 0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Divider(),
                        ],
                      ),

                    // Posts List (Scrollable)
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(), // Disable ListView scrolling
                      shrinkWrap: true, // Allow ListView to fit inside SingleChildScrollView
                      padding: EdgeInsets.all(8),
                      itemCount: isBuySelected ? buyPosts.length : sellPosts.length,
                      itemBuilder: (context, index) {
                        String title = isBuySelected ? buyPosts[index] : sellPosts[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, "/itemPage");
                            },
                          child: Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/i4.png'),
                                      fit: BoxFit.cover, // Adjusts the image to fit the container
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    title,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Persistent Footer
            Container(
              height: 60,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FooterWidget(selectedIndex: 4), // Your footer widget from footer.dart
            ),
          ],
        ),
      ),
    );
  }

  Widget profileStat(String count, String label) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 15)),
      ],
    );
  }
}
