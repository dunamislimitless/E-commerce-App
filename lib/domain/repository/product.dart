import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/signup_req.dart';

abstract class Repository {
  Future<Either> signUp(SignupRequest signupReq);

  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
