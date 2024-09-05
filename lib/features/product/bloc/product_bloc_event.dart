// // product_bloc_event.dart
part of 'product_bloc_bloc.dart';

// @immutable
// sealed class ProductBlocEvent {}

// class AddProductToCart extends ProductBlocEvent {
//   final CartItem item;

//   AddProductToCart(this.item);
// }

// class RemoveProductFromCart extends ProductBlocEvent {
//   final CartItem item;

//   RemoveProductFromCart(this.item);
// }

// product_bloc_event.dart

@immutable
abstract class ProductBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToCart extends ProductBlocEvent {
  final CartItem product;
  AddToCart(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends ProductBlocEvent {
  final CartItem product;
  RemoveFromCart(this.product);
  @override
  List<Object> get props => [product];
}
