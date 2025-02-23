// // import 'package:flutter/material.dart';
// // import 'package:iit_marketing/views/footer.dart';
// // import 'chat_screen.dart'; // Import ChatScreen
// //
// // class ItemPage extends StatelessWidget {
// //   final Map<String, dynamic> product;
// //
// //   ItemPage({required this.product});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     String thumbnail = product['thumbnail'] ?? '';
// //     List<String> additionalImages = List<String>.from(product['image'] ?? []);
// //     List<String> allImages = [thumbnail, ...additionalImages];
// //     String sellerId =
// //         product['uid'] ?? ''; // Assuming sellerId exists in product
// //
// //     return Scaffold(
// //       body: Container(
// //         color: Colors.white,
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
// //               child: Row(
// //                 children: [
// //                   IconButton(
// //                     icon: Icon(Icons.arrow_back),
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                     },
// //                   ),
// //                   ClipRRect(
// //                     borderRadius: BorderRadius.circular(24),
// //                     child: Image.asset(
// //                       "assets/images/user.png",
// //                       width: 48,
// //                       height: 48,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                   SizedBox(width: 10),
// //                   Text(
// //                     product['brand'] ?? 'Unknown Brand',
// //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 10),
// //
// //             // Image Carousel
// //             SizedBox(
// //               height: 250,
// //               child: PageView.builder(
// //                 itemCount: allImages.length,
// //                 itemBuilder: (context, index) {
// //                   return GestureDetector(
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) =>
// //                               FullScreenImage(imageUrl: allImages[index]),
// //                         ),
// //                       );
// //                     },
// //                     child: Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //                       child: ClipRRect(
// //                         borderRadius: BorderRadius.circular(10),
// //                         child: Stack(
// //                           alignment: Alignment.center,
// //                           children: [
// //                             Container(
// //                               height: 250,
// //                               color: Colors.grey[300],
// //                               child: Center(child: CircularProgressIndicator()),
// //                             ),
// //                             Image.network(
// //                               allImages[index],
// //                               height: 250,
// //                               width: double.infinity,
// //                               fit: BoxFit.cover,
// //                               loadingBuilder:
// //                                   (context, child, loadingProgress) {
// //                                 if (loadingProgress == null) return child;
// //                                 return Container(
// //                                   height: 250,
// //                                   color: Colors.grey[300],
// //                                   child: Center(
// //                                       child: CircularProgressIndicator()),
// //                                 );
// //                               },
// //                               errorBuilder: (context, error, stackTrace) {
// //                                 return Container(
// //                                   height: 250,
// //                                   color: Colors.grey[300],
// //                                   child: Center(
// //                                     child: Icon(Icons.image_not_supported,
// //                                         size: 50, color: Colors.grey),
// //                                   ),
// //                                 );
// //                               },
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             SizedBox(height: 10),
// //
// //             // Product Title
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //               child: Text(
// //                 product['product'] ?? 'No Title',
// //                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //             SizedBox(height: 10),
// //
// //             // Price
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //               child: Text(
// //                 "₹${product['price']?.toStringAsFixed(2) ?? '0.00'}",
// //                 style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.green),
// //               ),
// //             ),
// //             SizedBox(height: 10),
// //
// //             // Description
// //             Expanded(
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //                 child: SingleChildScrollView(
// //                   child: Text(
// //                     product['description'] ?? 'No description available',
// //                     style: TextStyle(fontSize: 16),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //
// //             // Chat Icon & Buy Button
// //             Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                     child: ElevatedButton(
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Colors.black,
// //                         foregroundColor: Colors.white,
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(10),
// //                         ),
// //                         minimumSize: Size(double.infinity, 50),
// //                       ),
// //                       onPressed: () {},
// //                       child: Text("Buy", style: TextStyle(fontSize: 18)),
// //                     ),
// //                   ),
// //                   SizedBox(width: 10),
// //                   IconButton(
// //                     icon: Icon(Icons.chat, color: Colors.black),
// //                     onPressed: () {
// //                       print(
// //                           "📲 Navigating to ChatScreen with seller ID: $sellerId");
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) =>
// //                               ChatScreen(receiverId: sellerId),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             FooterWidget(selectedIndex: 0),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // // Full-Screen Image Viewer
// // class FullScreenImage extends StatelessWidget {
// //   final String imageUrl;
// //   FullScreenImage({required this.imageUrl});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black, // Black background
// //       body: Stack(
// //         children: [
// //           Center(
// //             child: Image.network(imageUrl, fit: BoxFit.contain),
// //           ),
// //           Positioned(
// //             top: 40,
// //             right: 20,
// //             child: IconButton(
// //               icon: Icon(Icons.close, color: Colors.white, size: 30),
// //               onPressed: () {
// //                 Navigator.pop(context);
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:iit_marketing/views/footer.dart';
// import 'chat_screen.dart'; // Import ChatScreen
//
// class ItemPage extends StatelessWidget {
//   final Map<String, dynamic> product;
//
//   ItemPage({required this.product});
//   String currentUserId = FirebaseAuth.instance.currentUser!.uid;
//
//   @override
//   Widget build(BuildContext context) {
//     String thumbnail = product['thumbnail'] ?? '';
//     List<String> additionalImages = List<String>.from(product['image'] ?? []);
//     List<String> allImages = [thumbnail, ...additionalImages];
//     String sellerId = product['uid'] ?? '';
//
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(24),
//                     child: Image.asset(
//                       "assets/images/user.png",
//                       width: 48,
//                       height: 48,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     product['brand'] ?? 'Unknown Brand',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),
//
//             // Image Carousel
//             SizedBox(
//               height: 250,
//               child: PageView.builder(
//                 itemCount: allImages.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               FullScreenImage(imageUrl: allImages[index]),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Container(
//                               height: 250,
//                               color: Colors.grey[300],
//                               child: Center(child: CircularProgressIndicator()),
//                             ),
//                             Image.network(
//                               allImages[index],
//                               height: 250,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                               loadingBuilder:
//                                   (context, child, loadingProgress) {
//                                 if (loadingProgress == null) return child;
//                                 return Container(
//                                   height: 250,
//                                   color: Colors.grey[300],
//                                   child: Center(
//                                       child: CircularProgressIndicator()),
//                                 );
//                               },
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Container(
//                                   height: 250,
//                                   color: Colors.grey[300],
//                                   child: Center(
//                                     child: Icon(Icons.image_not_supported,
//                                         size: 50, color: Colors.grey),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 10),
//
//             // Product Title
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 product['product'] ?? 'No Title',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(height: 10),
//
//             // Price
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 "₹${product['price']?.toStringAsFixed(2) ?? '0.00'}",
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green),
//               ),
//             ),
//             SizedBox(height: 10),
//
//             // Description
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: SingleChildScrollView(
//                   child: Text(
//                     product['description'] ?? 'No description available',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//
//             // Chat Icon & Buy Button
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   if (sellerId != currentUserId)
//                   Expanded(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         minimumSize: Size(double.infinity, 50),
//                       ),
//                       onPressed: () {},
//                       child: Text("Buy", style: TextStyle(fontSize: 18)),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//
//                   // Show chat button only if the logged-in user is NOT the seller
//                   if (sellerId != currentUserId)
//                     IconButton(
//                       icon: Icon(Icons.chat, color: Colors.black),
//                       onPressed: () {
//                         print(
//                             "📲 Navigating to ChatScreen with seller ID: $sellerId");
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 ChatScreen(receiverId: sellerId),
//                           ),
//                         );
//                       },
//                     ),
//                 ],
//               ),
//             ),
//             FooterWidget(selectedIndex: 0),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Full-Screen Image Viewer
// class FullScreenImage extends StatelessWidget {
//   final String imageUrl;
//   FullScreenImage({required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, // Black background
//       body: Stack(
//         children: [
//           Center(
//             child: Image.network(imageUrl, fit: BoxFit.contain),
//           ),
//           Positioned(
//             top: 40,
//             right: 20,
//             child: IconButton(
//               icon: Icon(Icons.close, color: Colors.white, size: 30),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iit_marketing/views/footer.dart';
import 'chat_screen.dart';

class ItemPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ItemPage({required this.product});

  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

  Future<String> getSellerName(String sellerId) async {
    DocumentSnapshot userDoc =
    await FirebaseFirestore.instance.collection('users').doc(sellerId).get();
    return userDoc.exists ? (userDoc['name'] ?? 'Unknown User') : 'Unknown User';
  }

  @override
  Widget build(BuildContext context) {
    String thumbnail = product['thumbnail'] ?? '';
    List<String> additionalImages = List<String>.from(product['image'] ?? []);
    List<String> allImages = [thumbnail, ...additionalImages];
    String sellerId = product['uid'] ?? '';

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      "assets/images/user.png",
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),

                  // Fetch and display seller's name
                  FutureBuilder<String>(
                    future: getSellerName(sellerId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading...",
                            style: TextStyle(fontSize: 18));
                      } else if (snapshot.hasError) {
                        return Text("Error",
                            style: TextStyle(fontSize: 18));
                      }
                      return Text(
                        snapshot.data!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Image Carousel
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: allImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FullScreenImage(imageUrl: allImages[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 250,
                              color: Colors.grey[300],
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            Image.network(
                              allImages[index],
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  height: 250,
                                  color: Colors.grey[300],
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 250,
                                  color: Colors.grey[300],
                                  child: Center(
                                    child: Icon(Icons.image_not_supported,
                                        size: 50, color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),

            // Product Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                product['product'] ?? 'No Title',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "₹${product['price']?.toStringAsFixed(2) ?? '0.00'}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            SizedBox(height: 10),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Text(
                    product['description'] ?? 'No description available',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),

            // Chat Icon & Buy Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  if (sellerId != currentUserId)
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {},
                        child: Text("Buy", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  SizedBox(width: 10),

                  // Show chat button only if the logged-in user is NOT the seller
                  if (sellerId != currentUserId)
                    IconButton(
                      icon: Icon(Icons.chat, color: Colors.black),
                      onPressed: () {
                        print(
                            "📲 Navigating to ChatScreen with seller ID: $sellerId");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(receiverId: sellerId),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
            FooterWidget(selectedIndex: 0),
          ],
        ),
      ),
    );
  }
}

// Full-Screen Image Viewer
class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Image.network(imageUrl, fit: BoxFit.contain),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
