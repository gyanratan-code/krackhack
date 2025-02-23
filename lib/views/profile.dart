import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iit_marketing/views/footer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Tracks selected tab
  bool isBuySelected = true;

  // Sample Data for posts
  final List<String> buyPosts =
      List.generate(5, (index) => "Buy Item ${index + 1}");
  final List<String> sellPosts =
      List.generate(5, (index) => "Sell Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Create a reference to the user's document in the 'users' collection.
    final userDocRef = FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Matches UI
        elevation: 0, // Removes shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 32,
              ),
            ),
            onPressed: () {
              // Add functionality here (e.g., open drawer or menu)
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        // Profile Header
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("assets/images/user.png"),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            profileStat("2", "Items Pending"),
                            profileStat("4", "Items Bought"),
                            profileStat("3", "Items Sold"),
                          ],
                        ),
                        SizedBox(height: 18),

                        // Bio Section: Fetch name and bio from Firestore
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: FutureBuilder<DocumentSnapshot>(
                            future: userDocRef.get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              if (snapshot.hasError) {
                                return Text("Error loading profile");
                              }
                              if (!snapshot.hasData || !snapshot.data!.exists) {
                                return Text("User data not found");
                              }
                              // Extract data from the document
                              Map<String, dynamic> userData =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              String name = userData['name'] ?? "No Name";
                              String bio =
                                  userData['bio'] ?? "No bio available";

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(height: 4),
                                  Text(bio),
                                  // You can add more fields (e.g., website) if available
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10),

                        // Buy & Sell Toggle with Underline
                        Container(
                          width: screenWidth,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isBuySelected = true;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Text("Buy",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isBuySelected = false;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Text("Sell",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: screenWidth,
                                    height: 3,
                                    color: Colors.grey.shade300,
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    width: screenWidth / 2,
                                    height: 3,
                                    color: Colors.black,
                                    transform: Matrix4.translationValues(
                                        isBuySelected ? 0 : screenWidth / 2,
                                        0,
                                        0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Posts List (Scrollable)
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(8),
                      itemCount:
                          isBuySelected ? buyPosts.length : sellPosts.length,
                      itemBuilder: (context, index) {
                        String title =
                            isBuySelected ? buyPosts[index] : sellPosts[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/itemPage");
                          },
                          child: Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/i4.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    title,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Persistent Footer
            Container(
              height: 60,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FooterWidget(selectedIndex: 4),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileStat(String count, String label) {
    return Column(
      children: [
        Text(count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 15)),
      ],
    );
  }
}
