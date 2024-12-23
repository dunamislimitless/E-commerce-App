import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';

abstract class CartEvent {}

class IncrementEvent extends CartEvent {
  final String id;

  IncrementEvent(this.id);
}

class DecrementEvent extends CartEvent {
  final String id;

  DecrementEvent(this.id);
}

class RemoveCartItemEvent extends CartEvent {
  final String id;

  RemoveCartItemEvent(this.id);
}

class AddItemEvent extends CartEvent {
  final ProductModal item;

  AddItemEvent({required this.item});
}
