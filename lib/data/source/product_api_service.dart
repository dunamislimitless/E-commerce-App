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
        return []; // Return an empty list if data is not a list
      }
    } on DioException catch (e) {
      debugPrint("DioException: ${e.response?.realUri}");
      // Handle error properly: Either return an empty list or rethrow the error
      return []; // Returning an empty list in case of an error
    }
  }
}
