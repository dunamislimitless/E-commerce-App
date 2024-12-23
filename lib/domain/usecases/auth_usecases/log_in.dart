import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/models/auth_modal/signIn_req.dart';
import 'package:e_commerce_app/data/models/auth_modal/signup_req.dart';
import 'package:e_commerce_app/domain/repository/auth.dart';
import 'package:e_commerce_app/service_locator.dart';

class SignInUsecae implements UseCase<Either, SignInRequest> {
  @override
  Future<Either> call({SignInRequest? param}) {
    return s1<AuthRepository>().logIn(param!);
  }
}
