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
}
