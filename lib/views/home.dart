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
            // Center(
                // child: Text("IIT Mandi Marketplace", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green[900]),)
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: 'Search',
            //       prefixIcon: Icon(Icons.search),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //     ),
            //   ),
            // ),
            // History and Orders Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12), // More balanced padding
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        icon: Icon(Icons.history, size: 18, color: Colors.blueAccent),
                        label: Text(
                          'History',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, "/orders");
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        icon: Icon(Icons.shopping_cart, size: 18, color: Colors.green),
                        label: Text(
                          'Orders',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                )

            ),

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
                    // child: ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: category.value.length,
                    //   itemBuilder: (context, index) {
                    //     final product = category.value[index];
                    //     return Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //       child: Container(
                    //         width: 160,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color: Colors.grey[100],
                    //         ),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Container(
                    //               height: 120,
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 image: DecorationImage(
                    //                   image: AssetImage(product['image']!),
                    //                   fit: BoxFit.cover,
                    //                 ),
                    //               ),
                    //             ),
                    //             SizedBox(height: 5),
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 8.0),
                    //               child: Text(
                    //                 product['brand']!,
                    //                 style: TextStyle(color: Colors.grey, fontSize: 14),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 8.0),
                    //               child: Text(
                    //                 product['name']!,
                    //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //             const Spacer(),
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    //               child: Text(
                    //                 product['price']!,
                    //                 style: TextStyle(
                    //                   fontSize: 14,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.green,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    child : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.value.length,
                      itemBuilder: (context, index) {
                        final product = category.value[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/itemPage",
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
      bottomNavigationBar: FooterWidget(selectedIndex: 0),
    );
  }
}
