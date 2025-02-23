import 'package:flutter/material.dart';
import 'package:iit_marketing/constants/colors.dart';
import 'package:iit_marketing/views/footer.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatPageState();
}

class _ChatPageState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Text("chats", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: Image(image: AssetImage("assets/images/i2.png")).image,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded( // Wrap ListView.builder inside Expanded
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, value) => ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/images/i1.png"),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.green,
                      ),
                    )
                  ],
                ),
                title: Text("Other User"),
                subtitle: Text("Hi, how are you?"),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // CircleAvatar(
                    //   radius: 11,
                    //   backgroundColor: kPrimaryColor,
                    //   child: Text("10", style: TextStyle(color: Colors.white, fontSize: 10)),
                    // ),
                    // SizedBox(height: 8),
                    Text("20:50"),
                  ],
                ),
              ),
            ),
          ),
          FooterWidget(selectedIndex: 3), // Now positioned properly at bottom
        ],
      ),
    );
  }
}
