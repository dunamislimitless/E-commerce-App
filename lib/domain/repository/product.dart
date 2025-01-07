import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/product_modal/each_item_req.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';

abstract class ProductRepository {
  Future<({List<ProductModal>? list, String? error})> getProduct();

  Future<List<Category>> getProductCategory();

  Future<Either> getEachProduct(EachProductReq req);
}
