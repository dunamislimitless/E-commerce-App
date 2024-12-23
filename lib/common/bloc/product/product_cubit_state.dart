import 'package:e_commerce_app/common/bloc/product/product_state.dart';
import 'package:e_commerce_app/domain/usecases/auth_usecases/get_user.dart';
import 'package:e_commerce_app/domain/usecases/product_usecase.dart/all_product.dart';
import 'package:e_commerce_app/features/product/bloc/product_bloc_bloc.dart';

import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoadingState());

  void getAllProduct() async {
    var result = await s1<GetProductUsecase>().call();

    if (result != null) {
      emit(AllProductLoadedState(productModal: result));
    } else {
      emit(ProductFailureState(errorMessage: 'E noWork ooo'));
    }
  }
}
