import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/models/auth_modal/signIn_req.dart';
import 'package:e_commerce_app/data/models/auth_modal/signup_req.dart';
import 'package:e_commerce_app/data/models/auth_modal/user_model.dart';
import 'package:e_commerce_app/data/source/auth_api_service.dart';
import 'package:e_commerce_app/data/source/auth_local_service.dart';
import 'package:e_commerce_app/domain/repository/auth.dart';
import 'package:e_commerce_app/features/authentcation/model/user_model.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImplementation extends AuthRepository {
  AuthApiServiceImplement api = AuthApiServiceImplement();
  @override
  Future<Either> signUp(SignupRequest signupReq) async {
    Either result = await api.signUp(signupReq);

    print('HALA ${signupReq.toJSon()}');

    return result.fold((error) {
      debugPrint(" Error $error");
      return Left(error);
    }, (data) async {
      Response response = data;
    

      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();

      //  sharedPreferences.setString('token', response.data["access_token"]);

      return Right(response);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await locator<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    Either result = await api.getUser();

    return result.fold((error) {
      return Left(error);
    }, (data) {
      Response response = data;
      var userModel = UserModellls.fromJson(response.data);

      return Right(userModel);



    });
  }

  @override
  Future<Either> logIn(SignInRequest signInReq) async {
    Either result = await api.logIn(signInReq);

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
  Future logOut() async {
    await locator<AuthLocalService>().logOut();
  }
}
