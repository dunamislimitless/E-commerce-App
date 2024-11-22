import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/authentcation/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ProfileServices {
  Future<UserModel?> getData(String userId) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .get();
      debugPrint("Fetching profile for userId: $userId");
      if (doc.exists) {
        debugPrint("Fetched user profile data: ${doc.data()}");

        final profile = UserModel.fromJson(doc.data()!);
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
