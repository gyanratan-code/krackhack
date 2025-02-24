// // // // import 'package:flutter/material.dart';
// // // // import 'package:iit_marketing/views/footer.dart';
// // // // import 'package:iit_marketing/views/orders.dart';
// // // //
// // // // class HomePage extends StatefulWidget {
// // // //   @override
// // // //   State<HomePage> createState() => _HomePageState();
// // // // }
// // // //
// // // // class _HomePageState extends State<HomePage> {
// // // //   final List<String> banners = [
// // // //     'assets/images/i1.png',
// // // //     'assets/images/i2.png',
// // // //     'assets/images/i3.png',
// // // //     'assets/images/i4.png',
// // // //     'assets/images/i5.png',
// // // //     'assets/images/i6.png',
// // // //   ];
// // // //
// // // //   final Map<String, List<Map<String, String>>> categorizedProducts = {
// // // //     'Popular Items': List.generate(6, (index) => {
// // // //       'image': 'assets/images/i3.png',
// // // //       'brand': 'Brand ${(index % 4) + 1}',
// // // //       'name': 'Product ${(index % 4) + 1}',
// // // //       'price': '₹${(index + 1) * 100}',
// // // //     }),
// // // //     'Best Deals': List.generate(6, (index) => {
// // // //       'image': 'assets/images/i4.png',
// // // //       'brand': 'Brand ${(index % 4) + 1}',
// // // //       'name': 'Product ${(index % 4) + 1}',
// // // //       'price': '₹${(index + 1) * 150}',
// // // //     }),
// // // //     'New Arrivals': List.generate(6, (index) => {
// // // //       'image': 'assets/images/i5.png',
// // // //       'brand': 'Brand ${(index % 4) + 1}',
// // // //       'name': 'Product ${(index % 4) + 1}',
// // // //       'price': '₹${(index + 1) * 200}',
// // // //     }),
// // // //   };
// // // //
// // // //   int _currentBannerIndex = 0;
// // // //   final PageController _bannerController = PageController();
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //         // appBar: AppBar(
// // // //         //   // title: const Text(
// // // //         //   //   "IIT Mandi Marketplace",
// // // //         //   //   style: TextStyle(fontWeight: FontWeight.bold),
// // // //         //   // ),
// // // //         //   // backgroundColor: Colors.green[100], // Change this to any color you want
// // // //         // ),
// // // //
// // // //       body: SingleChildScrollView(
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             SizedBox(
// // // //               height: 44,
// // // //             ),
// // // //             // Center(
// // // //                 // child: Text("IIT Mandi Marketplace", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green[900]),)
// // // //             // ),
// // // //             // Padding(
// // // //             //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // // //             //   child: TextField(
// // // //             //     decoration: InputDecoration(
// // // //             //       hintText: 'Search',
// // // //             //       prefixIcon: Icon(Icons.search),
// // // //             //       border: OutlineInputBorder(
// // // //             //         borderRadius: BorderRadius.circular(8),
// // // //             //       ),
// // // //             //     ),
// // // //             //   ),
// // // //             // ),
// // // //             // History and Orders Buttons
// // // //             Padding(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
// // // //               child: Row(
// // // //                   children: [
// // // //                     Expanded(
// // // //                       child: OutlinedButton.icon(
// // // //                         onPressed: () {},
// // // //                         style: OutlinedButton.styleFrom(
// // // //                           padding: EdgeInsets.symmetric(vertical: 12), // More balanced padding
// // // //                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// // // //                           side: BorderSide(color: Colors.grey.shade300),
// // // //                         ),
// // // //                         icon: Icon(Icons.history, size: 18, color: Colors.blueAccent),
// // // //                         label: Text(
// // // //                           'History',
// // // //                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blueAccent),
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                     SizedBox(width: 8,),
// // // //                     Expanded(
// // // //                       child: OutlinedButton.icon(
// // // //                         onPressed: () {
// // // //                           Navigator.pushNamed(context, "/orders");
// // // //                         },
// // // //                         style: OutlinedButton.styleFrom(
// // // //                           padding: EdgeInsets.symmetric(vertical: 12),
// // // //                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// // // //                           side: BorderSide(color: Colors.grey.shade300),
// // // //                         ),
// // // //                         icon: Icon(Icons.shopping_cart, size: 18, color: Colors.green),
// // // //                         label: Text(
// // // //                           'Orders',
// // // //                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.green),
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 )
// // // //
// // // //             ),
// // // //
// // // //         SizedBox(
// // // //               height: 230,
// // // //               child: Column(
// // // //                 children: [
// // // //                   Expanded(
// // // //                     child: PageView.builder(
// // // //                       controller: _bannerController,
// // // //                       onPageChanged: (index) {
// // // //                         setState(() {
// // // //                           _currentBannerIndex = index;
// // // //                         });
// // // //                       },
// // // //                       itemCount: banners.length,
// // // //                       itemBuilder: (context, index) {
// // // //                         return Container(
// // // //                           width: MediaQuery.of(context).size.width,
// // // //                           margin: EdgeInsets.symmetric(horizontal: 8),
// // // //                           decoration: BoxDecoration(
// // // //                             borderRadius: BorderRadius.circular(10),
// // // //                             image: DecorationImage(
// // // //                               image: AssetImage(banners[index]),
// // // //                               fit: BoxFit.cover,
// // // //                             ),
// // // //                           ),
// // // //                         );
// // // //                       },
// // // //                     ),
// // // //                   ),
// // // //                   SizedBox(height: 10),
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // //                     children: List.generate(banners.length, (index) {
// // // //                       return Container(
// // // //                         margin: EdgeInsets.symmetric(horizontal: 4),
// // // //                         width: 8,
// // // //                         height: 8,
// // // //                         decoration: BoxDecoration(
// // // //                           shape: BoxShape.circle,
// // // //                           color: _currentBannerIndex == index
// // // //                               ? Colors.black
// // // //                               : Colors.grey,
// // // //                         ),
// // // //                       );
// // // //                     }),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             // Display each category title with horizontally scrolling products
// // // //             ...categorizedProducts.entries.map((category) {
// // // //               return Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   // Section Title
// // // //                   Padding(
// // // //                     padding: const EdgeInsets.all(8.0),
// // // //                     child: Text(
// // // //                       category.key,
// // // //                       style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                   ),
// // // //
// // // //                   // Horizontal Scrolling Row
// // // //                   SizedBox(
// // // //                     height: 220,
// // // //                     // child: ListView.builder(
// // // //                     //   scrollDirection: Axis.horizontal,
// // // //                     //   itemCount: category.value.length,
// // // //                     //   itemBuilder: (context, index) {
// // // //                     //     final product = category.value[index];
// // // //                     //     return Padding(
// // // //                     //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // // //                     //       child: Container(
// // // //                     //         width: 160,
// // // //                     //         decoration: BoxDecoration(
// // // //                     //           borderRadius: BorderRadius.circular(10),
// // // //                     //           color: Colors.grey[100],
// // // //                     //         ),
// // // //                     //         child: Column(
// // // //                     //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     //           children: [
// // // //                     //             Container(
// // // //                     //               height: 120,
// // // //                     //               decoration: BoxDecoration(
// // // //                     //                 borderRadius: BorderRadius.circular(10),
// // // //                     //                 image: DecorationImage(
// // // //                     //                   image: AssetImage(product['image']!),
// // // //                     //                   fit: BoxFit.cover,
// // // //                     //                 ),
// // // //                     //               ),
// // // //                     //             ),
// // // //                     //             SizedBox(height: 5),
// // // //                     //             Padding(
// // // //                     //               padding: const EdgeInsets.only(left: 8.0),
// // // //                     //               child: Text(
// // // //                     //                 product['brand']!,
// // // //                     //                 style: TextStyle(color: Colors.grey, fontSize: 14),
// // // //                     //               ),
// // // //                     //             ),
// // // //                     //             Padding(
// // // //                     //               padding: const EdgeInsets.only(left: 8.0),
// // // //                     //               child: Text(
// // // //                     //                 product['name']!,
// // // //                     //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //                     //               ),
// // // //                     //             ),
// // // //                     //             const Spacer(),
// // // //                     //             Padding(
// // // //                     //               padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
// // // //                     //               child: Text(
// // // //                     //                 product['price']!,
// // // //                     //                 style: TextStyle(
// // // //                     //                   fontSize: 14,
// // // //                     //                   fontWeight: FontWeight.bold,
// // // //                     //                   color: Colors.green,
// // // //                     //                 ),
// // // //                     //               ),
// // // //                     //             ),
// // // //                     //           ],
// // // //                     //         ),
// // // //                     //       ),
// // // //                     //     );
// // // //                     //   },
// // // //                     // ),
// // // //                     child : ListView.builder(
// // // //                       scrollDirection: Axis.horizontal,
// // // //                       itemCount: category.value.length,
// // // //                       itemBuilder: (context, index) {
// // // //                         final product = category.value[index];
// // // //                         return GestureDetector(
// // // //                           onTap: () {
// // // //                             Navigator.pushNamed(
// // // //                               context,
// // // //                               "/itemPage",
// // // //                             );
// // // //                           },
// // // //                           child: Padding(
// // // //                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // // //                             child: Container(
// // // //                               width: 160,
// // // //                               decoration: BoxDecoration(
// // // //                                 borderRadius: BorderRadius.circular(10),
// // // //                                 color: Colors.grey[100],
// // // //                               ),
// // // //                               child: Column(
// // // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                                 children: [
// // // //                                   Container(
// // // //                                     height: 120,
// // // //                                     decoration: BoxDecoration(
// // // //                                       borderRadius: BorderRadius.circular(10),
// // // //                                       image: DecorationImage(
// // // //                                         image: AssetImage(product['image']!),
// // // //                                         fit: BoxFit.cover,
// // // //                                       ),
// // // //                                     ),
// // // //                                   ),
// // // //                                   SizedBox(height: 5),
// // // //                                   Padding(
// // // //                                     padding: const EdgeInsets.only(left: 8.0),
// // // //                                     child: Text(
// // // //                                       product['brand']!,
// // // //                                       style: TextStyle(color: Colors.grey, fontSize: 14),
// // // //                                     ),
// // // //                                   ),
// // // //                                   Padding(
// // // //                                     padding: const EdgeInsets.only(left: 8.0),
// // // //                                     child: Text(
// // // //                                       product['name']!,
// // // //                                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //                                     ),
// // // //                                   ),
// // // //                                   const Spacer(),
// // // //                                   Padding(
// // // //                                     padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
// // // //                                     child: Text(
// // // //                                       product['price']!,
// // // //                                       style: TextStyle(
// // // //                                         fontSize: 14,
// // // //                                         fontWeight: FontWeight.bold,
// // // //                                         color: Colors.green,
// // // //                                       ),
// // // //                                     ),
// // // //                                   ),
// // // //                                 ],
// // // //                               ),
// // // //                             ),
// // // //                           ),
// // // //                         );
// // // //                       },
// // // //                     ),
// // // //
// // // //                   ),
// // // //                   SizedBox(height: 10),
// // // //                 ],
// // // //               );
// // // //             }).toList(),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //       bottomNavigationBar: FooterWidget(selectedIndex: 0),
// // // //     );
// // // //   }
// // // //   Widget buildProductSection(String title, Future<List<Map<String, dynamic>>>? future) {
// // // //     return Column(
// // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // //       children: [
// // // //         Padding(
// // // //           padding: const EdgeInsets.all(8.0),
// // // //           child: Text(title, style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
// // // //         ),
// // // //         SizedBox(
// // // //           height: 220,
// // // //           child: FutureBuilder<List<Map<String, dynamic>>>(
// // // //             future: future,
// // // //             builder: (context, snapshot) {
// // // //               if (snapshot.connectionState == ConnectionState.waiting) {
// // // //                 return Center(child: CircularProgressIndicator()); // Show loading spinner
// // // //               }
// // // //               if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
// // // //                 return Center(child: Text("No products found"));
// // // //               }
// // // //
// // // //               final products = snapshot.data!;
// // // //               return ListView.builder(
// // // //                 scrollDirection: Axis.horizontal,
// // // //                 itemCount: products.length,
// // // //                 itemBuilder: (context, index) {
// // // //                   final product = products[index];
// // // //                   return GestureDetector(
// // // //                     onTap: () {
// // // //                       Navigator.pushNamed(context, "/itemPage");
// // // //                     },
// // // //                     child: Padding(
// // // //                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // // //                       child: Container(
// // // //                         width: 160,
// // // //                         decoration: BoxDecoration(
// // // //                           borderRadius: BorderRadius.circular(10),
// // // //                           color: Colors.grey[100],
// // // //                         ),
// // // //                         child: Column(
// // // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                           children: [
// // // //                             Container(
// // // //                               height: 120,
// // // //                               decoration: BoxDecoration(
// // // //                                 borderRadius: BorderRadius.circular(10),
// // // //                                 image: DecorationImage(
// // // //                                   image: NetworkImage(product['thumbnail'] ?? ''),
// // // //                                   fit: BoxFit.cover,
// // // //                                 ),
// // // //                               ),
// // // //                             ),
// // // //                             const SizedBox(height: 5),
// // // //                             Padding(
// // // //                               padding: const EdgeInsets.only(left: 8.0),
// // // //                               child: Text(
// // // //                                 product['brand'] ?? '',
// // // //                                 style: TextStyle(color: Colors.grey, fontSize: 14),
// // // //                               ),
// // // //                             ),
// // // //                             Padding(
// // // //                               padding: const EdgeInsets.only(left: 8.0),
// // // //                               child: Text(
// // // //                                 product['product'] ?? '',
// // // //                                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //                               ),
// // // //                             ),
// // // //                             const Spacer(),
// // // //                             Padding(
// // // //                               padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
// // // //                               child: Text(
// // // //                                 "₹${product['price']?.toStringAsFixed(2) ?? ''}",
// // // //                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
// // // //                               ),
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               );
// // // //             },
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // // }
// // // //
// // // //
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:iit_marketing/views/footer.dart';
// // // import 'package:iit_marketing/views/orders.dart';
// // // import 'package:iit_marketing/services/product_services.dart';
// // //
// // // class HomePage extends StatefulWidget {
// // //   @override
// // //   State<HomePage> createState() => _HomePageState();
// // // }
// // //
// // // class _HomePageState extends State<HomePage> {
// // //   final ProductServices _productServices = ProductServices();
// // //
// // //   Future<List<Map<String, dynamic>>>? popularItemsFuture;
// // //   Future<List<Map<String, dynamic>>>? bestDealsFuture;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // Fetch products
// // //     popularItemsFuture = _productServices.getCredibleProducts();
// // //     bestDealsFuture = _productServices.getRecentProducts();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: SingleChildScrollView(
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             const SizedBox(height: 44),
// // //
// // //             // Popular Items (Credible Products)
// // //             buildProductSection("Popular Items", popularItemsFuture),
// // //
// // //             // Best Deals (Recent Products)
// // //             buildProductSection("Best Deals", bestDealsFuture),
// // //           ],
// // //         ),
// // //       ),
// // //       bottomNavigationBar: FooterWidget(selectedIndex: 0),
// // //     );
// // //   }
// // //
// // //   /// Widget to build product sections using FutureBuilder
// // //   Widget buildProductSection(String title, Future<List<Map<String, dynamic>>>? future) {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Padding(
// // //           padding: const EdgeInsets.all(8.0),
// // //           child: Text(title, style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
// // //         ),
// // //         SizedBox(
// // //           height: 220,
// // //           child: FutureBuilder<List<Map<String, dynamic>>>(
// // //             future: future,
// // //             builder: (context, snapshot) {
// // //               if (snapshot.connectionState == ConnectionState.waiting) {
// // //                 return Center(child: CircularProgressIndicator()); // Show loading spinner
// // //               }
// // //               if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
// // //                 return Center(child: Text("No products found"));
// // //               }
// // //
// // //               final products = snapshot.data!;
// // //               return ListView.builder(
// // //                 scrollDirection: Axis.horizontal,
// // //                 itemCount: products.length,
// // //                 itemBuilder: (context, index) {
// // //                   final product = products[index];
// // //                   return GestureDetector(
// // //                     onTap: () {
// // //                       Navigator.pushNamed(context, "/itemPage");
// // //                     },
// // //                     child: Padding(
// // //                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // //                       child: Container(
// // //                         width: 160,
// // //                         decoration: BoxDecoration(
// // //                           borderRadius: BorderRadius.circular(10),
// // //                           color: Colors.grey[100],
// // //                         ),
// // //                         child: Column(
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             Container(
// // //                               height: 120,
// // //                               decoration: BoxDecoration(
// // //                                 borderRadius: BorderRadius.circular(10),
// // //                                 image: DecorationImage(
// // //                                   image: NetworkImage(product['thumbnail'] ?? ''),
// // //                                   fit: BoxFit.cover,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                             const SizedBox(height: 5),
// // //                             Padding(
// // //                               padding: const EdgeInsets.only(left: 8.0),
// // //                               child: Text(
// // //                                 product['brand'] ?? '',
// // //                                 style: TextStyle(color: Colors.grey, fontSize: 14),
// // //                               ),
// // //                             ),
// // //                             Padding(
// // //                               padding: const EdgeInsets.only(left: 8.0),
// // //                               child: Text(
// // //                                 product['product'] ?? '',
// // //                                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // //                               ),
// // //                             ),
// // //                             const Spacer(),
// // //                             Padding(
// // //                               padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
// // //                               child: Text(
// // //                                 "₹${product['price']?.toStringAsFixed(2) ?? ''}",
// // //                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               );
// // //             },
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:iit_marketing/views/ItemPage.dart';
// // import 'package:iit_marketing/views/banner.dart';
// // import 'package:iit_marketing/views/footer.dart';
// // import 'package:iit_marketing/services/product_services.dart';
// //
// // class HomePage extends StatefulWidget {
// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   final ProductServices productServices = ProductServices();
// //
// //   int _currentBannerIndex = 0;
// //   final PageController _bannerController = PageController();
// //
// //   final List<String> banners = [
// //     'assets/images/i1.png',
// //     'assets/images/i2.png',
// //     'assets/images/i3.png',
// //     'assets/images/i4.png',
// //     'assets/images/i5.png',
// //     'assets/images/i6.png',
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             SizedBox(height: 44),
// //
// //             // History & Orders Buttons
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                     child: OutlinedButton.icon(
// //                       onPressed: () {},
// //                       icon: Icon(Icons.history, size: 18, color: Colors.blueAccent),
// //                       label: Text('History', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blueAccent)),
// //                       style: OutlinedButton.styleFrom(
// //                         padding: EdgeInsets.symmetric(vertical: 12),
// //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //                         side: BorderSide(color: Colors.grey.shade300),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(width: 8),
// //                   Expanded(
// //                     child: OutlinedButton.icon(
// //                       onPressed: () {
// //                         Navigator.pushNamed(context, "/orders");
// //                       },
// //                       icon: Icon(Icons.shopping_cart, size: 18, color: Colors.green),
// //                       label: Text('Orders', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.green)),
// //                       style: OutlinedButton.styleFrom(
// //                         padding: EdgeInsets.symmetric(vertical: 12),
// //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //                         side: BorderSide(color: Colors.grey.shade300),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             BannerCarousel(),
// //             // Popular Items (Fetched from Firestore - Recent Products)
// //             buildProductSection("Popular Items", productServices.getRecentProducts()),
// //
// //             // Best Deals (Fetched from Firestore - Credible Products)
// //             buildProductSection("Best Deals", productServices.getCredibleProducts()),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: FooterWidget(selectedIndex: 0),
// //     );
// //   }
// //
// //   Widget buildProductSection(String title, Future<List<Map<String, dynamic>>> future) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Text(title, style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
// //         ),
// //         SizedBox(
// //           height: 220,
// //           child: FutureBuilder<List<Map<String, dynamic>>>(
// //             future: future,
// //             builder: (context, snapshot) {
// //               if (snapshot.connectionState == ConnectionState.waiting) {
// //                 return Center(child: CircularProgressIndicator()); // Loading indicator
// //               }
// //               if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
// //                 return Center(child: Text("No products found"));
// //               }
// //
// //               final products = snapshot.data!;
// //               return ListView.builder(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: products.length,
// //                 itemBuilder: (context, index) {
// //                   final product = products[index];
// //                   return GestureDetector(
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => ItemPage(product: product),
// //                         ),
// //                       );
// //                     },
// //                     child: Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //                       child: Container(
// //                         width: 160,
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(10),
// //                           color: Colors.grey[100],
// //                         ),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Container(
// //                               height: 120,
// //                               decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(10),
// //                                 image: DecorationImage(
// //                                   image: NetworkImage(product['thumbnail'] ?? ''),
// //                                   fit: BoxFit.cover,
// //                                 ),
// //                               ),
// //                             ),
// //                             const SizedBox(height: 5),
// //                             Padding(
// //                               padding: const EdgeInsets.only(left: 8.0),
// //                               child: Text(
// //                                 product['brand'] ?? '',
// //                                 style: TextStyle(color: Colors.grey, fontSize: 14),
// //                               ),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.only(left: 8.0),
// //                               child: Text(
// //                                 product['product'] ?? '',
// //                                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                               ),
// //                             ),
// //                             const Spacer(),
// //                             Padding(
// //                               padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
// //                               child: Text(
// //                                 "₹${product['price']?.toStringAsFixed(2) ?? ''}",
// //                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               );
// //             },
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:iit_marketing/views/ItemPage.dart';
// import 'package:iit_marketing/views/banner.dart';
// import 'package:iit_marketing/views/footer.dart';
// import 'package:iit_marketing/services/product_services.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final ProductServices productServices = ProductServices();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 44),
//
//             // History & Orders Buttons
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Icon(Icons.history, size: 18, color: Colors.blueAccent),
//                       label: Text('History', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blueAccent)),
//                       style: OutlinedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                         side: BorderSide(color: Colors.grey.shade300),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: OutlinedButton.icon(
//                       onPressed: () {
//                         Navigator.pushNamed(context, "/orders");
//                       },
//                       icon: Icon(Icons.shopping_cart, size: 18, color: Colors.green),
//                       label: Text('Orders', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.green)),
//                       style: OutlinedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                         side: BorderSide(color: Colors.grey.shade300),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             BannerCarousel(),
//
//             // Popular Items (Fetched from Firestore - Recent Products)
//             buildProductSection("Popular Items", productServices.getRecentProducts()),
//
//             // Best Deals (Fetched from Firestore - Credible Products)
//             buildProductSection("Best Deals", productServices.getCredibleProducts()),
//           ],
//         ),
//       ),
//       bottomNavigationBar: FooterWidget(selectedIndex: 0),
//     );
//   }
//
//   Widget buildProductSection(String title, Future<List<Map<String, dynamic>>> future) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(title, style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
//         ),
//         SizedBox(
//           height: 220,
//           child: FutureBuilder<List<Map<String, dynamic>>>(
//             future: future,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator()); // Loading indicator
//               }
//               if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
//                 return Center(child: Text("No products found"));
//               }
//
//               final products = snapshot.data!;
//               return ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   final product = products[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ItemPage(product: product),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Container(
//                         width: 160,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey[100],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Image with loading indicator
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Container(
//                                     height: 120,
//                                     width: double.infinity,
//                                     color: Colors.grey[300], // Placeholder background
//                                     child: Center(child: CircularProgressIndicator()), // Show loading spinner
//                                   ),
//                                   Image.network(
//                                     product['thumbnail'] ?? '',
//                                     height: 120,
//                                     width: double.infinity,
//                                     fit: BoxFit.cover,
//                                     loadingBuilder: (context, child, loadingProgress) {
//                                       if (loadingProgress == null) return child;
//                                       return Container(
//                                         height: 120,
//                                         width: double.infinity,
//                                         color: Colors.grey[300], // Placeholder background
//                                         child: Center(child: CircularProgressIndicator()), // Show loading spinner
//                                       );
//                                     },
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Container(
//                                         height: 120,
//                                         width: double.infinity,
//                                         color: Colors.grey[300],
//                                         child: Center(
//                                           child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                             const SizedBox(height: 5),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 8.0),
//                               child: Text(
//                                 product['brand'] ?? '',
//                                 style: TextStyle(color: Colors.grey, fontSize: 14),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 8.0),
//                               child: Text(
//                                 product['product'] ?? '',
//                                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             const Spacer(),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                               child: Text(
//                                 "₹${product['price']?.toStringAsFixed(2) ?? ''}",
//                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//         FloatingActionButton(onPressed: ()async{
//           await FirebaseAuth.instance.signOut();
//           Navigator.pushReplacementNamed(context, "/login");
//         }, child: Icon(Icons.add),)
//       ],
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iit_marketing/views/ItemPage.dart';
import 'package:iit_marketing/views/banner.dart';
import 'package:iit_marketing/views/footer.dart';
import 'package:iit_marketing/services/product_services.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductServices productServices = ProductServices();

  @override
  void initState() {
    super.initState();
    setState(() {}); // Refresh UI when HomePage is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {}); // Reload the home page when pulled down
        },
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 44),

                // History & Orders Buttons
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.history,
                              size: 18, color: Colors.blueAccent),
                          label: Text('History',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueAccent)),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, "/orders");
                          },
                          icon: Icon(Icons.shopping_cart,
                              size: 18, color: Colors.green),
                          label: Text('Orders',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green)),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BannerCarousel(),

                // Popular Items (Fetched from Firestore - Recent Products)
                buildProductSection(
                    "Popular Items", productServices.getRecentProductsStream()),

                // Best Deals (Fetched from Firestore - Credible Products)
                buildProductSection(
                    "Best Deals", productServices.getCredibleProductsStream()),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FooterWidget(selectedIndex: 0),
    );
  }

  Widget buildProductSection(
      String title, Stream<List<Map<String, dynamic>>> stream) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 220,
          child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError || !snapshot.hasData ||
                  snapshot.data!.isEmpty) {
                return Center(child: Text("No products found"));
              }

              final products = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemPage(product: product),
                        ),
                      );
                    },
                    child: Padding(
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
                            // Image with loading indicator
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 120,
                                    width: double.infinity,
                                    color: Colors.grey[300],
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                  Image.network(
                                    product['thumbnail'] ?? '',
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child,
                                        loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        height: 120,
                                        width: double.infinity,
                                        color: Colors.grey[300],
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 120,
                                        width: double.infinity,
                                        color: Colors.grey[300],
                                        child: Center(
                                          child: Icon(Icons.image_not_supported,
                                              size: 40, color: Colors.grey),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                product['brand'] ?? '',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                product['product'] ?? '',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 2, // Limit to 2 lines
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis (...)
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, bottom: 8.0),
                              child: Text(
                                "₹${product['price']?.toStringAsFixed(2) ??
                                    ''}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        ElevatedButton(onPressed: () async{
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacementNamed(context, "/login");
        }, child: Text("Sign Out"))
      ],
    );
  }
}
