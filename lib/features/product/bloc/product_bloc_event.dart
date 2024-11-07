part of 'product_bloc_bloc.dart';

abstract class ProductBlocEvent {}

class SelectProductEvent extends ProductBlocEvent {
  final FinalCart product;

  SelectProductEvent({required this.product});
}

class AddProductImageEvent extends ProductBlocEvent {
  final File? image;

  AddProductImageEvent({required this.image});
}

class UploadImageEvent extends ProductBlocEvent {
  final File? image;

  UploadImageEvent({required this.image});
}
