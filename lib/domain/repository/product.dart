import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/auth_modal/signup_req.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';

abstract class ProductRepository {
  Future<List<ProductModal>> getProduct();
}
