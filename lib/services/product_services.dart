import 'package:cloud_firestore/cloud_firestore.dart';

class ProductServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add product in product collection
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
        'isSold': false,
        'postedAt': postedAt
      });
      return "Product added successfully";
    } catch (error) {
      return "Product can't be added";
    }
  }

  // Search product in real-time stream
  Stream<List<Map<String, dynamic>>> searchProductStream(
      String query, double minPrice, double maxPrice) {
    Query baseQuery = _firestore
        .collection('products')
        .where('price', isGreaterThanOrEqualTo: minPrice)
        .where('price', isLessThanOrEqualTo: maxPrice)
        .where('isSold', isEqualTo: false)
        .limit(30);

    if (query.isNotEmpty) {
      // When filtering by product name, order by the 'product' field.
      baseQuery = baseQuery
          .orderBy('product')
          .where('product', isGreaterThanOrEqualTo: query)
          .where('product', isLessThanOrEqualTo: "$query\uf8ff")
          .limit(30);
    } else {
      // If there's no query, order by 'postedAt' to get recent products.
      baseQuery = baseQuery.orderBy('postedAt', descending: true).limit(10);
    }

    return baseQuery.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList());
  }

  // Get recent products as a real-time stream
  Stream<List<Map<String, dynamic>>> getRecentProductsStream() {
    return _firestore
        .collection('products')
        .orderBy('postedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList());
  }

  // Listen to real-time updates for credible products
  Stream<List<Map<String, dynamic>>> getCredibleProductsStream() {
    return _firestore
        .collection('products')
        .where('isSold', isEqualTo: false)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList());
  }
}
