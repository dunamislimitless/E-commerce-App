import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/models/signup_req.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/data/source/auth_api_service.dart';
import 'package:e_commerce_app/data/source/auth_local_service.dart';
import 'package:e_commerce_app/domain/repository/auth.dart';
import 'package:e_commerce_app/features/authentcation/model/user_model.dart';
import 'package:e_commerce_app/service_locator.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImplementation extends AuthRepository {
  @override
  Future<Either> signUp(SignupRequest signupReq) async {
    Either result = await s1<AuthApiService>().signUp(signupReq);

    return result.fold((error) {
      return Left(error);
    }, (data) async {
      Response response = data;

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      sharedPreferences.setString('token', response.data["access_token"]);

      return Right(response);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await s1<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    Either result = await s1<AuthApiService>().getUser();

    return result.fold((error) {
      return Left(error);
    }, (data) {
      Response response = data;
      var userModel = UserModellls.fromJson(response.data);

      var userEntity = userModel.toEntity();
      return Right(userEntity);
    });
  }
}
