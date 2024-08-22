import 'package:e_commerce_app/features/cart/cart_bloc/cart_event.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_state.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CombinedBloc extends Bloc<CombinedEvent, CombinedState> {
  CombinedBloc(List<FinalCart> product)
      : super(CombinedState(cartItems: product, counter: product.length)) {
    on<IncrementEvent>((event, emit) {
      final updatedItems = List<FinalCart>.from(state.cartItems);
      final currentItem = updatedItems[event.index];
      final updatedItem = FinalCart(
        imagePath: currentItem.imagePath,
        itemDescripton: currentItem.itemDescripton,
        reviews: currentItem.reviews,
        amount: currentItem.amount,
        initialValue: (int.parse(currentItem.initialValue) + 1).toString(),
      );
      updatedItems[event.index] = updatedItem;
      emit(state.copyWith(cartItems: updatedItems));
    });

    on<DecrementEvent>((event, emit) {
      final updatedItems = List<FinalCart>.from(state.cartItems);
      final currentItem = updatedItems[event.index];
      int decrementedValue = int.parse(currentItem.initialValue) - 1;

      if (decrementedValue < 0) {
        decrementedValue = 0;
      }
      final updatedItem = FinalCart(
        imagePath: currentItem.imagePath,
        itemDescripton: currentItem.itemDescripton,
        reviews: currentItem.reviews,
        amount: currentItem.amount,
        initialValue: decrementedValue.toString(),
      );
      updatedItems[event.index] = updatedItem;
      emit(state.copyWith(cartItems: updatedItems));
    });

    on<RemoveCartItemEvent>((event, emit) {
      final updatedItems = List<FinalCart>.from(state.cartItems);
      if (event.index < updatedItems.length) {
        updatedItems.removeAt(event.index);
      }
      emit(state.copyWith(cartItems: updatedItems));
    });
  }
}
