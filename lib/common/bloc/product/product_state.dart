import 'package:e_commerce_app/domain/entities/product.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class AllProductLoadedState extends ProductState {
  final ProductEntity productEntity;

  AllProductLoadedState({required this.productEntity});
}

class ProductFailureState extends ProductState {
  final String errorMessage;

  ProductFailureState({required this.errorMessage});
}
