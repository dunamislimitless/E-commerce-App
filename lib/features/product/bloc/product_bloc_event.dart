part of 'product_bloc_bloc.dart';

abstract class ProductBlocEvent {}

class SelectProductEvent extends ProductBlocEvent {
  final FinalCart product;

  SelectProductEvent({required this.product});
}

class AddProductEvent extends ProductBlocEvent {
  final num price;
  final String name;
  final String description;
  final String image;

  AddProductEvent(
      {required this.name,
      required this.description,
      required this.image,
      required this.price});
}

class UploadImageEvent extends ProductBlocEvent {
  final File? image;

  UploadImageEvent({required this.image});
}
