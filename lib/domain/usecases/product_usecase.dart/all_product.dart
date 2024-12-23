import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/models/auth_modal/signup_req.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/domain/repository/auth.dart';
import 'package:e_commerce_app/domain/repository/product.dart';
import 'package:e_commerce_app/service_locator.dart';

class GetProductUsecase implements UseCase<dynamic, List<ProductModal>> {
  @override
  Future<List<ProductModal>> call({dynamic param}) {
    return s1<ProductRepository>().getProduct();
  }
}
