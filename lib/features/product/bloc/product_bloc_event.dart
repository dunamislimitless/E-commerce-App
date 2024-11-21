part of 'product_bloc_bloc.dart';

abstract class ProductBlocEvent {}

class SelectProductEvent extends ProductBlocEvent {
  final FinalCart product;

  SelectProductEvent({required this.product});
}

class AddProductEvent extends ProductBlocEvent {
  final FinalCart product;

  AddProductEvent({required this.product});
}

class UploadImageEvent extends ProductBlocEvent {
  final File? image;

  UploadImageEvent({required this.image});
}
