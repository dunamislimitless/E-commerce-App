import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/api_urls.dart';
import 'package:e_commerce_app/core/network/dio_client.dart';
import 'package:e_commerce_app/data/models/auth_modal/signIn_req.dart';
import 'package:e_commerce_app/data/models/auth_modal/signup_req.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthApiService {
  Future<Either> signUp(SignupRequest signupReq);
  Future<Either> getUser();
  Future<Either> logIn(SignInRequest signInReq);
}

class AuthApiServiceImplement extends AuthApiService {
  @override
  Future<Either> signUp(SignupRequest signupReq) async {
    try {
      var response = await locator<DioClient>()
          .post(ApiUrls.register, data: signupReq.toJSon());
      print(signupReq.toJSon());

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      SharedPreferences sharedPrefrences =
          await SharedPreferences.getInstance();
      final token = sharedPrefrences.get('token');
      var response = await locator<DioClient>().get(ApiUrls.userProfile,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> logIn(SignInRequest signInReq) async {
    try {
      var response = await locator<DioClient>()
          .post(ApiUrls.signIn, data: signInReq.toJSon());

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
