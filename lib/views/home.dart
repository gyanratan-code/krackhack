// // // // import 'package:flutter/material.dart';
// // // //
// // // // class HomePage extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: TextField(
// // // //           decoration: InputDecoration(
// // // //             hintText: 'Search',
// // // //             prefixIcon: Icon(Icons.search),
// // // //             border: OutlineInputBorder(
// // // //               borderRadius: BorderRadius.circular(8),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             Padding(
// // // //               padding: const EdgeInsets.all(8.0),
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   ElevatedButton.icon(
// // // //                     onPressed: () {},
// // // //                     icon: Icon(Icons.history),
// // // //                     label: Text('History'),
// // // //                   ),
// // // //                   ElevatedButton.icon(
// // // //                     onPressed: () {},
// // // //                     icon: Icon(Icons.shopping_cart),
// // // //                     label: Text('Orders'),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             Container(
// // // //               margin: EdgeInsets.all(8.0),
// // // //               height: 150,
// // // //               decoration: BoxDecoration(
// // // //                 borderRadius: BorderRadius.circular(10),
// // // //                 image: DecorationImage(
// // // //                   image: AssetImage('assets/images/i1.png'),
// // // //                   fit: BoxFit.cover,
// // // //                 ),
// // // //               ),
// // // //               child: Center(
// // // //                 child: Text(
// // // //                   'Banner title',
// // // //                   style: TextStyle(
// // // //                     color: Colors.white,
// // // //                     fontSize: 20,
// // // //                     fontWeight: FontWeight.bold,
// // // //                     backgroundColor: Colors.black54,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             Padding(
// // // //               padding: const EdgeInsets.all(8.0),
// // // //               child: Text(
// // // //                 'Title',
// // // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //               ),
// // // //             ),
// // // //             GridView.builder(
// // // //               shrinkWrap: true,
// // // //               physics: NeverScrollableScrollPhysics(),
// // // //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // // //                 crossAxisCount: 2,
// // // //                 crossAxisSpacing: 8,
// // // //                 mainAxisSpacing: 8,
// // // //                 childAspectRatio: 0.75,
// // // //               ),
// // // //               itemCount: 4,
// // // //               itemBuilder: (context, index) {
// // // //                 return Container(
// // // //                   decoration: BoxDecoration(
// // // //                     borderRadius: BorderRadius.circular(10),
// // // //                     image: DecorationImage(
// // // //                       image: AssetImage('assets/images/i${index + 1}.png'),
// // // //                       fit: BoxFit.cover,
// // // //                     ),
// // // //                   ),
// // // //                   child: Padding(
// // // //                     padding: const EdgeInsets.all(8.0),
// // // //                     child: Column(
// // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // //                       children: [
// // // //                         Text(
// // // //                           'Brand',
// // // //                           style: TextStyle(color: Colors.white70),
// // // //                         ),
// // // //                         Text(
// // // //                           'Product name',
// // // //                           style: TextStyle(
// // // //                             color: Colors.white,
// // // //                             fontWeight: FontWeight.bold,
// // // //                           ),
// // // //                         ),
// // // //                         Spacer(),
// // // //                         Text(
// // // //                           '\$10.99',
// // // //                           style: TextStyle(
// // // //                             color: Colors.white,
// // // //                             fontWeight: FontWeight.bold,
// // // //                           ),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ),
// // // //                 );
// // // //               },
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //       bottomNavigationBar: BottomNavigationBar(
// // // //         items: [
// // // //           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
// // // //           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
// // // //           BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
// // // //           BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // // import 'package:flutter/material.dart';
// // //
// // // class HomePage extends StatelessWidget {
// // //   final List<String> bannerImages = [
// // //     'assets/images/i5.png',
// // //     'assets/images/i6.png',
// // //     'assets/images/i7.png',
// // //   ];
// // //
// // //   final List<Map<String, String>> products = List.generate(18, (index) {
// // //     return {
// // //       'brand': 'Brand',
// // //       'name': 'Product name $index',
// // //       'price': '\$${(index + 1) * 2}.99',
// // //       'image': 'assets/images/i${(index % 3) + 1}.png',
// // //     };
// // //   });
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: TextField(
// // //           decoration: InputDecoration(
// // //             hintText: 'Search',
// // //             prefixIcon: Icon(Icons.search),
// // //             border: OutlineInputBorder(
// // //               borderRadius: BorderRadius.circular(8),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Padding(
// // //               padding: const EdgeInsets.all(8.0),
// // //               child: Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   ElevatedButton.icon(
// // //                     onPressed: () {},
// // //                     icon: Icon(Icons.history),
// // //                     label: Text('History'),
// // //                   ),
// // //                   ElevatedButton.icon(
// // //                     onPressed: () {},
// // //                     icon: Icon(Icons.shopping_cart),
// // //                     label: Text('Orders'),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             Container(
// // //               height: 150,
// // //               child: ListView.builder(
// // //                 scrollDirection: Axis.horizontal,
// // //                 itemCount: bannerImages.length,
// // //                 itemBuilder: (context, index) {
// // //                   return Container(
// // //                     width: MediaQuery.of(context).size.width * 0.8,
// // //                     margin: EdgeInsets.symmetric(horizontal: 8),
// // //                     decoration: BoxDecoration(
// // //                       borderRadius: BorderRadius.circular(10),
// // //                       image: DecorationImage(
// // //                         image: AssetImage(bannerImages[index]),
// // //                         fit: BoxFit.cover,
// // //                       ),
// // //                     ),
// // //                     child: Center(
// // //                       child: Text(
// // //                         'Banner ${index + 1}',
// // //                         style: TextStyle(
// // //                           color: Colors.white,
// // //                           fontSize: 20,
// // //                           fontWeight: FontWeight.bold,
// // //                           backgroundColor: Colors.black54,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //             Padding(
// // //               padding: const EdgeInsets.all(8.0),
// // //               child: Text(
// // //                 'Title',
// // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //               ),
// // //             ),
// // //             GridView.builder(
// // //               shrinkWrap: true,
// // //               physics: NeverScrollableScrollPhysics(),
// // //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //                 crossAxisCount: 3,
// // //                 crossAxisSpacing: 8,
// // //                 mainAxisSpacing: 8,
// // //                 childAspectRatio: 0.75,
// // //               ),
// // //               itemCount: products.length,
// // //               itemBuilder: (context, index) {
// // //                 return Container(
// // //                   decoration: BoxDecoration(
// // //                     borderRadius: BorderRadius.circular(10),
// // //                     image: DecorationImage(
// // //                       image: AssetImage(products[index]['image']!),
// // //                       fit: BoxFit.cover,
// // //                     ),
// // //                   ),
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.all(8.0),
// // //                     child: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         Text(
// // //                           products[index]['brand']!,
// // //                           style: TextStyle(color: Colors.white70),
// // //                         ),
// // //                         Text(
// // //                           products[index]['name']!,
// // //                           style: TextStyle(
// // //                             color: Colors.white,
// // //                             fontWeight: FontWeight.bold,
// // //                           ),
// // //                         ),
// // //                         Spacer(),
// // //                         Text(
// // //                           products[index]['price']!,
// // //                           style: TextStyle(
// // //                             color: Colors.white,
// // //                             fontWeight: FontWeight.bold,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       bottomNavigationBar: BottomNavigationBar(
// // //         items: [
// // //           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
// // //           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
// // //           BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
// // //           BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// // import 'package:flutter/material.dart';
// //
// // class HomePage extends StatelessWidget {
// //   final List<String> banners = [
// //     'assets/images/i1.png',
// //     'assets/images/i2.png'
// //   ];
// //
// //   final List<Map<String, String>> products = List.generate(12, (index) => {
// //     'image': 'assets/images/i3.png',
// //     'brand': 'Brand ${(index % 4) + 1}',
// //     'name': 'Product ${(index % 4) + 1}',
// //     'price': '₹${(index + 1) * 100}',
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: TextField(
// //           decoration: InputDecoration(
// //             hintText: 'Search',
// //             prefixIcon: Icon(Icons.search),
// //             border: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(8),
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   ElevatedButton.icon(
// //                     onPressed: () {},
// //                     icon: Icon(Icons.history),
// //                     label: Text('History'),
// //                   ),
// //                   ElevatedButton.icon(
// //                     onPressed: () {},
// //                     icon: Icon(Icons.shopping_cart),
// //                     label: Text('Orders'),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(
// //               height: 180,
// //               child: ListView.builder(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: banners.length,
// //                 itemBuilder: (context, index) {
// //                   return Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(10),
// //                         color: Colors.grey[500],
// //                       ),
// //                       child: Column(
// //                         children: [
// //                           Container(
// //                             margin: EdgeInsets.symmetric(horizontal: 8),
// //                             width: 300,
// //                             height: 150,
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(10),
// //                               image: DecorationImage(
// //                                 image: AssetImage(banners[index]),
// //                                 fit: BoxFit.cover,
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(height: 5),
// //                           Text(
// //                             'Banner ${index + 1}',
// //                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
// //                   child: Text(
// //                     'All items you can purchase...',
// //                     style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             GridView.builder(
// //               shrinkWrap: true,
// //               physics: NeverScrollableScrollPhysics(),
// //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 2,
// //                 crossAxisSpacing: 8,
// //                 mainAxisSpacing: 8,
// //                 childAspectRatio: 0.7,
// //               ),
// //               itemCount: products.length,
// //               itemBuilder: (context, index) {
// //                 final product = products[index];
// //                 return Padding(
// //                   padding: const EdgeInsets.all(4.0),
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(10),
// //                       color: Colors.grey[100],
// //                     ),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Container(
// //                           height: 120,
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(10),
// //                             image: DecorationImage(
// //                               image: AssetImage(product['image']!),
// //                               fit: BoxFit.cover,
// //                             ),
// //                           ),
// //                         ),
// //                         SizedBox(height: 5),
// //                         Padding(
// //                           padding: const EdgeInsets.only(left: 8.0),
// //                           child: Text(
// //                             product['brand']!,
// //                             style: TextStyle(color: Colors.grey, fontSize: 14),
// //                           ),
// //                         ),
// //                         Padding(
// //                           padding: const EdgeInsets.only(left: 8.0),
// //                           child: Text(
// //                             product['name']!,
// //                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                         Padding(
// //                           padding: const EdgeInsets.only(left: 8.0),
// //                           child: Text(
// //                             product['price']!,
// //                             style: TextStyle(
// //                               fontSize: 14,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.green,
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         items: [
// //           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
// //           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
// //           BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
// //           BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final List<String> banners = [
//     'assets/images/i1.png',
//     'assets/images/i2.png',
//     'assets/images/i3.png',
//     'assets/images/i5.png',
//     'assets/images/i6.png'
//   ];
//
//   final List<Map<String, String>> products = List.generate(12, (index) => {
//     'image': 'assets/images/i4.png',
//     'brand': 'Brand ${(index % 4) + 1}',
//     'name': 'Product ${(index % 4) + 1}',
//     'price': '₹${(index + 1) * 100}',
//   });
//
//   int _currentBannerIndex = 0;
//   final PageController _bannerController = PageController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           decoration: InputDecoration(
//             hintText: 'Search',
//             prefixIcon: Icon(Icons.search),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: Icon(Icons.history),
//                     label: Text('History'),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: Icon(Icons.shopping_cart),
//                     label: Text('Orders'),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 230,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: PageView.builder(
//                       controller: _bannerController,
//                       onPageChanged: (index) {
//                         setState(() {
//                           _currentBannerIndex = index;
//                         });
//                       },
//                       itemCount: banners.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           width: MediaQuery.of(context).size.width,
//                           margin: EdgeInsets.symmetric(horizontal: 8),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image: AssetImage(banners[index]),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(banners.length, (index) {
//                       return Container(
//                         margin: EdgeInsets.symmetric(horizontal: 4),
//                         width: 8,
//                         height: 8,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: _currentBannerIndex == index
//                               ? Colors.black
//                               : Colors.grey,
//                         ),
//                       );
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Text(
//                     'All items you can purchase...',
//                     style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//             GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8,
//                 mainAxisSpacing: 8,
//                 childAspectRatio: 0.75,
//               ),
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey[100],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 140,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image: AssetImage(product['image']!),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: Text(
//                             product['brand']!,
//                             style: TextStyle(color: Colors.grey, fontSize: 14),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: Text(
//                             product['name']!,
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         const Spacer(),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                           child: Text(
//                             product['price']!,
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.green,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, color: Colors.black26,), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.notifications, color: Colors.black26,), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black26,), label: ''),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:iit_marketing/views/footer.dart';
import 'package:iit_marketing/views/orders.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> banners = [
    'assets/images/i1.png',
    'assets/images/i2.png',
    'assets/images/i3.png',
    'assets/images/i4.png',
    'assets/images/i5.png',
    'assets/images/i6.png',
  ];

  final Map<String, List<Map<String, String>>> categorizedProducts = {
    'Popular Items': List.generate(6, (index) => {
      'image': 'assets/images/i3.png',
      'brand': 'Brand ${(index % 4) + 1}',
      'name': 'Product ${(index % 4) + 1}',
      'price': '₹${(index + 1) * 100}',
    }),
    'Best Deals': List.generate(6, (index) => {
      'image': 'assets/images/i4.png',
      'brand': 'Brand ${(index % 4) + 1}',
      'name': 'Product ${(index % 4) + 1}',
      'price': '₹${(index + 1) * 150}',
    }),
    'New Arrivals': List.generate(6, (index) => {
      'image': 'assets/images/i5.png',
      'brand': 'Brand ${(index % 4) + 1}',
      'name': 'Product ${(index % 4) + 1}',
      'price': '₹${(index + 1) * 200}',
    }),
  };

  int _currentBannerIndex = 0;
  final PageController _bannerController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   // title: const Text(
        //   //   "IIT Mandi Marketplace",
        //   //   style: TextStyle(fontWeight: FontWeight.bold),
        //   // ),
        //   // backgroundColor: Colors.green[100], // Change this to any color you want
        // ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 44,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            // History and Orders Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    icon: Icon(Icons.history, size: 18, color: Colors.blueAccent),
                    label: Text(
                      'History',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blueAccent),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/orders");
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    icon: Icon(Icons.shopping_cart, size: 18, color: Colors.green),
                    label: Text(
                      'Orders',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.green),
                    ),
                  ),

                ],
              ),
            ),


            // Banners (Fullscreen width, paginated)
            // SizedBox(
            //   height: 250,
            //   child: PageView.builder(
            //     itemCount: banners.length,
            //     itemBuilder: (context, index) {
            //       return Column(
            //        children: [
            //           Container(
            //             width: MediaQuery.of(context).size.width,
            //             height: 200,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               image: DecorationImage(
            //                 image: AssetImage(banners[index]),
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 5),
            //           Text(
            //             'Banner ${index + 1}',
            //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: 250, // Ensure a fixed height
            //   child: PageView.builder(
            //     itemCount: banners.length,
            //     itemBuilder: (context, index) {
            //       return Column(
            //         children: [
            //           Container(
            //             width: MediaQuery.of(context).size.width,
            //             height: 200,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               image: DecorationImage(
            //                 image: AssetImage(banners[index]),
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 5),
            //           Text(
            //             'Banner ${index + 1}',
            //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),
        SizedBox(
              height: 230,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _bannerController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentBannerIndex = index;
                        });
                      },
                      itemCount: banners.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(banners[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(banners.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentBannerIndex == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Display each category title with horizontally scrolling products
            ...categorizedProducts.entries.map((category) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category.key,
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Horizontal Scrolling Row
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.value.length,
                      itemBuilder: (context, index) {
                        final product = category.value[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(product['image']!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    product['brand']!,
                                    style: TextStyle(color: Colors.grey, fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    product['name']!,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                                  child: Text(
                                    product['price']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              );
            }).toList(),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: FooterWidget(selectedIndex: 0),
    );
  }
}
