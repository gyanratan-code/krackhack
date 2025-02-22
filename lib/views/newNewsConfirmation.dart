// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:newser/views/footer.dart';
// // // // // import 'package:newser/views/header.dart';
// // // // //
// // // // // class NewNewsConfirmation extends StatelessWidget {
// // // // //   const NewNewsConfirmation({super.key});
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       body: Column(
// // // // //         children: [
// // // // //           // Header Widget
// // // // //           const HeaderWidget(),
// // // // //
// // // // //           // Main Content
// // // // //           Expanded(
// // // // //             child: Padding(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // //               child: ListView(
// // // // //                 children: [
// // // // //                   const SizedBox(height: 10),
// // // // //                   _buildTile("Title", "My Title"),
// // // // //                   _buildTile("Image", "My Image", isClickable: true),
// // // // //                   _buildTile(
// // // // //                       "Description",
// // // // //                       "One main thing, I left to say, while seeing any news, people will only see an image, a title, and descriptions..."),
// // // // //                   _buildTile(
// // // // //                       "Long Description",
// // // // //                       "One main thing, I left to say, while seeing any news, people will only see an image, a title, and... One main thing, I left to say, while seeing any news, people will only see an image, a title, and... One main thing, I left to say, while seeing any news, people will only see an image, a title, and... One main thing, I left to say, while seeing any news, people will only see an image, a title, and... One main thing, I left to say, while seeing any news, people will only see an image, a title, and..."),
// // // // //                   const SizedBox(height: 10),
// // // // //
// // // // //                   // Categories
// // // // //                   const Padding(
// // // // //                     padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
// // // // //                     child: Text(
// // // // //                       "Categories",
// // // // //                       style:
// // // // //                       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // // //                     ),
// // // // //                   ),
// // // // //                   _buildCategories(),
// // // // //
// // // // //                   const SizedBox(height: 20),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //
// // // // //           // Upload Button
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.all(16.0),
// // // // //             child: SizedBox(
// // // // //               width: double.infinity,
// // // // //               child: ElevatedButton(
// // // // //                 onPressed: () {
// // // // //                   // Upload action
// // // // //                 },
// // // // //                 style: ElevatedButton.styleFrom(
// // // // //                   padding: const EdgeInsets.symmetric(vertical: 14),
// // // // //                   backgroundColor: Colors.black,
// // // // //                   foregroundColor: Colors.white,
// // // // //                   shape: RoundedRectangleBorder(
// // // // //                       borderRadius: BorderRadius.circular(8)),
// // // // //                 ),
// // // // //                 child: const Text("Upload"),
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //
// // // // //           // Footer Widget
// // // // //           const FooterWidget(),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // //
// // // // //   Widget _buildTile(String title, String subtitle, {bool isClickable = true}) {
// // // // //     return ListTile(
// // // // //       title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
// // // // //       subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
// // // // //       trailing: isClickable
// // // // //           ? const Icon(Icons.arrow_forward_ios, size: 16)
// // // // //           : null,
// // // // //     );
// // // // //   }
// // // // //
// // // // //   Widget _buildCategories() {
// // // // //     List<String> categories = [
// // // // //       "Bad News",
// // // // //       "Accident",
// // // // //       "Crime",
// // // // //       "Good News",
// // // // //       "Lost and Found"
// // // // //     ];
// // // // //
// // // // //     return Column(
// // // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // // //       children: categories
// // // // //           .map((category) => Padding(
// // // // //         padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16),
// // // // //         child: Text("• $category"),
// // // // //       ))
// // // // //           .toList(),
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // //
// // // // import 'package:flutter/material.dart';
// // // // import 'package:newser/views/footer.dart';
// // // // import 'package:newser/views/header.dart';
// // // // import 'package:newser/views/detail_page.dart'; // Import the new page
// // // //
// // // // class NewNewsConfirmation extends StatelessWidget {
// // // //   const NewNewsConfirmation({super.key});
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Column(
// // // //         children: [
// // // //           // Header Widget
// // // //           const HeaderWidget(),
// // // //
// // // //           // Main Content
// // // //           Expanded(
// // // //             child: Padding(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // //               child: ListView(
// // // //                 children: [
// // // //                   const SizedBox(height: 10),
// // // //                   _buildTile(context, "Title", "My Title"),
// // // //                   _buildTile(context, "Image", "My Image"),
// // // //                   _buildTile(
// // // //                       context,
// // // //                       "Description",
// // // //                       "One main thing, I left to say, while seeing any news, people will only see an image, a title, and descriptions..."),
// // // //                   _buildTile(
// // // //                       context,
// // // //                       "Long Description",
// // // //                       "One main thing, I left to say, while seeing any news, people will only see an image, a title, and a full story... One main thing, I left to say, while seeing any news, people will only see an image, a title, and a full story... One main thing, I left to say, while seeing any news, people will only see an image, a title, and a full story... One main thing, I left to say, while seeing any news, people will only see an image, a title, and a full story... One main thing, I left to say, while seeing any news, people will only see an image, a title, and a full story..."),
// // // //                   const SizedBox(height: 10),
// // // //
// // // //                   // Categories
// // // //                   const Padding(
// // // //                     padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
// // // //                     child: Text(
// // // //                       "Categories",
// // // //                       style:
// // // //                       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                   ),
// // // //                   _buildCategories(),
// // // //
// // // //                   const SizedBox(height: 20),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //
// // // //           // Upload Button
// // // //           Padding(
// // // //             padding: const EdgeInsets.all(16.0),
// // // //             child: SizedBox(
// // // //               width: double.infinity,
// // // //               child: ElevatedButton(
// // // //                 onPressed: () {
// // // //                   // Upload action
// // // //                 },
// // // //                 style: ElevatedButton.styleFrom(
// // // //                   padding: const EdgeInsets.symmetric(vertical: 14),
// // // //                   backgroundColor: Colors.black,
// // // //                   foregroundColor: Colors.white,
// // // //                   shape: RoundedRectangleBorder(
// // // //                       borderRadius: BorderRadius.circular(8)),
// // // //                 ),
// // // //                 child: const Text("Upload"),
// // // //               ),
// // // //             ),
// // // //           ),
// // // //
// // // //           // Footer Widget
// // // //           const FooterWidget(),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildTile(BuildContext context, String title, String subtitle) {
// // // //     return ListTile(
// // // //       title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
// // // //       subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
// // // //       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
// // // //       onTap: () {
// // // //         Navigator.push(
// // // //           context,
// // // //           MaterialPageRoute(
// // // //             builder: (context) => DetailPage(title: title, content: subtitle),
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildCategories() {
// // // //     List<String> categories = [
// // // //       "Bad News",
// // // //       "Accident",
// // // //       "Crime",
// // // //       "Good News",
// // // //       "Lost and Found",
// // // //       "Bad News",
// // // //       "Accident",
// // // //       "Crime",
// // // //       "Good News",
// // // //       "Lost and Found",
// // // //       "Bad News",
// // // //       "Accident",
// // // //       "Crime",
// // // //       "Good News",
// // // //     ];
// // // //
// // // //     return Column(
// // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // //       children: categories
// // // //           .map((category) => Padding(
// // // //         padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16),
// // // //         child: Text("• $category"),
// // // //       ))
// // // //           .toList(),
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:newser/views/footer.dart';
// // // import 'package:newser/views/header.dart';
// // // import 'package:newser/views/detail_page.dart'; // Import the new page
// // //
// // // class NewNewsConfirmation extends StatelessWidget {
// // //   const NewNewsConfirmation({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Container(
// // //         color: Colors.white,
// // //         child: Column(
// // //           children: [
// // //             // Back Button Row
// // //             Padding(
// // //               padding: const EdgeInsets.only(left: 8.0, top: 40.0, right: 8.0), // Adjust padding for top spacing
// // //               child: Row(
// // //                 children: [
// // //                   IconButton(
// // //                     icon: const Icon(Icons.arrow_back, size: 24),
// // //                     onPressed: () {
// // //                       Navigator.pop(context);
// // //                     },
// // //                   ),
// // //                   const SizedBox(width: 8),
// // //                   const Text(
// // //                     "Confirm Your News",
// // //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //
// // //             // Header Widget
// // //             // const HeaderWidget(),
// // //
// // //             // Main Content
// // //             Expanded(
// // //               child: Padding(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // //                 child: ListView(
// // //                   children: [
// // //                     _buildTile(context, "Title", "My Title"),
// // //                     _buildTile(context, "Image", "My Image"),
// // //                     _buildTile(
// // //                         context,
// // //                         "Description",
// // //                         "One main thing, I left to say, while seeing any news, people will only see an image, a title, and descriptions..."),
// // //                     _buildTile(
// // //                         context,
// // //                         "Long Description",
// // //                         "One main thing, I left to say, while seeing any news, people will only see an image, a title, and a full story... One main thing, I left to say, while seeing any news, people will only see an image, a title, and a full story..."),
// // //                     const SizedBox(height: 10),
// // //
// // //                     // Categories
// // //                     const Padding(
// // //                       padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
// // //                       child: Text(
// // //                         "Categories",
// // //                         style:
// // //                         TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // //                       ),
// // //                     ),
// // //                     _buildCategories(),
// // //
// // //                     const SizedBox(height: 20),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //
// // //             // Upload Button
// // //             Padding(
// // //               padding: const EdgeInsets.all(16.0),
// // //               child: SizedBox(
// // //                 width: double.infinity,
// // //                 child: ElevatedButton(
// // //                   onPressed: () {
// // //                     // Upload action
// // //                   },
// // //                   style: ElevatedButton.styleFrom(
// // //                     padding: const EdgeInsets.symmetric(vertical: 14),
// // //                     backgroundColor: Colors.black,
// // //                     foregroundColor: Colors.white,
// // //                     shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(8)),
// // //                   ),
// // //                   child: const Text("Upload"),
// // //                 ),
// // //               ),
// // //             ),
// // //
// // //             // Footer Widget
// // //             const FooterWidget(selectedIndex: 2,),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildTile(BuildContext context, String title, String subtitle) {
// // //     return ListTile(
// // //       title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
// // //       subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
// // //       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
// // //       onTap: () {
// // //         Navigator.push(
// // //           context,
// // //           MaterialPageRoute(
// // //             builder: (context) => DetailPage(title: title, content: subtitle),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   Widget _buildCategories() {
// // //     List<String> categories = [
// // //       "Bad News",
// // //       "Accident",
// // //       "Crime",
// // //       "Good News",
// // //       "Lost and Found",
// // //       "Bad News",
// // //       "Accident",
// // //       "Crime",
// // //       "Good News",
// // //       "Lost and Found",
// // //       "Bad News",
// // //       "Accident",
// // //       "Crime",
// // //       "Good News",
// // //       "Lost and Found",
// // //       "Bad News",
// // //       "Accident",
// // //       "Crime",
// // //       "Good News",
// // //       "Lost and Found",
// // //       "Bad News",
// // //       "Accident",
// // //       "Crime",
// // //       "Good News",
// // //       "Lost and Found",
// // //     ];
// // //
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: categories
// // //           .map((category) => Padding(
// // //         padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16),
// // //         child: Text("• $category"),
// // //       ))
// // //           .toList(),
// // //     );
// // //   }
// // //
// // // }
// //
// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:newser/views/footer.dart';
// //
// // class NewNewsConfirmation extends StatelessWidget {
// //   final String title;
// //   final String description;
// //   final String longDescription;
// //
// //   const NewNewsConfirmation({
// //     super.key,
// //     required this.title,
// //     required this.description,
// //     required this.longDescription,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         color: Colors.white,
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.only(left: 8.0, top: 40.0, right: 8.0),
// //               child: Row(
// //                 children: [
// //                   IconButton(
// //                     icon: const Icon(Icons.arrow_back, size: 24),
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                     },
// //                   ),
// //                   const SizedBox(width: 8),
// //                   const Text(
// //                     "Confirm Your News",
// //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //
// //             Expanded(
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //                 child: ListView(
// //                   children: [
// //                     _buildTile(context, "Title", title),
// //                     _buildTile(context, "Description", description),
// //                     _buildTile(context, "Long Description", longDescription),
// //                     const SizedBox(height: 20),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //
// //             Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton(
// //                   onPressed: () async {
// //                     await _uploadNewsToFirebase(context);
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     padding: const EdgeInsets.symmetric(vertical: 14),
// //                     backgroundColor: Colors.black,
// //                     foregroundColor: Colors.white,
// //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //                   ),
// //                   child: const Text("Upload"),
// //                 ),
// //               ),
// //             ),
// //
// //             const FooterWidget(selectedIndex: 2),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTile(BuildContext context, String title, String subtitle) {
// //     return ListTile(
// //       title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
// //       subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
// //       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
// //     );
// //   }
// //
// //   // Function to upload news to Firebase
// //   Future<void> _uploadNewsToFirebase(BuildContext context) async {
// //     String userId = FirebaseAuth.instance.currentUser!.uid;
// //
// //     try {
// //       await FirebaseFirestore.instance
// //           .collection("users")
// //           .doc(userId)
// //           .collection("news")
// //           .add({
// //         "title": title,
// //         "description": description,
// //         "longDescription": longDescription,
// //         "timestamp": FieldValue.serverTimestamp(), // Store upload time
// //       });
// //
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text("News uploaded successfully!")),
// //       );
// //
// //       // Navigate to Home after upload
// //       Navigator.restorablePushNamedAndRemoveUntil(context, "/home", (route) => false);
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Upload failed: $e")),
// //       );
// //     }
// //   }
// // }
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:newser/views/footer.dart';
// import 'package:newser/views/detail_page.dart'; // Import DetailPage
//
// class NewNewsConfirmation extends StatelessWidget {
//   final String title;
//   final String description;
//   final String longDescription;
//
//   const NewNewsConfirmation({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.longDescription,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0, top: 40.0, right: 8.0),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back, size: 24),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   const SizedBox(width: 8),
//                   const Text(
//                     "Confirm Your News",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: ListView(
//                   children: [
//                     _buildTile(context, "Title", title),
//                     _buildTile(context, "Description", description),
//                     _buildTile(context, "Long Description", longDescription),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     await _uploadNewsToFirebase(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     backgroundColor: Colors.black,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                   ),
//                   child: const Text("Upload"),
//                 ),
//               ),
//             ),
//
//             const FooterWidget(selectedIndex: 2),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ✅ Open DetailPage when clicking the ">" icon
//   Widget _buildTile(BuildContext context, String title, String subtitle) {
//     return ListTile(
//       title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//       subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
//       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailPage(title: title, content: subtitle),
//           ),
//         );
//       },
//     );
//   }
//
//   // Function to upload news to Firebase
//   Future<void> _uploadNewsToFirebase(BuildContext context) async {
//     String userId = FirebaseAuth.instance.currentUser!.uid;
//
//     try {
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc(userId)
//           .collection("news")
//           .add({
//         "title": title,
//         "description": description,
//         "longDescription": longDescription,
//         "timestamp": FieldValue.serverTimestamp(), // Store upload time
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("News uploaded successfully!")),
//       );
//
//       // Navigate to Home after upload
//       Navigator.restorablePushNamedAndRemoveUntil(context, "/home", (route) => false);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Upload failed: $e")),
//       );
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iit_marketing/views/detailPage.dart';
import 'package:iit_marketing/views/footer.dart';

