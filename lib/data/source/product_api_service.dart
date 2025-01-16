import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constants/api_urls.dart';
import 'package:e_commerce_app/core/network/dio_client.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductApiService {
  Future<({dynamic data, String? error})> getProduct();

  Future<({dynamic data, String? error})> getEachProduct();

  Future<({dynamic data, String? error})> getCategory();
  Future<({dynamic data, String? error})> getProductsByCategory();
}

class ProductApiServiceImplement extends ProductApiService {
  final _api = locator<DioClient>();

  @override
  Future<({dynamic data, String? error})> getProduct() async {
    try {
      SharedPreferences sharedPrefrences =
          await SharedPreferences.getInstance();
      final token = sharedPrefrences.get('token');
      debugPrint("THIS IS TOKENNNNN $token");

      var response = await _api.get(ApiUrls.getProduct,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final status = response.statusCode ?? 0;
      if (status > 199 && status < 300) {
        return (data: response.data, error: null);
      } else {
        return (data: null, error: "Data is not in expected list format.");
      }

      // final data = response.data;
      //
      // if (data is List) {
      //   return (
      //     list: data.map((json) => ProductModal.fromJson(json)).toList(),
      //     error: null
      //   );
      // } else {
      //   return (list: null, error: "Data is not in expected list format.");
      // }
    } on DioException catch (e) {
      debugPrint("DioException: ${e.response?.realUri}");

      return (data: null, error: "DioException: ${e.response?.realUri}");
    }
  }

  @override
  Future<({dynamic data, String? error})> getEachProduct({String? id}) async {
    try {
      SharedPreferences sharedPrefrences =
          await SharedPreferences.getInstance();
      final token = sharedPrefrences.get('token');

      var response = await _api.get("${ApiUrls.getOneProduct}$id",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      final status = response.statusCode ?? 0;
      if (status > 199 && status < 300) {
        return (data: response.data, error: null);
      } else {
        return (data: null, error: "Data is not in expected list format.");
      }
    } on DioException catch (e) {
      debugPrint("DioException: ${e.response?.realUri}");

      return (data: null, error: "DioException: ${e.response?.realUri}");
    }
  }

  @override
  Future<({dynamic data, String? error})> getCategory() async {
    try {
      SharedPreferences sharedPrefrences =
          await SharedPreferences.getInstance();
      final token = sharedPrefrences.get('token');
      debugPrint("THIS IS TOKENNNNN $token");

      var response = await locator<DioClient>().get(ApiUrls.getCategory,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final status = response.statusCode ?? 0;

      if (status > 199 && status < 300) {
        return (data: response.data, error: null);
      } else {
        return (data: null, error: "Data is not in expected list format.");
      }

      // final data = response.data;
      //
      // if (data is List) {
      //   return (
      //     list: data.map((json) => ProductModal.fromJson(json)).toList(),
      //     error: null
      //   );
      // } else {
      //   return (list: null, error: "Data is not in expected list format.");
      // }
    } on DioException catch (e) {
      debugPrint("DioException: ${e.response?.realUri}");

      return (data: null, error: "DioException: ${e.response?.realUri}");
    }
  }

  @override
  Future<({dynamic data, String? error})> getProductsByCategory(
      {String? id}) async {
    try {
      SharedPreferences sharedPrefrences =
          await SharedPreferences.getInstance();
      final token = sharedPrefrences.get('token');

      var response = await locator<DioClient>().get(
          "${ApiUrls.getCategory}$id/products",
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final status = response.statusCode ?? 0;

      if (status > 199 && status < 300) {
        return (data: response.data, error: null);
      } else {
        return (data: null, error: "Data is not in expected list format.");
      }
    } on DioException catch (e) {
      debugPrint("DioException: ${e.response?.realUri}");

      return (data: null, error: "DioException: ${e.response?.realUri}");
    }
  }
}
