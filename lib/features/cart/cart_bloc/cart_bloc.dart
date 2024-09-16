import 'package:e_commerce_app/features/cart/cart_bloc/cart_event.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_state.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/utils/app_ipngs.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(CartStateInit()) {
    on<IncrementEvent>((event, emit) {


      final index = items.indexWhere((e) => e.id == event.id);

      if (index != -1) {
        
        items[index] = items[index].copyWith(initialValue: items[index].itemCount + 1);
      }
      emit(CartStateUpdate());
    });

    on<DecrementEvent>((event, emit) {

      final index = items.indexWhere((e) => e.id == event.id);

      if (index != -1) {
        items[index] = items[index].copyWith(initialValue: items[index].itemCount - 1);

        if( items[index].itemCount<1){
          add(RemoveCartItemEvent(event.id));
        }
      }
      emit(CartStateUpdate());
    });

    on<RemoveCartItemEvent>((event, emit) {

      final index = items.indexWhere((e) => e.id == event.id);

      if (index != -1) {
        items.removeAt(index);
      }
      emit(CartStateUpdate());
    });
      on<AddItemEvent>((event, emit) {
      if (items.where((e) => e.id == event.item.id).isEmpty) {
        items.add(event.item);
      }
      emit(CartStateUpdate());
    });
  }
   final List<FinalCart> items=[
  ];

  }

 