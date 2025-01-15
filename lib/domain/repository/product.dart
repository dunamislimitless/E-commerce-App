import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';

abstract class ProductRepository {
  Future<({List<ProductModal>? list, String? error})> getProduct();

  Future<({List<Category>? list, String? error})> getCategory();

  Future<({ProductModal? product, String? error})> getEachProduct();
  Future<({List<ProductModal>? list, String? error})> getProductsByCategory(
      {int? id});
}
