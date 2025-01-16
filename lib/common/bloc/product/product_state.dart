import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/domain/entities/product.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class AllProductLoadedState extends ProductState {
  // final List<ProductEntity productEntity;
  final List<ProductModal> productModal;

  AllProductLoadedState({required this.productModal});
}

class CategoryProductState extends ProductState {
  final List<ProductModal> productModal;

  CategoryProductState({required this.productModal});
}

class ProductLoadedState extends ProductState {
  final ProductModal? producttModal;

  ProductLoadedState({required this.producttModal});
}

class CategoryLoadedState extends ProductState {
  final List<Category> category;

  CategoryLoadedState({required this.category});
}

class ProductFailureState extends ProductState {
  final String errorMessage;

  ProductFailureState({required this.errorMessage});
}

class SelectProductState extends ProductState {
  final ProductModal product;

  SelectProductState({required this.product});
}
