import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/auth_modal/signIn_req.dart';
import 'package:e_commerce_app/data/models/auth_modal/signup_req.dart';

abstract class AuthRepository {
  Future<Either> signUp(SignupRequest signupReq);

  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> logIn(SignInRequest signInReq);
  Future logOut();
}
