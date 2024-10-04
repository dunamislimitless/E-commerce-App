import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
import 'package:meta/meta.dart';

part 'product_bloc_event.dart';
part 'product_bloc_state.dart';

class ProductBlocBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  ProductBlocBloc() : super(ProductBlocInitial()) {
    on<SelectProductEvent>(_selectItem);
  }

  FinalCart? product;

  void _selectItem(SelectProductEvent event, Emitter<ProductBlocState> emit) {
    product = event.product;
    emit(SelectProduct());
  }
}
