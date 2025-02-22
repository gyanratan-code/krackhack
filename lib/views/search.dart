import 'package:flutter/material.dart';
import 'package:iit_marketing/views/footer.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> allItems = [
    "Apple", "Banana", "Orange", "Grapes", "Mango", "Pineapple", "Strawberry", "Blueberry"
  ];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
    _searchController.addListener(_filterResults);
  }

  void _filterResults() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = allItems
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensure proper background color
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          cursorColor: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Spacer(),
          FooterWidget(selectedIndex: 1),
        ],
      )

    );
  }
}
