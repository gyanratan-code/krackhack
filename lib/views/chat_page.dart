import 'package:flutter/material.dart';
import 'package:iit_marketing/views/footer.dart';

class ChatPage extends StatelessWidget {
  final List<Map<String, dynamic>> chatUsers = [
    {"name": "Alice", "unread": 2},
    {"name": "Bob", "unread": 0},
    {"name": "Charlie", "unread": 5},
    {"name": "David", "unread": 0},
    {"name": "Eve", "unread": 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded( // FIX: Allow ListView to take remaining space
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: chatUsers.length,
                itemBuilder: (context, index) {
                  var user = chatUsers[index];
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/images/i2.png"),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              user["name"],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          if (user["unread"] > 0) // Show unread badge if messages exist
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                user["unread"].toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            FooterWidget(selectedIndex: 3), // Footer remains at bottom
          ],
        ),
      ),
    );
  }
}