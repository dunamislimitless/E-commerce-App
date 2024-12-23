import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/data/source/product_api_service.dart';
import 'package:e_commerce_app/domain/repository/product.dart';
import 'package:e_commerce_app/service_locator.dart';

class ProductRepositoryImplementation extends ProductRepository {
  @override
  Future<List<ProductModal>> getProduct() async {
    final result = await s1<ProductApiService>().getProduct();

    return result;
  }
}
