import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/api_urls.dart';
import 'package:e_commerce_app/core/network/dio_client.dart';
import 'package:e_commerce_app/data/models/signup_req.dart';
import 'package:e_commerce_app/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signUp(SignupRequest signupReq);
}

class AuthApiServiceImplement extends AuthApiService {
  @override
  Future<Either> signUp(SignupRequest signupReq) async {
    try {
      var response =
          s1<DioClient>().post(ApiUrls.register, data: signupReq.toJSon());

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
