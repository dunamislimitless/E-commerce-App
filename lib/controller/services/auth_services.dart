import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../features/authentcation/model/user_model.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  String? get userId => auth.currentUser?.uid;

  Future<({UserModel? user, String? error})> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required UserModel model}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await auth.currentUser?.reload();
      final updatedUser = model.copyWith(userId: auth.currentUser?.uid);
      await _createProfile(model: updatedUser);

      return (user: updatedUser, error: null);
    } on FirebaseAuthException catch (e) {
      return (user: null, error: e.message.toString());
    } on FirebaseException catch (e) {
      return (user: null, error: e.message.toString());
    } catch (e) {
      return (user: null, error: e.toString());
    }
  }

  Future<({User? user, String? error})> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return (user: userCredential.user, error: null);
    } on FirebaseAuthException catch (e) {
      return (user: null, error: e.message.toString());
    }
  }

  Future<User?> _createProfile({required UserModel model}) async {
    try {
      await firestore.collection("Users").doc(model.userId).set(model.toJson());
    } on FirebaseException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      debugPrint("Sign out not successful");
    }
  }

  Future<UserModel?> getUserProfile(final String userId) async {
    try {
      final doc = await firestore.collection("Users").doc(userId).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      }
    } on FirebaseException catch (e) {
      debugPrint("Failed to fetch user profile: ${e.message}");
    }
    return null;
  }

  // Future<UserModel?> getCurrentUserProfile() async {
  //   final currentUser = auth.currentUser;
  //   final userId = currentUser?.uid;
  //   if (userId != null) {
  //     debugPrint("Fetching profile for userId: $userId");
  //     try {
  //       final doc = await firestore.collection("Users").doc(userId).get();
  //       if (doc.exists) {
  //         return UserModel.fromJson(doc.data()!);
  //       }
  //     } on FirebaseException catch (e) {
  //       debugPrint("Failed to fetch user profile: ${e.message}");
  //     }
  //   }
  //   return null;
  // }
  // //   final userProfile = await getUserProfile(userId);
  // //   debugPrint("Fetched user profile: $userProfile");
  // //   return userProfile;
  // // } else {
  // //   debugPrint("No user is currently signed in.");
  // //   return null;
  Future<UserModel?> getCurrentUserProfile() async {
    final currentUser = auth.currentUser;
    final userId = currentUser?.uid;

    if (userId != null) {
      debugPrint("Fetching profile for userId: $userId");

      try {
        final doc = await firestore.collection("Users").doc(userId).get();

        if (doc.exists) {
          debugPrint("Fetched user profile data: ${doc.data()}");
          return UserModel.fromJson(doc.data()!);
        } else {
          debugPrint("No profile found for userId: $userId");
        }
      } on FirebaseException catch (e) {
        debugPrint("Failed to fetch user profile: ${e.message}");
      } catch (e) {
        debugPrint("Unexpected error: $e");
      }
    } else {
      debugPrint("No authenticated user found.");
    }

    return null;
  }
}
