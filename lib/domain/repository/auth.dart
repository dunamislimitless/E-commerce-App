import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/signup_req.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignupRequest signupReq);
}
