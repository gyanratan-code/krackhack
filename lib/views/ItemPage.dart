// // import 'package:flutter/material.dart';
// // import 'package:iit_marketing/views/footer.dart';
// //
// // class ItemPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   // Header
// //                   Padding(
// //                     padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
// //                     child: Row(
// //                       children: [
// //                         CircleAvatar(
// //                           radius: 20,
// //                           backgroundImage: AssetImage("assets/images/i3.png"),
// //                         ),
// //                         SizedBox(width: 10),
// //                         Text(
// //                           "Naman Shah",
// //                           style: TextStyle(
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //
// //                   SizedBox(height: 16),
// //
// //                   // Image
// //                   Container(
// //                     width: double.infinity,
// //                     height: 250,
// //                     decoration: BoxDecoration(
// //                       image: DecorationImage(
// //                         image: AssetImage("assets/images/i3.png"),
// //                         fit: BoxFit.cover,
// //                       ),
// //                     ),
// //                   ),
// //
// //                   Padding(
// //                     padding: const EdgeInsets.all(16.0),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         // Title
// //                         Text(
// //                           "Title Here",
// //                           style: TextStyle(
// //                             fontSize: 22,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                         SizedBox(height: 10),
// //
// //                         // Description (Scrollable inside Column)
// //                         Container(
// //                           height: 250,
// //                           child: SingleChildScrollView(
// //                             child: Text(
// //                               "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " * 10,
// //                               style: TextStyle(fontSize: 16),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //
// //           // Buy Button
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: SizedBox(
// //               width: screenWidth * 0.9,
// //               height: 50,
// //               child: ElevatedButton(
// //                 onPressed: () {},
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.black,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                 ),
// //                 child: Text(
// //                   "Buy",
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //
// //           // Footer (Non-Scrolling)
// //           FooterWidget(selectedIndex: 1),
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
//   final List<String> imagePaths = [
//     "assets/images/i1.png",
//     "assets/images/i2.png",
//     "assets/images/i3.png",
//     "assets/images/i4.png",
//     "assets/images/i5.png",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Profile Section
//           Padding(
//             padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 24,
//                   backgroundImage: AssetImage("assets/images/i3.png"),
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   "Naman Shah",
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
//               itemCount: imagePaths.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(imagePaths[index], fit: BoxFit.cover),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 10),
//
//           // Title
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(
//               "Amazing Product Title",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//
//           SizedBox(height: 10),
//
//           // Description
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: SingleChildScrollView(
//                 child: Text(
//                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " * 25,
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           ),
//
//           // Buy Button
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 minimumSize: Size(double.infinity, 50),
//               ),
//               onPressed: () {},
//               child: Text("Buy", style: TextStyle(fontSize: 18)),
//             ),
//           ),
//           FooterWidget(selectedIndex: 0)
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:iit_marketing/views/footer.dart';

class ItemPage extends StatelessWidget {
  final List<String> imagePaths = [
    "assets/images/i1.png",
    "assets/images/i2.png",
    "assets/images/i3.png",
    "assets/images/i4.png",
    "assets/images/i5.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Profile Section with Back Button
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage("assets/images/i3.png"),
                ),
                SizedBox(width: 10),
                Text(
                  "Naman Shah",
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
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(imagePaths[index], fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Amazing Product Title",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 10),

          // Description
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " * 25,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),

          // Buy Button
          Padding(
            padding: const EdgeInsets.all(16.0),
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
          FooterWidget(selectedIndex: 0)
        ],
      ),
    );
  }
}
