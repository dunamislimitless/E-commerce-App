part of 'product_bloc_bloc.dart';

abstract class ProductBlocEvent {}

class SelectProductEvent extends ProductBlocEvent {
  final FinalCart product;

  SelectProductEvent({required this.product});
}
