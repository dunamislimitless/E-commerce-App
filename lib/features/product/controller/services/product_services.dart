import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductServices {
  final _fireCloud = FirebaseFirestore.instance.collection("product");
  Future<void> create(
      {required String name,
      required num price,
      required String description,
      required String image}) async {
    try {
      await _fireCloud.add({
        "product_description": description,
        "product_image": image,
        "product_name": name,
        "product_price": price
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}' : ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
