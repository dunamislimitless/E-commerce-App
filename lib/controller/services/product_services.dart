import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
import 'package:flutter/foundation.dart';

class ProductServices {
  final _fireCloud = FirebaseFirestore.instance.collection("product");
  Future<void> create({required FinalCart product}) async {
    try {
      await _fireCloud.add({
        "amount": product.amount,
        "id": product.id,
        "image_path": product.imagePath,
        "item_count": product.itemCount,
        "item_description": product.itemDescription,
        "categories": product.category,
        "reviews": product.reviews,
        "time_created": FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}' : ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FinalCart>> getproductData() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection("product").get();
      if (querySnapshot.docs.isNotEmpty) {
        debugPrint("Fetched product data: $querySnapshot");
        debugPrint(
            "Fetched product data: ${querySnapshot.docs.length} documents");

        final productList = querySnapshot.docs
            .map((doc) => FinalCart.fromJson(doc.data()))
            .toList();

        debugPrint('Fetched product: $productList');
        return productList;
      }
    } on FirebaseException catch (e) {
      debugPrint("Failed with Error '${e.code}': '${e.message}'");
      rethrow;
    } catch (e) {
      debugPrint("Unexpected error: $e");
      rethrow;
    }
    return [];
  }

  Future<void> uploadCartItems(List<FinalCart> cart) async {
    final collectionRef = FirebaseFirestore.instance.collection('product');

    WriteBatch batch = FirebaseFirestore.instance.batch();

    for (var item in cart) {
      final docRef =
          collectionRef.doc(item.id); // Use item's ID as the document ID
      batch.set(docRef, item.toJson());
    }

    try {
      await batch.commit();
      print("Cart items uploaded successfully!");
    } catch (e) {
      print("Failed to upload cart items: $e");
    }
  }
}
