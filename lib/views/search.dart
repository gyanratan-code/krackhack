import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iit_marketing/services/product_services.dart'; // adjust the import path

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ProductServices _productServices = ProductServices();

  String _searchQuery = "";
  RangeValues _priceRange = const RangeValues(0, 10000);
  Timer? _debounce;

  double get _minPrice => _priceRange.start;
  double get _maxPrice => _priceRange.end;

  // Debounce search input to limit updates
  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _searchQuery = value;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  // Price range selection widget
  Widget _buildPriceRangeSelector() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Range: \$${_minPrice.toInt()} - \$${_maxPrice.toInt()}'),
          RangeSlider(
            min: 0,
            max: 10000,
            divisions: 100,
            values: _priceRange,
            onChanged: (RangeValues values) {
              setState(() {
                _priceRange = values;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Products")),
      body: Column(
        children: [
          // Price range selector
          _buildPriceRangeSelector(),
          // Search text field
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
          // Real-time search results using StreamBuilder
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
                    return ListTile(
                      title: Text(product['product'] ?? ''),
                      subtitle: Text(product['brand'] ?? ''),
                      trailing: Text(product['price']?.toString() ?? ''),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
