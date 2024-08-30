import 'package:e_commerce_app/features/cart/cart_bloc/cart_event.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_state.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/utils/app_ipngs.dart';

class CartBloc extends Bloc<CombinedEvent, CartState> {
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
  }

  final List<FinalCart> items=[
    FinalCart(
      id: "id1",
      imagePath: AppImage.headset,
      itemDescripton: 'Wireless Headphone',
      reviews: "(379)",
      amount: '\$65',
      itemCount: 2,
    ),
    FinalCart(
      id: "id2",
      imagePath: AppImage.sneakers,
      itemDescripton: 'Bluetooth Speaker',
      reviews: "(249)",
      amount: '\$40',
      itemCount: 1,
    ),
    FinalCart(
      id: "id3",
      imagePath: AppImage.flower,
      itemDescripton: 'Smart Watch',
      reviews: "(589)",
      amount: '\$120',
      itemCount: 4,
    ),
    FinalCart(
      id: "id4",
      imagePath: AppImage.flower,
      itemDescripton: 'Smart Watch',
      reviews: "(589)",
      amount: '\$120',
      itemCount: 4,
    ),
    FinalCart(
      id: "id5",
      imagePath: AppImage.flower,
      itemDescripton: 'Smart Watch',
      reviews: "(589)",
      amount: '\$120',
      itemCount: 3,
    ),
    FinalCart(
      id: "id6",
      imagePath: AppImage.flower,
      itemDescripton: 'Smart Watch',
      reviews: "(589)",
      amount: '\$120',
      itemCount: 2,
    ),
  ];
}
