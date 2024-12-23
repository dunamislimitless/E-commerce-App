import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/models/auth_modal/signup_req.dart';
import 'package:e_commerce_app/domain/repository/auth.dart';
import 'package:e_commerce_app/service_locator.dart';

class SignOutUsecase implements UseCase<dynamic, dynamic> {
  @override
  Future call({dynamic param}) async {
    await s1<AuthRepository>().logOut();
  }
}
