import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      "title": "Nike Running Shoes",
      "description": "Lightweight and comfortable running shoes.",
      "price": "₹4,999",
      "image": "assets/images/i1.png"
    },
    {
      "title": "Wireless Headphones",
      "description": "Noise-canceling over-ear headphones.",
      "price": "₹7,999",
      "image": "assets/images/i2.png"
    },
    {
      "title": "Leather Wallet",
      "description": "Genuine leather wallet with multiple compartments.",
      "price": "₹1,499",
      "image": "assets/images/i3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text("Orders"),
      ),
      body: orders.isEmpty
          ? Center(
        child: Text(
          "No items in the orders",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Ensures text aligns at the top
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order["title"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          order["description"]!,
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey[600]),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8), // Replaces Spacer()
                        Text(
                          order["price"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      order["image"]!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
