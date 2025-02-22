import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductServices {
  // add product in product collection
  Future<String> addProduct(
      String product,
      String brand,
      double? mrp,
      String uid,
      String? categories,
      String thumbnail,
      List<String> image,
      String description,
      Timestamp postedAt,
      bool isSold) async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    try {
      await products.add({
        'product': product,
        'brand': brand,
        'price': mrp,
        'uid': uid,
        'categories': categories,
        'thumbnail': thumbnail,
        'image': image,
        'description': description,
        'isSold': false
      });
      return "product added successfully";
    } catch (error) {
      return "Product can't be added";
    }
  }

  // search product in product collection
  Future<List<Map<String, dynamic>>> searchProduct(
      String query, double minPrice, double maxPrice) async {
    try {
      CollectionReference products =
          FirebaseFirestore.instance.collection('products');
      QuerySnapshot querySnapshot = await products
          .where('product', isGreaterThanOrEqualTo: query)
          .where('product', isLessThanOrEqualTo: "$query\uf8ff")
          .where('price', isGreaterThanOrEqualTo: minPrice)
          .where('price', isLessThanOrEqualTo: maxPrice)
          .where('isSold', isEqualTo: false)
          .limit(30)
          .get();
      List<Map<String, dynamic>> productList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      return productList;
    } catch (error) {
      print("Error searching product: $error");
      return [];
    }
  }

  // Credible Products
  Future<List<Map<String, dynamic>>> getCredibleProducts() async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      CollectionReference products =
          FirebaseFirestore.instance.collection('products');
      QuerySnapshot userSnapshot =
          await users.orderBy('rating', descending: true).limit(10).get();

      List<String> topUserIds = userSnapshot.docs.map((doc) => doc.id).toList();
      if (topUserIds.isEmpty) return [];
      // Get products from top users
      QuerySnapshot productSnapshot =
          await products.where('uid', whereIn: topUserIds).limit(15).get();
      List<Map<String, dynamic>> productList = productSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      return productList;
    } catch (error) {
      print("Error fetching credible products: $error");
      return [];
    }
  }

  // 10 recent Products
  Future<List<Map<String, dynamic>>> getRecentProducts() async {
    try {
      CollectionReference products =
          FirebaseFirestore.instance.collection('products');
      QuerySnapshot querySnapshot = await products
          .orderBy('postedAt', descending: true) // Order by timestamp
          .limit(10)
          .get();
      List<Map<String, dynamic>> productList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      return productList;
    } catch (error) {
      print("Error fetching recent products: $error");
      return [];
    }
  }
}
