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
        "categories": product.categories,
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

  Future<FinalCart?> getData(String userId) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .get();
      debugPrint("Fetching profile for userId: $userId");
      if (doc.exists) {
        debugPrint("Fetched user profile data: ${doc.data()}");

        final profile = FinalCart.fromJson(doc.data()!);
        debugPrint("Fetched user profile data: ${doc.data()}");

        debugPrint('Fetched profile: $profile');
        return profile;
      } else {
        debugPrint("No profile found for userId: $userId");
        return null;
      }
    } on FirebaseException catch (e) {
      debugPrint("Failed with Error '${e.code}': '${e.message}'");
      return null;
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return null;
    }
  }
}
