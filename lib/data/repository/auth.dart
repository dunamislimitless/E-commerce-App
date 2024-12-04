import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/signup_req.dart';
import 'package:e_commerce_app/data/source/auth_api_service.dart';
import 'package:e_commerce_app/domain/repository/auth.dart';
import 'package:e_commerce_app/service_locator.dart';

class AuthRepositoryImplementation extends AuthRepository {
  @override
  Future<Either> signUp(SignupRequest signupReq) {
    return s1<AuthApiService>().signUp(signupReq);
  }
}
