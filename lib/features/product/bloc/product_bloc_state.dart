// // product_bloc_state.dart
part of 'product_bloc_bloc.dart';

// @immutable
// sealed class ProductBlocState {}

// class ProductInitialState extends ProductBlocState {}

// class CartUpdatedState extends ProductBlocState {
//   final List<CartItem> selectedItems;

//   CartUpdatedState(this.selectedItems);
// }
class ProductBlocState {
  final List<CartItem> cartItems;
  ProductBlocState(this.cartItems);
}
