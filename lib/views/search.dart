// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:iit_marketing/services/product_services.dart'; // adjust the import path
// // //
// // // class SearchPage extends StatefulWidget {
// // //   const SearchPage({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   _SearchPageState createState() => _SearchPageState();
// // // }
// // //
// // // class _SearchPageState extends State<SearchPage> {
// // //   final ProductServices _productServices = ProductServices();
// // //
// // //   String _searchQuery = "";
// // //   RangeValues _priceRange = const RangeValues(0, 10000);
// // //   Timer? _debounce;
// // //
// // //   double get _minPrice => _priceRange.start;
// // //   double get _maxPrice => _priceRange.end;
// // //
// // //   // Debounce search input to limit updates
// // //   void _onSearchChanged(String value) {
// // //     if (_debounce?.isActive ?? false) _debounce!.cancel();
// // //     _debounce = Timer(const Duration(milliseconds: 500), () {
// // //       setState(() {
// // //         _searchQuery = value;
// // //       });
// // //     });
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _debounce?.cancel();
// // //     super.dispose();
// // //   }
// // //
// // //   // Price range selection widget
// // //   Widget _buildPriceRangeSelector() {
// // //     return Padding(
// // //       padding: const EdgeInsets.all(8.0),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Text('Price Range: \$${_minPrice.toInt()} - \$${_maxPrice.toInt()}'),
// // //           RangeSlider(
// // //             min: 0,
// // //             max: 10000,
// // //             divisions: 100,
// // //             values: _priceRange,
// // //             onChanged: (RangeValues values) {
// // //               setState(() {
// // //                 _priceRange = values;
// // //               });
// // //             },
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: const Text("Search Products")),
// // //       body: Column(
// // //         children: [
// // //           // Price range selector
// // //           _buildPriceRangeSelector(),
// // //           // Search text field
// // //           Padding(
// // //             padding: const EdgeInsets.all(8.0),
// // //             child: TextField(
// // //               decoration: const InputDecoration(
// // //                 labelText: "Search",
// // //                 border: OutlineInputBorder(),
// // //               ),
// // //               onChanged: _onSearchChanged,
// // //             ),
// // //           ),
// // //           // Real-time search results using StreamBuilder
// // //           Expanded(
// // //             child: StreamBuilder<List<Map<String, dynamic>>>(
// // //               stream: _productServices.searchProductStream(
// // //                 _searchQuery,
// // //                 _minPrice,
// // //                 _maxPrice,
// // //               ),
// // //               builder: (context, snapshot) {
// // //                 if (snapshot.connectionState == ConnectionState.waiting) {
// // //                   return const Center(child: CircularProgressIndicator());
// // //                 }
// // //                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
// // //                   return const Center(child: Text("No products found"));
// // //                 }
// // //                 final products = snapshot.data!;
// // //                 return ListView.builder(
// // //                   itemCount: products.length,
// // //                   itemBuilder: (context, index) {
// // //                     final product = products[index];
// // //                     return ListTile(
// // //                       title: Text(product['product'] ?? ''),
// // //                       subtitle: Text(product['brand'] ?? ''),
// // //                       trailing: Text(product['price']?.toString() ?? ''),
// // //                     );
// // //                   },
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // import 'package:iit_marketing/services/product_services.dart'; // adjust the import path
// //
// // class SearchPage extends StatefulWidget {
// //   const SearchPage({Key? key}) : super(key: key);
// //
// //   @override
// //   _SearchPageState createState() => _SearchPageState();
// // }
// //
// // class _SearchPageState extends State<SearchPage> {
// //   final ProductServices _productServices = ProductServices();
// //
// //   String _searchQuery = "";
// //   RangeValues _priceRange = const RangeValues(0, 10000);
// //   Timer? _debounce;
// //
// //   double get _minPrice => _priceRange.start;
// //   double get _maxPrice => _priceRange.end;
// //
// //   // Debounce search input to limit updates
// //   void _onSearchChanged(String value) {
// //     if (_debounce?.isActive ?? false) _debounce!.cancel();
// //     _debounce = Timer(const Duration(milliseconds: 500), () {
// //       setState(() {
// //         _searchQuery = value;
// //       });
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     _debounce?.cancel();
// //     super.dispose();
// //   }
// //
// //   // Price range selection widget
// //   Widget _buildPriceRangeSelector() {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text('Price Range: \$${_minPrice.toInt()} - \$${_maxPrice.toInt()}'),
// //           RangeSlider(
// //             min: 0,
// //             max: 10000,
// //             divisions: 100,
// //             values: _priceRange,
// //             onChanged: (RangeValues values) {
// //               setState(() {
// //                 _priceRange = values;
// //               });
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Search Products")),
// //       body: Column(
// //         children: [
// //           _buildPriceRangeSelector(),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: TextField(
// //               decoration: const InputDecoration(
// //                 labelText: "Search",
// //                 border: OutlineInputBorder(),
// //               ),
// //               onChanged: _onSearchChanged,
// //             ),
// //           ),
// //           Expanded(
// //             child: StreamBuilder<List<Map<String, dynamic>>>(
// //               stream: _productServices.searchProductStream(
// //                 _searchQuery,
// //                 _minPrice,
// //                 _maxPrice,
// //               ),
// //               builder: (context, snapshot) {
// //                 if (snapshot.connectionState == ConnectionState.waiting) {
// //                   return const Center(child: CircularProgressIndicator());
// //                 }
// //                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //                   return const Center(child: Text("No products found"));
// //                 }
// //                 final products = snapshot.data!;
// //                 return ListView.builder(
// //                   itemCount: products.length,
// //                   itemBuilder: (context, index) {
// //                     final product = products[index];
// //                     return _buildProductCard(product);
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildProductCard(Map<String, dynamic> product) {
// //     return Card(
// //       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //       elevation: 3,
// //       child: Container(
// //         padding: const EdgeInsets.all(10),
// //         height: 100, // Fixed height for all cards
// //         child: Row(
// //           children: [
// //             // Text section (title + description)
// //             Expanded(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text(
// //                     product['product'] ?? 'No title',
// //                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                     maxLines: 1,
// //                     overflow: TextOverflow.ellipsis,
// //                   ),
// //                   const SizedBox(height: 5),
// //                   Text(
// //                     product['description'] ?? 'No description available',
// //                     style: const TextStyle(fontSize: 14, color: Colors.grey),
// //                     maxLines: 2,
// //                     overflow: TextOverflow.ellipsis,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(width: 10),
// //             // Image section
// //             if (product['thumbnail'] != null)
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(8),
// //                 child: Image.network(
// //                   product['thumbnail'],
// //                   width: 80,
// //                   height: 80,
// //                   fit: BoxFit.cover,
// //                   errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 80, color: Colors.grey),
// //                 ),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:iit_marketing/services/product_services.dart'; // adjust the import path
//
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   final ProductServices _productServices = ProductServices();
//
//   String _searchQuery = "";
//   double _minPrice = 0;
//   double _maxPrice = 10000;
//   Timer? _debounce;
//
//   final TextEditingController _minPriceController = TextEditingController();
//   final TextEditingController _maxPriceController = TextEditingController();
//
//   @override
//   void dispose() {
//     _debounce?.cancel();
//     _minPriceController.dispose();
//     _maxPriceController.dispose();
//     super.dispose();
//   }
//
//   // Debounce search input to limit updates
//   void _onSearchChanged(String value) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       setState(() {
//         _searchQuery = value;
//       });
//     });
//   }
//
//   // Handle price range input
//   void _onPriceChanged() {
//     double? minPrice = double.tryParse(_minPriceController.text);
//     double? maxPrice = double.tryParse(_maxPriceController.text);
//
//     if (minPrice != null && maxPrice != null && minPrice <= maxPrice) {
//       setState(() {
//         _minPrice = minPrice;
//         _maxPrice = maxPrice;
//       });
//     }
//   }
//
//   // Min & Max Price input fields
//   Widget _buildPriceInputs() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _minPriceController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: "Min Price",
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) => _onPriceChanged(),
//             ),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: TextField(
//               controller: _maxPriceController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: "Max Price",
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) => _onPriceChanged(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Search Products")),
//       body: Column(
//         children: [
//           _buildPriceInputs(), // Min & Max Price Inputs
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 labelText: "Search",
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: _onSearchChanged,
//             ),
//           ),
//           Expanded(
//             child: StreamBuilder<List<Map<String, dynamic>>>(
//               stream: _productServices.searchProductStream(
//                 _searchQuery,
//                 _minPrice,
//                 _maxPrice,
//               ),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(child: Text("No products found"));
//                 }
//                 final products = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: products.length,
//                   itemBuilder: (context, index) {
//                     final product = products[index];
//                     return _buildProductCard(product);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Widget _buildProductCard(Map<String, dynamic> product) {
//   //   return Card(
//   //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//   //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//   //     elevation: 3,
//   //     child: Container(
//   //       padding: const EdgeInsets.all(10),
//   //       height: 100, // Fixed height for all cards
//   //       child: Row(
//   //         children: [
//   //           // Text section (title + description)
//   //           Expanded(
//   //             child: Column(
//   //               crossAxisAlignment: CrossAxisAlignment.start,
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 Text(
//   //                   product['product'] ?? 'No title',
//   //                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//   //                   maxLines: 1,
//   //                   overflow: TextOverflow.ellipsis,
//   //                 ),
//   //                 const SizedBox(height: 5),
//   //                 Text(
//   //                   product['description'] ?? 'No description available',
//   //                   style: const TextStyle(fontSize: 14, color: Colors.grey),
//   //                   maxLines: 2,
//   //                   overflow: TextOverflow.ellipsis,
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //           const SizedBox(width: 10),
//   //           // Image section
//   //           if (product['thumbnail'] != null)
//   //             ClipRRect(
//   //               borderRadius: BorderRadius.circular(8),
//   //               child: Image.network(
//   //                 product['thumbnail'],
//   //                 width: 80,
//   //                 height: 80,
//   //                 fit: BoxFit.cover,
//   //                 errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 80, color: Colors.grey),
//   //               ),
//   //             ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//   Widget _buildProductCard(Map<String, dynamic> product) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 3,
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         height: 120, // Increased height to fit price
//         child: Row(
//           children: [
//             // Text section (title + price + description)
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     product['product'] ?? 'No title',
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     "₹${product['price'] ?? 'Price not available'}", // Display price
//                     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     product['description'] ?? 'No description available',
//                     style: const TextStyle(fontSize: 14, color: Colors.grey),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 10),
//             // Image section
//             if (product['thumbnail'] != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   product['thumbnail'],
//                   width: 80,
//                   height: 80,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 80, color: Colors.grey),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iit_marketing/services/product_services.dart';
import 'package:iit_marketing/views/ItemPage.dart';
import 'package:iit_marketing/views/footer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ProductServices _productServices = ProductServices();

  String _searchQuery = "";
  double _minPrice = 0;
  double _maxPrice = 10000;
  Timer? _debounce;

  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void dispose() {
    _debounce?.cancel();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  // Debounce search input to limit updates
  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _searchQuery = value;
      });
    });
  }

  // Handle price range input
  void _onPriceChanged() {
    double? minPrice = double.tryParse(_minPriceController.text);
    double? maxPrice = double.tryParse(_maxPriceController.text);

    if (minPrice != null && maxPrice != null && minPrice <= maxPrice) {
      setState(() {
        _minPrice = minPrice;
        _maxPrice = maxPrice;
      });
    }
  }

  // Min & Max Price input fields
  Widget _buildPriceInputs() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _minPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Min Price",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _onPriceChanged(),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _maxPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Max Price",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _onPriceChanged(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Search Products")),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildPriceInputs(), // Min & Max Price Inputs
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _productServices.searchProductStream(
                _searchQuery,
                _minPrice,
                _maxPrice,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No products found"));
                }
                final products = snapshot.data!;
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return _buildProductCard(product);
                  },
                );
              },
            ),
          ),
          const FooterWidget(selectedIndex: 1), // Add FooterWidget
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(product: product),
          ),
        );
      },
      child: Card(
        color: Colors.grey[100],
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 120,
          child: Row(
            children: [
              // Text section (title + price + description)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product['product'] ?? 'No title',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "₹${product['price'] ?? 'Price not available'}",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product['description'] ?? 'No description available',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // Image section
              if (product['thumbnail'] != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product['thumbnail'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported, size: 80, color: Colors.grey),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

}
