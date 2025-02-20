import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/data/source/product_api_service.dart';
import 'package:e_commerce_app/domain/repository/product.dart';
import 'package:e_commerce_app/service_locator.dart';

class ProductRepositoryImplementation extends ProductRepository {
  ProductApiServiceImplement service = ProductApiServiceImplement();

  @override
  Future<({List<ProductModal>? list, String? error})> getProduct() async {
    final result = await service.getProduct();

    if (result.data != null) {
      return (
        list: List<ProductModal>.from((result.data as List<dynamic>)
            .map((e) => ProductModal.fromJson(e))),
        error: null
      );
    } else {
      return (list: null, error: result.error);
    }

    // return result;
  }

  @override
  Future<({ProductModal? product, String? error})> getEachProduct(
      {String? id}) async {
    final result = await service.getEachProduct();

    if (result.data != null) {
      return (product: ProductModal.fromJson(result.data), error: null);
    } else {
      return (product: null, error: result.error);
    }
  }

  @override
  Future<({List<Category>? list, String? error})> getCategory() async {
    final result = await service.getCategory();
    if (result.data != null) {
      return (
        list: List<Category>.from(
            (result.data as List<dynamic>).map((e) => Category.fromJson(e))),
        error: null
      );
    } else {
      return (list: null, error: result.error);
    }

    // return result;
  }

  @override
  Future<({String? error, List<ProductModal>? list})> getProductsByCategory(
      {int? id}) async {
    final result = await service.getProductsByCategory(id: id);
    if (result.data != null) {
      return (
        list: List<ProductModal>.from((result.data as List<dynamic>)
            .map((e) => ProductModal.fromJson(e))),
        error: result.error
      );
    } else {
      return (list: null, error: result.error);
    }
  }
}
