import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String content;

  const DetailPage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), // Title color set to black for visibility
        backgroundColor: Colors.white, // Set the background color of the AppBar to white
        elevation: 0, // Optional: Remove shadow under the AppBar
      ),

      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
