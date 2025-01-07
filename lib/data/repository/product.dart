import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/models/product_modal/each_item_req.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/data/source/product_api_service.dart';
import 'package:e_commerce_app/domain/repository/product.dart';
import 'package:e_commerce_app/service_locator.dart';

class ProductRepositoryImplementation extends ProductRepository {
  ProductApiServiceImplement service = ProductApiServiceImplement();

  @override
  Future<({List<ProductModal>? list, String? error})> getProduct() async {
    final result = await s1<ProductApiService>().getProduct();

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
  Future<Either> getEachProduct(EachProductReq req) async {
    final result = await service.getEachProduct("${req.idProduct}");
    return result.fold((error) {
      return Left(error);
    }, (data) {
      Response response = data;
      var eachProduct = ProductModal.fromJson(response.data);

      return Right(eachProduct);
    });
  }

  @override
  Future<List<Category>> getProductCategory() async {
    final result = await s1<ProductApiService>().getProductCategory();

    return result;
  }
}
