import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserServices {
  final _fireCloud = FirebaseFirestore.instance.collection("Users");
  Future<void> create({
    required String firstName,
    required String lastName,
    required String occupation,
    required String gender,
    required String phoneNumber,
    required String email,
  }) async {
    try {
      await _fireCloud.add({
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": gender,
        "occupation": occupation,
        "phone_number": phoneNumber,
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
}
