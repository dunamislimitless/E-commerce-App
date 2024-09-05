import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/product/models/product_cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_bloc_event.dart';
part 'product_bloc_state.dart';

// class ProductBlocBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
//   ProductBlocBloc() : super(ProductInitialState()) {
//     on<AddProductToCart>(_onAddProductToCart);
//     on<RemoveProductFromCart>(_onRemoveProductFromCart);
//   }

//   void _onAddProductToCart(
//       AddProductToCart event, Emitter<ProductBlocState> emit) {
//     if (state is CartUpdatedState) {
//       final currentState = state as CartUpdatedState;
//       final updatedItems = List<CartItem>.from(currentState.selectedItems)
//         ..add(event.item);
//       emit(CartUpdatedState(updatedItems));
//     } else {
//       emit(CartUpdatedState([event.item]));
//     }
//   }

//   void _onRemoveProductFromCart(
//       RemoveProductFromCart event, Emitter<ProductBlocState> emit) {
//     if (state is CartUpdatedState) {
//       final currentState = state as CartUpdatedState;
//       final updatedItems = List<CartItem>.from(currentState.selectedItems)
//         ..remove(event.item);
//       emit(CartUpdatedState(updatedItems));
//     }
//   }
// }

class ProductBlocBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  ProductBlocBloc() : super(ProductBlocState([])) {
    on<ProductBlocEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(
      ProductBlocEvent event, Emitter<ProductBlocState> emit) async {
    if (event is AddToCart) {
      final updatedCart = List<CartItem>.from(state.cartItems)
        ..add(event.product);

      emit(ProductBlocState(updatedCart));
    } else if (event is RemoveFromCart) {
      final updatedCart = List<CartItem>.from(state.cartItems)
        ..remove(event.product);
      emit(ProductBlocState(updatedCart));
    }
  }
}
