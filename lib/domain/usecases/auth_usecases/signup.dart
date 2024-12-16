import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/models/signup_req.dart';
import 'package:e_commerce_app/domain/repository/auth.dart';
import 'package:e_commerce_app/service_locator.dart';

class SignupCase implements UseCase<Either, SignupRequest> {
  @override
  Future<Either> call({SignupRequest? param}) {
    return s1<AuthRepository>().signUp(param!);
  }
}