class NewNewsConfirmation extends StatefulWidget {
  final String title;
  final String description;
  final String longDescription;

  const NewNewsConfirmation({
    super.key,
    required this.title,
    required this.description,
    required this.longDescription,
  });

  @override
  _NewNewsConfirmationState createState() => _NewNewsConfirmationState();
}

class _NewNewsConfirmationState extends State<NewNewsConfirmation> {
  bool isUploading = false; // ✅ State to track upload progress

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 40.0, right: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 24),
                    onPressed: () {
                      if (!isUploading) Navigator.pop(context); // Prevent back press while uploading
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Confirm Your News",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: [
                    _buildTile(context, "Title", widget.title),
                    _buildTile(context, "Description", widget.description),
                    _buildTile(context, "Long Description", widget.longDescription),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isUploading ? null : () async => await _uploadNewsToFirebase(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: isUploading
                      ? const CircularProgressIndicator(color: Colors.white) // ✅ Show loading spinner
                      : const Text("Upload"),
                ),
              ),
            ),

            const FooterWidget(selectedIndex: 2),
          ],
        ),
      ),
    );
  }

  // ✅ Open DetailPage when clicking the ">" icon
  Widget _buildTile(BuildContext context, String title, String subtitle) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(title: title, content: subtitle),
          ),
        );
      },
    );
  }

  // ✅ Function to upload news to Firebase with loading indicator
  // Future<void> _uploadNewsToFirebase(BuildContext context) async {
  //   setState(() {
  //     isUploading = true; // Start loading
  //   });
  //
  //   String userId = FirebaseAuth.instance.currentUser!.uid;
  //
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(userId)
  //         .collection("news")
  //         .add({
  //       "title": widget.title,
  //       "description": widget.description,
  //       "longDescription": widget.longDescription,
  //       "timestamp": FieldValue.serverTimestamp(), // Store upload time
  //     });
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("News uploaded successfully!")),
  //     );
  //
  //     Navigator.restorablePushNamedAndRemoveUntil(context, "/home", (route) => false);
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Upload failed: $e")),
  //     );
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         isUploading = false; // Stop loading (not needed since we navigate away, but useful for debugging)
  //       });
  //     }
  //   }
  // }

  Future<void> _uploadNewsToFirebase(BuildContext context) async {
    setState(() {
      isUploading = true; // Start loading
    });

    String userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      // Reference to Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Upload the news
      await firestore.collection("users").doc(userId).collection("news").add({
        "title": widget.title,
        "description": widget.description,
        "longDescription": widget.longDescription,
        "timestamp": FieldValue.serverTimestamp(), // Store upload time
      });

      // ✅ Increment the nNews count by 1
      await firestore.collection("users").doc(userId).update({
        "nNews": FieldValue.increment(1),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("News uploaded successfully!")),
      );

      // Navigate to Home after upload
      Navigator.restorablePushNamedAndRemoveUntil(context, "/home", (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Upload failed: $e")),
      );
    } finally {
      if (mounted) {
        setState(() {
          isUploading = false; // Stop loading (not needed since we navigate away, but useful for debugging)
        });
      }
    }
  }

}
