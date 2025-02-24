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
      // Add the product and get the document reference
      DocumentReference docRef = await products.add({
        'product': product,
        'brand': brand,
        'price': mrp,
        'uid': uid,
        'categories': categories,
        'thumbnail': thumbnail,
        'image': image,
        'description': description,
        'isSold': isSold,
        'postedAt': postedAt,
      });

      // Update the document with its own docId
      await docRef.update({'docId': docRef.id});

      return "Product added successfully";
    } catch (error) {
      return "Product can't be added";
    }
  }

  Stream<List<Map<String, dynamic>>> searchProductStream(
      String query, double minPrice, double maxPrice) {
    print("Searching for: $query in price range: $minPrice - $maxPrice");

    var queryRef = FirebaseFirestore.instance
        .collection('products')
        .where('price', isGreaterThanOrEqualTo: minPrice)
        .where('price', isLessThanOrEqualTo: maxPrice);

    // If there's no search query, limit the results to 30
    if (query.isEmpty) {
      queryRef = queryRef.limit(30);
    }

    return queryRef.snapshots().map((snapshot) {
      final data = snapshot.docs.map((doc) => doc.data()).toList();

      // Apply text filtering in Dart (case insensitive)
      if (query.isNotEmpty) {
        return data.where((product) {
          final productName =
              product['product']?.toString().toLowerCase() ?? "";
          return productName.contains(query.toLowerCase());
        }).toList();
      }

      return data; // Return limited products if there's no query
    });
  }

  // Get recent products as a real-time stream
  Stream<List<Map<String, dynamic>>> getRecentProductsStream() {
    return _firestore
        .collection('products')
        .orderBy('postedAt', descending: true)
        .limit(12)
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
        .limit(30)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList());
  }

  Future<void> buyProduct(String productId, String buyerUid) async {
    final firestore = FirebaseFirestore.instance;
    // Reference to the product document
    DocumentReference productRef =
        firestore.collection('products').doc(productId);

    // Retrieve the product snapshot
    DocumentSnapshot productSnapshot = await productRef.get();
    if (!productSnapshot.exists) {
      throw Exception("Product not found");
    }

    Map<String, dynamic> productData =
        productSnapshot.data() as Map<String, dynamic>;
    // Optionally, check if the product is already sold
    if (productData['isSold'] == true) {
      throw Exception("Product is already sold");
    }

    // Run a transaction to perform all operations atomically
    await firestore.runTransaction((transaction) async {
      // Update the product document
      transaction.update(productRef, {
        'isSold': true,
        'bought': FieldValue.increment(1),
      });

      // Get the seller's UID from the product data
      String sellerUid = productData['uid'];
      // Reference to the seller's user document
      DocumentReference sellerRef =
          firestore.collection('users').doc(sellerUid);
      // Update the seller's document: decrement pending and increment sold counts
      transaction.update(sellerRef, {
        'pending': FieldValue.increment(-1),
        'sold': FieldValue.increment(1),
      });

      // Create an order record with details of the transaction
      DocumentReference orderRef = firestore.collection('orders').doc();
      transaction.set(orderRef, {
        'product_id': productId,
        'seller_uid': sellerUid,
        'buyer_uid': buyerUid,
        'timestamp': FieldValue.serverTimestamp(),
      });
    });
  }
}
