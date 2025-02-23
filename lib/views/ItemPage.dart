// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:iit_marketing/views/footer.dart';
// // // // // // // // //
// // // // // // // // // class ItemPage extends StatelessWidget {
// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     double screenWidth = MediaQuery.of(context).size.width;
// // // // // // // // //
// // // // // // // // //     return Scaffold(
// // // // // // // // //       body: Column(
// // // // // // // // //         children: [
// // // // // // // // //           Expanded(
// // // // // // // // //             child: SingleChildScrollView(
// // // // // // // // //               child: Column(
// // // // // // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //                 children: [
// // // // // // // // //                   // Header
// // // // // // // // //                   Padding(
// // // // // // // // //                     padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
// // // // // // // // //                     child: Row(
// // // // // // // // //                       children: [
// // // // // // // // //                         CircleAvatar(
// // // // // // // // //                           radius: 20,
// // // // // // // // //                           backgroundImage: AssetImage("assets/images/i3.png"),
// // // // // // // // //                         ),
// // // // // // // // //                         SizedBox(width: 10),
// // // // // // // // //                         Text(
// // // // // // // // //                           "Naman Shah",
// // // // // // // // //                           style: TextStyle(
// // // // // // // // //                             fontSize: 16,
// // // // // // // // //                             fontWeight: FontWeight.bold,
// // // // // // // // //                           ),
// // // // // // // // //                         ),
// // // // // // // // //                       ],
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //
// // // // // // // // //                   SizedBox(height: 16),
// // // // // // // // //
// // // // // // // // //                   // Image
// // // // // // // // //                   Container(
// // // // // // // // //                     width: double.infinity,
// // // // // // // // //                     height: 250,
// // // // // // // // //                     decoration: BoxDecoration(
// // // // // // // // //                       image: DecorationImage(
// // // // // // // // //                         image: AssetImage("assets/images/i3.png"),
// // // // // // // // //                         fit: BoxFit.cover,
// // // // // // // // //                       ),
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //
// // // // // // // // //                   Padding(
// // // // // // // // //                     padding: const EdgeInsets.all(16.0),
// // // // // // // // //                     child: Column(
// // // // // // // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //                       children: [
// // // // // // // // //                         // Title
// // // // // // // // //                         Text(
// // // // // // // // //                           "Title Here",
// // // // // // // // //                           style: TextStyle(
// // // // // // // // //                             fontSize: 22,
// // // // // // // // //                             fontWeight: FontWeight.bold,
// // // // // // // // //                           ),
// // // // // // // // //                         ),
// // // // // // // // //                         SizedBox(height: 10),
// // // // // // // // //
// // // // // // // // //                         // Description (Scrollable inside Column)
// // // // // // // // //                         Container(
// // // // // // // // //                           height: 250,
// // // // // // // // //                           child: SingleChildScrollView(
// // // // // // // // //                             child: Text(
// // // // // // // // //                               "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " * 10,
// // // // // // // // //                               style: TextStyle(fontSize: 16),
// // // // // // // // //                             ),
// // // // // // // // //                           ),
// // // // // // // // //                         ),
// // // // // // // // //                       ],
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                 ],
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //
// // // // // // // // //           // Buy Button
// // // // // // // // //           Padding(
// // // // // // // // //             padding: const EdgeInsets.all(16.0),
// // // // // // // // //             child: SizedBox(
// // // // // // // // //               width: screenWidth * 0.9,
// // // // // // // // //               height: 50,
// // // // // // // // //               child: ElevatedButton(
// // // // // // // // //                 onPressed: () {},
// // // // // // // // //                 style: ElevatedButton.styleFrom(
// // // // // // // // //                   backgroundColor: Colors.black,
// // // // // // // // //                   shape: RoundedRectangleBorder(
// // // // // // // // //                     borderRadius: BorderRadius.circular(8),
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //                 child: Text(
// // // // // // // // //                   "Buy",
// // // // // // // // //                   style: TextStyle(
// // // // // // // // //                     fontSize: 18,
// // // // // // // // //                     fontWeight: FontWeight.bold,
// // // // // // // // //                     color: Colors.white,
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //
// // // // // // // // //           // Footer (Non-Scrolling)
// // // // // // // // //           FooterWidget(selectedIndex: 1),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }
// // // // // // // //
// // // // // // // //
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:iit_marketing/views/footer.dart';
// // // // // // // //
// // // // // // // // class ItemPage extends StatelessWidget {
// // // // // // // //   final List<String> imagePaths = [
// // // // // // // //     "assets/images/i1.png",
// // // // // // // //     "assets/images/i2.png",
// // // // // // // //     "assets/images/i3.png",
// // // // // // // //     "assets/images/i4.png",
// // // // // // // //     "assets/images/i5.png",
// // // // // // // //   ];
// // // // // // // //
// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Scaffold(
// // // // // // // //       body: Column(
// // // // // // // //         children: [
// // // // // // // //           // Profile Section
// // // // // // // //           Padding(
// // // // // // // //             padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
// // // // // // // //             child: Row(
// // // // // // // //               children: [
// // // // // // // //                 CircleAvatar(
// // // // // // // //                   radius: 24,
// // // // // // // //                   backgroundImage: AssetImage("assets/images/i3.png"),
// // // // // // // //                 ),
// // // // // // // //                 SizedBox(width: 10),
// // // // // // // //                 Text(
// // // // // // // //                   "Naman Shah",
// // // // // // // //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // // // // //                 ),
// // // // // // // //               ],
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //           SizedBox(height: 10),
// // // // // // // //
// // // // // // // //           // Image Carousel
// // // // // // // //           SizedBox(
// // // // // // // //             height: 250,
// // // // // // // //             child: PageView.builder(
// // // // // // // //               itemCount: imagePaths.length,
// // // // // // // //               itemBuilder: (context, index) {
// // // // // // // //                 return Padding(
// // // // // // // //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // // // // // // //                   child: ClipRRect(
// // // // // // // //                     borderRadius: BorderRadius.circular(10),
// // // // // // // //                     child: Image.asset(imagePaths[index], fit: BoxFit.cover),
// // // // // // // //                   ),
// // // // // // // //                 );
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //           SizedBox(height: 10),
// // // // // // // //
// // // // // // // //           // Title
// // // // // // // //           Padding(
// // // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // // // // //             child: Text(
// // // // // // // //               "Amazing Product Title",
// // // // // // // //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //
// // // // // // // //           SizedBox(height: 10),
// // // // // // // //
// // // // // // // //           // Description
// // // // // // // //           Expanded(
// // // // // // // //             child: Padding(
// // // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // // // // //               child: SingleChildScrollView(
// // // // // // // //                 child: Text(
// // // // // // // //                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " * 25,
// // // // // // // //                   style: TextStyle(fontSize: 16),
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //
// // // // // // // //           // Buy Button
// // // // // // // //           Padding(
// // // // // // // //             padding: const EdgeInsets.all(16.0),
// // // // // // // //             child: ElevatedButton(
// // // // // // // //               style: ElevatedButton.styleFrom(
// // // // // // // //                 backgroundColor: Colors.black,
// // // // // // // //                 foregroundColor: Colors.white,
// // // // // // // //                 shape: RoundedRectangleBorder(
// // // // // // // //                   borderRadius: BorderRadius.circular(10),
// // // // // // // //                 ),
// // // // // // // //                 minimumSize: Size(double.infinity, 50),
// // // // // // // //               ),
// // // // // // // //               onPressed: () {},
// // // // // // // //               child: Text("Buy", style: TextStyle(fontSize: 18)),
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //           FooterWidget(selectedIndex: 0)
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }
// // // // // // //
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:iit_marketing/views/footer.dart';
// // // // // // //
// // // // // // // class ItemPage extends StatelessWidget {
// // // // // // //   final List<String> imagePaths = [
// // // // // // //     "assets/images/i1.png",
// // // // // // //     "assets/images/i2.png",
// // // // // // //     "assets/images/i3.png",
// // // // // // //     "assets/images/i4.png",
// // // // // // //     "assets/images/i5.png",
// // // // // // //   ];
// // // // // // //
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       body: Column(
// // // // // // //         children: [
// // // // // // //           // Profile Section with Back Button
// // // // // // //           Padding(
// // // // // // //             padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
// // // // // // //             child: Row(
// // // // // // //               children: [
// // // // // // //                 IconButton(
// // // // // // //                   icon: Icon(Icons.arrow_back),
// // // // // // //                   onPressed: () {
// // // // // // //                     Navigator.pop(context); // Navigate back
// // // // // // //                   },
// // // // // // //                 ),
// // // // // // //                 CircleAvatar(
// // // // // // //                   radius: 24,
// // // // // // //                   backgroundImage: AssetImage("assets/images/i3.png"),
// // // // // // //                 ),
// // // // // // //                 SizedBox(width: 10),
// // // // // // //                 Text(
// // // // // // //                   "Naman Shah",
// // // // // // //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           SizedBox(height: 10),
// // // // // // //
// // // // // // //           // Image Carousel
// // // // // // //           SizedBox(
// // // // // // //             height: 250,
// // // // // // //             child: PageView.builder(
// // // // // // //               itemCount: imagePaths.length,
// // // // // // //               itemBuilder: (context, index) {
// // // // // // //                 return Padding(
// // // // // // //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // // // // // //                   child: ClipRRect(
// // // // // // //                     borderRadius: BorderRadius.circular(10),
// // // // // // //                     child: Image.asset(imagePaths[index], fit: BoxFit.cover),
// // // // // // //                   ),
// // // // // // //                 );
// // // // // // //               },
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           SizedBox(height: 10),
// // // // // // //
// // // // // // //           // Title
// // // // // // //           Padding(
// // // // // // //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // // // //             child: Text(
// // // // // // //               "Amazing Product Title",
// // // // // // //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //
// // // // // // //           SizedBox(height: 10),
// // // // // // //
// // // // // // //           // Description
// // // // // // //           Expanded(
// // // // // // //             child: Padding(
// // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // // // //               child: SingleChildScrollView(
// // // // // // //                 child: Text(
// // // // // // //                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " * 25,
// // // // // // //                   style: TextStyle(fontSize: 16),
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //
// // // // // // //           // Buy Button
// // // // // // //           Padding(
// // // // // // //             padding: const EdgeInsets.all(16.0),
// // // // // // //             child: ElevatedButton(
// // // // // // //               style: ElevatedButton.styleFrom(
// // // // // // //                 backgroundColor: Colors.black,
// // // // // // //                 foregroundColor: Colors.white,
// // // // // // //                 shape: RoundedRectangleBorder(
// // // // // // //                   borderRadius: BorderRadius.circular(10),
// // // // // // //                 ),
// // // // // // //                 minimumSize: Size(double.infinity, 50),
// // // // // // //               ),
// // // // // // //               onPressed: () {},
// // // // // // //               child: Text("Buy", style: TextStyle(fontSize: 18)),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           FooterWidget(selectedIndex: 0)
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // //
// // // // // //
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:iit_marketing/views/footer.dart';
// // // // // //
// // // // // // class ItemPage extends StatelessWidget {
// // // // // //   final Map<String, dynamic> product;
// // // // // //
// // // // // //   ItemPage({required this.product});
// // // // // //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     List<String> images = List<String>.from(product['image'] ?? []);
// // // // // //     String thumbnail = product['thumbnail'] ?? '';
// // // // // //
// // // // // //     return Scaffold(
// // // // // //       body: Column(
// // // // // //         children: [
// // // // // //           // Profile Section with Back Button
// // // // // //           Padding(
// // // // // //             padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
// // // // // //             child: Row(
// // // // // //               children: [
// // // // // //                 IconButton(
// // // // // //                   icon: Icon(Icons.arrow_back),
// // // // // //                   onPressed: () {
// // // // // //                     Navigator.pop(context);
// // // // // //                   },
// // // // // //                 ),
// // // // // //                 CircleAvatar(
// // // // // //                   radius: 24,
// // // // // //                   backgroundImage: NetworkImage(thumbnail), // Show seller profile image
// // // // // //                 ),
// // // // // //                 SizedBox(width: 10),
// // // // // //                 Text(
// // // // // //                   product['brand'] ?? 'Unknown Brand',
// // // // // //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //           SizedBox(height: 10),
// // // // // //
// // // // // //           // Image Carousel
// // // // // //           SizedBox(
// // // // // //             height: 250,
// // // // // //             child: PageView.builder(
// // // // // //               itemCount: images.length,
// // // // // //               itemBuilder: (context, index) {
// // // // // //                 return Padding(
// // // // // //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // // // // //                   child: ClipRRect(
// // // // // //                     borderRadius: BorderRadius.circular(10),
// // // // // //                     child: Image.network(images[index], fit: BoxFit.cover),
// // // // // //                   ),
// // // // // //                 );
// // // // // //               },
// // // // // //             ),
// // // // // //           ),
// // // // // //           SizedBox(height: 10),
// // // // // //
// // // // // //           // Product Title
// // // // // //           Padding(
// // // // // //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // // //             child: Text(
// // // // // //               product['product'] ?? 'No Title',
// // // // // //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // // // // //             ),
// // // // // //           ),
// // // // // //           SizedBox(height: 10),
// // // // // //
// // // // // //           // Price
// // // // // //           Padding(
// // // // // //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // // //             child: Text(
// // // // // //               "₹${product['price']?.toStringAsFixed(2) ?? '0.00'}",
// // // // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
// // // // // //             ),
// // // // // //           ),
// // // // // //           SizedBox(height: 10),
// // // // // //
// // // // // //           // Description
// // // // // //           Expanded(
// // // // // //             child: Padding(
// // // // // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // // //               child: SingleChildScrollView(
// // // // // //                 child: Text(
// // // // // //                   product['description'] ?? 'No description available',
// // // // // //                   style: TextStyle(fontSize: 16),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //
// // // // // //           // Buy Button
// // // // // //           Padding(
// // // // // //             padding: const EdgeInsets.all(16.0),
// // // // // //             child: ElevatedButton(
// // // // // //               style: ElevatedButton.styleFrom(
// // // // // //                 backgroundColor: Colors.black,
// // // // // //                 foregroundColor: Colors.white,
// // // // // //                 shape: RoundedRectangleBorder(
// // // // // //                   borderRadius: BorderRadius.circular(10),
// // // // // //                 ),
// // // // // //                 minimumSize: Size(double.infinity, 50),
// // // // // //               ),
// // // // // //               onPressed: () {},
// // // // // //               child: Text("Buy", style: TextStyle(fontSize: 18)),
// // // // // //             ),
// // // // // //           ),
// // // // // //           FooterWidget(selectedIndex: 0)
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // //
// // // // //
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:iit_marketing/views/footer.dart';
// // // // //
// // // // // class ItemPage extends StatelessWidget {
// // // // //   final Map<String, dynamic> product;
// // // // //
// // // // //   ItemPage({required this.product});
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     // Ensure the thumbnail is always the first image
// // // // //     String thumbnail = product['thumbnail'] ?? '';
// // // // //     List<String> additionalImages = List<String>.from(product['image'] ?? []);
// // // // //
// // // // //     // Combine thumbnail as the first image in the list
// // // // //     List<String> allImages = [thumbnail, ...additionalImages];
// // // // //
// // // // //     return Scaffold(
// // // // //       body: Column(
// // // // //         children: [
// // // // //           // Profile Section with Back Button
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
// // // // //             child: Row(
// // // // //               children: [
// // // // //                 IconButton(
// // // // //                   icon: Icon(Icons.arrow_back),
// // // // //                   onPressed: () {
// // // // //                     Navigator.pop(context);
// // // // //                   },
// // // // //                 ),
// // // // //                 CircleAvatar(
// // // // //                   radius: 24,
// // // // //                   backgroundImage: NetworkImage(thumbnail), // Show seller profile image
// // // // //                 ),
// // // // //                 SizedBox(width: 10),
// // // // //                 Text(
// // // // //                   product['brand'] ?? 'Unknown Brand',
// // // // //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //           SizedBox(height: 10),
// // // // //
// // // // //           // Image Carousel
// // // // //           SizedBox(
// // // // //             height: 250,
// // // // //             child: PageView.builder(
// // // // //               itemCount: allImages.length,
// // // // //               itemBuilder: (context, index) {
// // // // //                 return Padding(
// // // // //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // // // //                   child: ClipRRect(
// // // // //                     borderRadius: BorderRadius.circular(10),
// // // // //                     child: Image.network(allImages[index], fit: BoxFit.cover),
// // // // //                   ),
// // // // //                 );
// // // // //               },
// // // // //             ),
// // // // //           ),
// // // // //           SizedBox(height: 10),
// // // // //
// // // // //           // Product Title
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // //             child: Text(
// // // // //               product['product'] ?? 'No Title',
// // // // //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //           ),
// // // // //           SizedBox(height: 10),
// // // // //
// // // // //           // Price
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // //             child: Text(
// // // // //               "₹${product['price']?.toStringAsFixed(2) ?? '0.00'}",
// // // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
// // // // //             ),
// // // // //           ),
// // // // //           SizedBox(height: 10),
// // // // //
// // // // //           // Description
// // // // //           Expanded(
// // // // //             child: Padding(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // // //               child: SingleChildScrollView(
// // // // //                 child: Text(
// // // // //                   product['description'] ?? 'No description available',
// // // // //                   style: TextStyle(fontSize: 16),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //
// // // // //           // Buy Button
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.all(16.0),
// // // // //             child: ElevatedButton(
// // // // //               style: ElevatedButton.styleFrom(
// // // // //                 backgroundColor: Colors.black,
// // // // //                 foregroundColor: Colors.white,
// // // // //                 shape: RoundedRectangleBorder(
// // // // //                   borderRadius: BorderRadius.circular(10),
// // // // //                 ),
// // // // //                 minimumSize: Size(double.infinity, 50),
// // // // //               ),
// // // // //               onPressed: () {},
// // // // //               child: Text("Buy", style: TextStyle(fontSize: 18)),
// // // // //             ),
// // // // //           ),
// // // // //           FooterWidget(selectedIndex: 0)
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // //
// // // // import 'package:flutter/material.dart';
// // // // import 'package:iit_marketing/views/footer.dart';
// // // //
// // // // class ItemPage extends StatelessWidget {
// // // //   final Map<String, dynamic> product;
// // // //
// // // //   ItemPage({required this.product});
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     // Ensure the thumbnail is always the first image
// // // //     String thumbnail = product['thumbnail'] ?? '';
// // // //     List<String> additionalImages = List<String>.from(product['image'] ?? []);
// // // //
// // // //     // Combine thumbnail as the first image in the list
// // // //     List<String> allImages = [thumbnail, ...additionalImages];
// // // //
// // // //     return Scaffold(
// // // //       body: Column(
// // // //         children: [
// // // //           // Profile Section with Back Button
// // // //           Padding(
// // // //             padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
// // // //             child: Row(
// // // //               children: [
// // // //                 IconButton(
// // // //                   icon: Icon(Icons.arrow_back),
// // // //                   onPressed: () {
// // // //                     Navigator.pop(context);
// // // //                   },
// // // //                 ),
// // // //                 CircleAvatar(
// // // //                   radius: 24,
// // // //                   backgroundImage: NetworkImage(thumbnail), // Show seller profile image
// // // //                 ),
// // // //                 SizedBox(width: 10),
// // // //                 Text(
// // // //                   product['brand'] ?? 'Unknown Brand',
// // // //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //           SizedBox(height: 10),
// // // //
// // // //           // Image Carousel
// // // //           SizedBox(
// // // //             height: 250,
// // // //             child: PageView.builder(
// // // //               itemCount: allImages.length,
// // // //               itemBuilder: (context, index) {
// // // //                 return Padding(
// // // //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // // //                   child: ClipRRect(
// // // //                     borderRadius: BorderRadius.circular(10),
// // // //                     child: Image.network(allImages[index], fit: BoxFit.cover),
// // // //                   ),
// // // //                 );
// // // //               },
// // // //             ),
// // // //           ),
// // // //           SizedBox(height: 10),
// // // //
// // // //           // Product Title
// // // //           Padding(
// // // //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // //             child: Text(
// // // //               product['product'] ?? 'No Title',
// // // //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // // //             ),
// // // //           ),
// // // //           SizedBox(height: 10),
// // // //
// // // //           // Price
// // // //           Padding(
// // // //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // //             child: Text(
// // // //               "₹${product['price']?.toStringAsFixed(2) ?? '0.00'}",
// // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
// // // //             ),
// // // //           ),
// // // //           SizedBox(height: 10),
// // // //
// // // //           // Description
// // // //           Expanded(
// // // //             child: Padding(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // // //               child: SingleChildScrollView(
// // // //                 child: Text(
// // // //                   product['description'] ?? 'No description available',
// // // //                   style: TextStyle(fontSize: 16),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ),
// // // //
// // // //           // Chat Icon & Buy Button
// // // //           Padding(
// // // //             padding: const EdgeInsets.all(16.0),
// // // //             child: Row(
// // // //               children: [
// // // //                 // Buy Button
// // // //                 Expanded(
// // // //                   child: ElevatedButton(
// // // //                     style: ElevatedButton.styleFrom(
// // // //                       backgroundColor: Colors.black,
// // // //                       foregroundColor: Colors.white,
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(10),
// // // //                       ),
// // // //                       minimumSize: Size(double.infinity, 50),
// // // //                     ),
// // // //                     onPressed: () {},
// // // //                     child: Text("Buy", style: TextStyle(fontSize: 18)),
// // // //                   ),
// // // //                 ),
// // // //                 SizedBox(width: 10,),
// // // //                 IconButton(
// // // //                   icon: Icon(Icons.chat, color: Colors.black),
// // // //                   onPressed: () {
// // // //                     // Add chat functionality here
// // // //                   },
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //           FooterWidget(selectedIndex: 0)
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:iit_marketing/views/footer.dart';
// // //
// // // class ItemPage extends StatelessWidget {
// // //   final Map<String, dynamic> product;
// // //
// // //   ItemPage({required this.product});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // Ensure the thumbnail is always the first image
// // //     String thumbnail = product['thumbnail'] ?? '';
// // //     List<String> additionalImages = List<String>.from(product['image'] ?? []);
// // //
// // //     // Combine thumbnail as the first image in the list
// // //     List<String> allImages = [thumbnail, ...additionalImages];
// // //
// // //     return Scaffold(
// // //       body: Column(
// // //         children: [
// // //           // Profile Section with Back Button
// // //           Padding(
// // //             padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
// // //             child: Row(
// // //               children: [
// // //                 IconButton(
// // //                   icon: Icon(Icons.arrow_back),
// // //                   onPressed: () {
// // //                     Navigator.pop(context);
// // //                   },
// // //                 ),
// // //                 // Profile Image with Loading Indicator
// // //                 ClipRRect(
// // //                   borderRadius: BorderRadius.circular(24),
// // //                   child: Stack(
// // //                     alignment: Alignment.center,
// // //                     children: [
// // //                       Container(
// // //                         width: 48,
// // //                         height: 48,
// // //                         color: Colors.grey[300], // Placeholder background
// // //                         child: Center(child: CircularProgressIndicator()), // Show loading spinner
// // //                       ),
// // //                       Image.network(
// // //                         thumbnail,
// // //                         width: 48,
// // //                         height: 48,
// // //                         fit: BoxFit.cover,
// // //                         loadingBuilder: (context, child, loadingProgress) {
// // //                           if (loadingProgress == null) return child;
// // //                           return Container(
// // //                             width: 48,
// // //                             height: 48,
// // //                             color: Colors.grey[300],
// // //                             child: Center(child: CircularProgressIndicator()),
// // //                           );
// // //                         },
// // //                         errorBuilder: (context, error, stackTrace) {
// // //                           return Container(
// // //                             width: 48,
// // //                             height: 48,
// // //                             color: Colors.grey[300],
// // //                             child: Center(
// // //                               child: Icon(Icons.person, size: 24, color: Colors.grey),
// // //                             ),
// // //                           );
// // //                         },
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //                 SizedBox(width: 10),
// // //                 Text(
// // //                   product['brand'] ?? 'Unknown Brand',
// // //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //           SizedBox(height: 10),
// // //
// // //           // Image Carousel with Loading Indicators
// // //           SizedBox(
// // //             height: 250,
// // //             child: PageView.builder(
// // //               itemCount: allImages.length,
// // //               itemBuilder: (context, index) {
// // //                 return Padding(
// // //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // //                   child: ClipRRect(
// // //                     borderRadius: BorderRadius.circular(10),
// // //                     child: Stack(
// // //                       alignment: Alignment.center,
// // //                       children: [
// // //                         Container(
// // //                           height: 250,
// // //                           color: Colors.grey[300], // Placeholder background
// // //                           child: Center(child: CircularProgressIndicator()), // Show loading spinner
// // //                         ),
// // //                         Image.network(
// // //                           allImages[index],
// // //                           height: 250,
// // //                           width: double.infinity,
// // //                           fit: BoxFit.cover,
// // //                           loadingBuilder: (context, child, loadingProgress) {
// // //                             if (loadingProgress == null) return child;
// // //                             return Container(
// // //                               height: 250,
// // //                               color: Colors.grey[300],
// // //                               child: Center(child: CircularProgressIndicator()),
// // //                             );
// // //                           },
// // //                           errorBuilder: (context, error, stackTrace) {
// // //                             return Container(
// // //                               height: 250,
// // //                               color: Colors.grey[300],
// // //                               child: Center(
// // //                                 child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
// // //                               ),
// // //                             );
// // //                           },
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //           SizedBox(height: 10),
// // //
// // //           // Product Title
// // //           Padding(
// // //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // //             child: Text(
// // //               product['product'] ?? 'No Title',
// // //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// // //             ),
// // //           ),
// // //           SizedBox(height: 10),
// // //
// // //           // Price
// // //           Padding(
// // //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // //             child: Text(
// // //               "₹${product['price']?.toStringAsFixed(2) ?? '0.00'}",
// // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
// // //             ),
// // //           ),
// // //           SizedBox(height: 10),
// // //
// // //           // Description
// // //           Expanded(
// // //             child: Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// // //               child: SingleChildScrollView(
// // //                 child: Text(
// // //                   product['description'] ?? 'No description available',
// // //                   style: TextStyle(fontSize: 16),
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //
// // //           // Chat Icon & Buy Button
// // //           Padding(
// // //             padding: const EdgeInsets.all(16.0),
// // //             child: Row(
// // //               children: [
// // //                 // Buy Button
// // //                 Expanded(
// // //                   child: ElevatedButton(
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: Colors.black,
// // //                       foregroundColor: Colors.white,
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(10),
// // //                       ),
// // //                       minimumSize: Size(double.infinity, 50),
// // //                     ),
// // //                     onPressed: () {},
// // //                     child: Text("Buy", style: TextStyle(fontSize: 18)),
// // //                   ),
// // //                 ),
// // //                 SizedBox(width: 10),
// // //                 IconButton(
// // //                   icon: Icon(Icons.chat, color: Colors.black),
// // //                   onPressed: () {
// // //                     // Add chat functionality here
// // //                   },
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //           FooterWidget(selectedIndex: 0),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:iit_marketing/views/footer.dart';
// //
// // class ItemPage extends StatelessWidget {
// //   final Map<String, dynamic> product;
// //
// //   ItemPage({required this.product});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Ensure the thumbnail is always the first image
// //     String thumbnail = product['thumbnail'] ?? '';
// //     List<String> additionalImages = List<String>.from(product['image'] ?? []);
// //
// //     // Combine thumbnail as the first image in the list
// //     List<String> allImages = [thumbnail, ...additionalImages];
// //
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           // Profile Section with Back Button
// //           Padding(
// //             padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
// //             child: Row(
// //               children: [
// //                 IconButton(
// //                   icon: Icon(Icons.arrow_back),
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                   },
// //                 ),
// //                 // Profile Image (Always i2.png)
// //                 ClipRRect(
// //                   borderRadius: BorderRadius.circular(24),
// //                   child: Image.asset(
// //                     "assets/images/user.png",
// //                     width: 48,
// //                     height: 48,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //                 SizedBox(width: 10),
// //                 Text(
// //                   product['brand'] ?? 'Unknown Brand',
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           SizedBox(height: 10),
// //
// //           // Image Carousel with Loading Indicators
// //           SizedBox(
// //             height: 250,
// //             child: PageView.builder(
// //               itemCount: allImages.length,
// //               itemBuilder: (context, index) {
// //                 return Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadius.circular(10),
// //                     child: Stack(
// //                       alignment: Alignment.center,
// //                       children: [
// //                         Container(
// //                           height: 250,
// //                           color: Colors.grey[300], // Placeholder background
// //                           child: Center(child: CircularProgressIndicator()), // Show loading spinner
// //                         ),
// //                         Image.network(
// //                           allImages[index],
// //                           height: 250,
// //                           width: double.infinity,
// //                           fit: BoxFit.cover,
// //                           loadingBuilder: (context, child, loadingProgress) {
// //                             if (loadingProgress == null) return child;
// //                             return Container(
// //                               height: 250,
// //                               color: Colors.grey[300],
// //                               child: Center(child: CircularProgressIndicator()),
// //                             );
// //                           },
// //                           errorBuilder: (context, error, stackTrace) {
// //                             return Container(
// //                               height: 250,
// //                               color: Colors.grey[300],
// //                               child: Center(
// //                                 child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           SizedBox(height: 10),
// //
// //           // Product Title
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             child: Text(
// //               product['product'] ?? 'No Title',
// //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //           SizedBox(height: 10),
// //
// //           // Price
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             child: Text(
// //               "₹${product['price']?.toStringAsFixed(2) ?? '0.00'}",
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
// //             ),
// //           ),
// //           SizedBox(height: 10),
// //
// //           // Description
// //           Expanded(
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //               child: SingleChildScrollView(
// //                 child: Text(
// //                   product['description'] ?? 'No description available',
// //                   style: TextStyle(fontSize: 16),
// //                 ),
// //               ),
// //             ),
// //           ),
// //
// //           // Chat Icon & Buy Button
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Row(
// //               children: [
// //                 // Buy Button
// //                 Expanded(
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.black,
// //                       foregroundColor: Colors.white,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       minimumSize: Size(double.infinity, 50),
// //                     ),
// //                     onPressed: () {},
// //                     child: Text("Buy", style: TextStyle(fontSize: 18)),
// //                   ),
// //                 ),
// //                 SizedBox(width: 10),
// //                 IconButton(
// //                   icon: Icon(Icons.chat, color: Colors.black),
// //                   onPressed: () {
// //                     // Add chat functionality here
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //           FooterWidget(selectedIndex: 0),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:iit_marketing/views/footer.dart';
//
// class ItemPage extends StatelessWidget {
//   final Map<String, dynamic> product;
//
//   ItemPage({required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     String thumbnail = product['thumbnail'] ?? '';
//     List<String> additionalImages = List<String>.from(product['image'] ?? []);
//     List<String> allImages = [thumbnail, ...additionalImages];
//
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(24),
//                   child: Image.asset(
//                     "assets/images/user.png",
//                     width: 48,
//                     height: 48,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   product['brand'] ?? 'Unknown Brand',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10),
//
//           // Image Carousel
//           SizedBox(
//             height: 250,
//             child: PageView.builder(
//               itemCount: allImages.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => FullScreenImage(imageUrl: allImages[index]),
//                       ),
//                     );
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Container(
//                             height: 250,
//                             color: Colors.grey[300],
//                             child: Center(child: CircularProgressIndicator()),
//                           ),
//                           Image.network(
//                             allImages[index],
//                             height: 250,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                             loadingBuilder: (context, child, loadingProgress) {
//                               if (loadingProgress == null) return child;
//                               return Container(
//                                 height: 250,
//                                 color: Colors.grey[300],
//                                 child: Center(child: CircularProgressIndicator()),
//                               );
//                             },
//                             errorBuilder: (context, error, stackTrace) {
//                               return Container(
//                                 height: 250,
//                                 color: Colors.grey[300],
//                                 child: Center(
//                                   child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 10),
//
//           // Product Title
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(
//               product['product'] ?? 'No Title',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(height: 10),
//
//           // Price
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(
//               "₹${product['price']?.toStringAsFixed(2) ?? '0.00'}",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
//             ),
//           ),
//           SizedBox(height: 10),
//
//           // Description
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: SingleChildScrollView(
//                 child: Text(
//                   product['description'] ?? 'No description available',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           ),
//
//           // Chat Icon & Buy Button
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       minimumSize: Size(double.infinity, 50),
//                     ),
//                     onPressed: () {},
//                     child: Text("Buy", style: TextStyle(fontSize: 18)),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 IconButton(
//                   icon: Icon(Icons.chat, color: Colors.black),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ),
//           FooterWidget(selectedIndex: 0),
//         ],
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


import 'package:flutter/material.dart';
import 'package:iit_marketing/views/footer.dart';
import 'chat_screen.dart'; // Import ChatScreen

class ItemPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ItemPage({required this.product});

  @override
  Widget build(BuildContext context) {
    String thumbnail = product['thumbnail'] ?? '';
    List<String> additionalImages = List<String>.from(product['image'] ?? []);
    List<String> allImages = [thumbnail, ...additionalImages];
    String sellerId = product['sellerId'] ?? ''; // Assuming sellerId exists in product

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
                  Text(
                    product['brand'] ?? 'Unknown Brand',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          builder: (context) => FullScreenImage(imageUrl: allImages[index]),
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
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  height: 250,
                                  color: Colors.grey[300],
                                  child: Center(child: CircularProgressIndicator()),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 250,
                                  color: Colors.grey[300],
                                  child: Center(
                                    child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
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
                  IconButton(
                    icon: Icon(Icons.chat, color: Colors.black),
                    onPressed: () {
                      print("📲 Navigating to ChatScreen with seller ID: $sellerId");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(receiverId: sellerId),
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
      backgroundColor: Colors.black, // Black background
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
