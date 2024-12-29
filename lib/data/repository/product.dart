import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/models/product_modal/each_item_req.dart';
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

  @override
  Future<Either> getEachProduct(EachProductReq req) async {
    ProductApiServiceImplement service = ProductApiServiceImplement();

    final result = await service.getEachProduct("${req.idProduct}");
    return result.fold((error) {
      return Left(error);
    }, (data) {
      Response response = data;
      var eachProduct = ProductModal.fromJson(response.data);

      return Right(eachProduct);
    });
  }
}
