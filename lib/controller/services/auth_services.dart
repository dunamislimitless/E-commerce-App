import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../features/authentcation/model/user_model.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<({UserModel? user, String? error})> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required UserModel model}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await auth.currentUser?.reload();
      final updatedUser = model.copyWith(userId: auth.currentUser?.uid);
      _createProfile(model: updatedUser);

      return (user: updatedUser, error: null);
    } on FirebaseAuthException catch (e) {
      return (user: null, error: e.message.toString());
    } on FirebaseException catch (e) {
      return (user: null, error: e.message.toString());
    } catch (e) {
      return (user: null, error: e.toString());
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      debugPrint("Unable to log in");
    }
    return null;
  }

  Future<User?> _createProfile({required UserModel model}) async {
    try {
      await firestore.collection("Users").doc(model.userId).set(model.toJson());
    } on FirebaseException catch (e) {
      // Caught an exception from Firebase.
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
}
