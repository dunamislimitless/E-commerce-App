import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/api_urls.dart';
import 'package:e_commerce_app/core/network/dio_client.dart';
import 'package:e_commerce_app/data/models/auth_modal/signup_req.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductApiService {
  Future<List<ProductModal>> getProduct();
  Future<Either> getEachProduct(String id);
}

class ProductApiServiceImplement extends ProductApiService {
  @override
  Future<List<ProductModal>> getProduct() async {
    try {
      SharedPreferences sharedPrefrences =
          await SharedPreferences.getInstance();
      final token = sharedPrefrences.get('token');
      debugPrint("THIS IS TOKENNNNN $token");

      var response = await s1<DioClient>().get(ApiUrls.getProduct,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      debugPrint("ResSSS ${response.realUri}");

      final data = response.data;

      if (data is List) {
        return data.map((json) => ProductModal.fromJson(json)).toList();
      } else {
        debugPrint("Data is not in expected list format.");
        return [];
      }
    } on DioException catch (e) {
      debugPrint("DioException: ${e.response?.realUri}");

      return [];
    }
  }

  @override
  Future<Either> getEachProduct(String id) async {
    try {
      SharedPreferences sharedPrefrences =
          await SharedPreferences.getInstance();
      final token = sharedPrefrences.get('token');
      var response = await s1<DioClient>().get(ApiUrls.getOneProduct(id),
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
