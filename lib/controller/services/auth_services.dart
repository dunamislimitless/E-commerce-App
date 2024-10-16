

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthService {

  final auth = FirebaseAuth.instance;
Future<User?> createUserWithEmailAndPassword(String email, String password,)async {

  try{
 final userCredential= await auth.createUserWithEmailAndPassword(email: email, password: password);
return userCredential.user;
}catch(e){
 debugPrint("Unable to Create User");
}
return null;
}

Future<User?> signInWithEmailAndPassword(String email, String password, String name)async {

  try{
 final userCredential= await auth.signInWithEmailAndPassword(email: email, password: password);
return userCredential.user;
}catch(e){
 debugPrint("Unable to log in");
}
return null;
}

Future<void> signOut()async{
  try{
    await auth.signOut(); }catch(e){
      debugPrint("Sign out not successful");
    }
}
}
