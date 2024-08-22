import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';

class CombinedState {
  final List<FinalCart> cartItems;
  final int counter;

  CombinedState({required this.cartItems, required this.counter});

  CombinedState copyWith({List<FinalCart>? cartItems, int? counter}) {
    return CombinedState(
      cartItems: cartItems ?? this.cartItems,
      counter: counter ?? this.counter,
    );
  }
}
