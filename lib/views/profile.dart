import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iit_marketing/views/ItemPage.dart';
import 'package:iit_marketing/views/footer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Reference to the current user's document in the 'users' collection.
    final userDocRef = FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Matches UI
        elevation: 0, // Removes shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.menu, color: Colors.black, size: 32),
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
                    // Profile Header
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                    SizedBox(height: 16),
                    // FutureBuilder to fetch and display stats, name, and bio
                    FutureBuilder<DocumentSnapshot>(
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
                        // Extract data from the Firestore document
                        Map<String, dynamic> userData =
                            snapshot.data!.data() as Map<String, dynamic>;
                        String name = userData['name'] ?? "No Name";
                        String bio = userData['bio'] ?? "No bio available";
                        String pending = (userData['pending'] ?? 0).toString();
                        String bought = (userData['bought'] ?? 0).toString();
                        String sold = (userData['sold'] ?? 0).toString();

                        return Column(
                          children: [
                            // Stats Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                profileStat(pending, "Items Pending"),
                                profileStat(bought, "Items Bought"),
                                profileStat(sold, "Items Sold"),
                              ],
                            ),
                            SizedBox(height: 18),
                            // Bio Section
                            Column(
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
                              ],
                            ),
                          ],
                        );
                      },
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
                                    // You can add toggle functionality here if needed.
                                  },
                                  child: Column(
                                    children: [
                                      Text("Sell",
                                          style: TextStyle(
                                              fontSize: 18,
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
                                width: screenWidth,
                                height: 3,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Products List (Sell Items) fetched from Firestore
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .where('uid', isEqualTo: _auth.currentUser!.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Text("Error fetching products");
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Text("No products found");
                        }
                        final products = snapshot.data!.docs;
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.all(8),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final productData =
                                products[index].data() as Map<String, dynamic>;
                            final title = productData['product'] ?? "No Title";
                            // Get the image URL; if none is provided, default to a local asset
                            final imageUrl = productData['thumbnail'] ??
                                'assets/images/i4.png';
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ItemPage(product: productData),
                                  ),
                                );
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
                                          // Use NetworkImage if the imageUrl starts with 'http', otherwise use AssetImage
                                          image: imageUrl.startsWith('http')
                                              ? NetworkImage(imageUrl)
                                              : AssetImage(imageUrl)
                                                  as ImageProvider,
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
